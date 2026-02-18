#!/usr/bin/env python3
"""
MRA2 Optimal Password Generator

Given a target breed (main + sub) and optional trait, brute-forces passwords to
find the one that produces the highest total stat delta from the shrine system.

The shrine password system uses four polynomial hash functions to deterministically
map a text password to a monster's breed, stats, and traits. This tool iterates
over candidate passwords, filters by breed/trait, and ranks by stat quality.

Usage:
    python3 tools/shrine_password_gen.py --breed Pixie --sub Dragon --top 10
    python3 tools/shrine_password_gen.py --breed Golem --trait IronHart --top 5
    python3 tools/shrine_password_gen.py --breed Dragon --min-len 3 --max-len 5 --list-traits
    python3 tools/shrine_password_gen.py --analyze "Zulu"
"""

import argparse
import ctypes
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from shrine_data import (
    MAIN_BREED_TABLE,
    SUB_BREED_TABLE,
    STAT_DELTA_TABLE,
    TRAIT_TABLE,
    TECHNIQUE_TABLE,
    BREED_COMBO_MATRIX,
    BREED_BASE_STATS,
    CHAR_TO_CODE,
    CODE_TO_CHAR,
    VALID_CODES,
    BREED_NAMES,
    BREED_ALIASES,
    TRAIT_NAMES,
    TRAIT_NAME_TO_ID,
)

# Try to load the C search engine for fast brute-force
_LIB_PATH = Path(__file__).parent / "shrine_search.so"
_c_lib = None
if _LIB_PATH.exists():
    try:
        _c_lib = ctypes.CDLL(str(_LIB_PATH))
    except OSError:
        pass


# =============================================================================
# Hash Functions (matching ROM ASM exactly)
# =============================================================================

def sign_extend_16(val):
    """Sign-extend a 16-bit value to a Python int (matching ARM lsl #16, asr #16)."""
    val &= 0xFFFF
    if val & 0x8000:
        return val - 0x10000
    return val


def hash_main_breed(char_codes, length):
    """
    Polynomial hash for main breed determination.
    ROM: 0x0801EA6C

    Seed from char[0]. Odd indices multiply, even indices add (sign-extended).
    Returns: main breed ID (0-29) via table lookup.
    """
    accum = (char_codes[0] + 1) & 0xFFFF

    for i in range(1, length):
        char_val = char_codes[i]
        if i & 1:  # odd: multiply
            accum = (accum * (char_val + i + 1)) & 0xFFFF
        else:  # even: sign-extend then add
            accum = (sign_extend_16(accum) + (char_val + i + 1)) & 0xFFFF

    index = (accum - 1) & 0xFF
    return MAIN_BREED_TABLE[index]


def hash_sub_breed_raw(char_codes, length):
    """
    Polynomial hash for sub breed + stat index.
    ROM: 0x0801E7C8

    Seed from char[1]. FLIPPED parity: odd indices ADD, even indices MULTIPLY.
    Returns the raw 16-bit accumulator value (before bit extraction).
    """
    if length <= 1:
        return None  # sub breed fixed to 40 (pure) for 1-char passwords

    accum = (char_codes[1] + 2) & 0xFFFF

    for i in range(2, length):
        char_val = char_codes[i]
        if i & 1:  # odd: add (sign-extended) -- FLIPPED from main breed
            accum = (sign_extend_16(accum) + (char_val + i + 1)) & 0xFFFF
        else:  # even: multiply
            accum = (accum * (char_val + i + 1)) & 0xFFFF

    return (accum - 2) & 0xFFFF


def extract_sub_breed_index(raw):
    """
    Extract 8-bit sub breed table index from raw hash.
    ROM: 0x0801E82C - extracts ODD-positioned bits (1,3,5,...,15).

    The ASM shifts raw right FIRST, then masks with ascending bit weights.
    """
    result = 0
    temp = raw
    weight = 1
    for _ in range(8):
        temp >>= 1  # shift first
        result |= (temp & weight)
        weight <<= 1
    return result & 0xFF


def extract_stat_index(raw):
    """
    Extract 6-bit stat delta table index from raw hash.
    ROM: 0x0801E8EA - extracts EVEN-positioned bits (0,2,4,6,8,10).

    The ASM masks with ascending bit weight FIRST, then shifts raw right.
    """
    result = 0
    temp = raw
    weight = 1
    for _ in range(6):
        result |= (temp & weight)
        temp >>= 1  # shift after
        weight <<= 1
    return result & 0x3F


def compute_sub_breed(char_codes, length, main_breed_id):
    """
    Full sub breed computation with combo validation.
    Returns (sub_breed_id, stat_entry_index, raw_hash).
    """
    if length <= 1:
        return main_breed_id, 0, 0  # pure breed, zero stat entry

    raw = hash_sub_breed_raw(char_codes, length)

    sub_idx = extract_sub_breed_index(raw)
    sub_breed = SUB_BREED_TABLE[sub_idx]

    stat_entry_index = extract_stat_index(raw)

    if sub_breed > 39:
        sub_breed = main_breed_id

    if BREED_COMBO_MATRIX[main_breed_id][sub_breed] == 0:
        sub_breed = main_breed_id

    return sub_breed, stat_entry_index, raw


def compute_stat_deltas(char_codes, length):
    """
    Compute stat delta entry from password.
    ROM: 0x0801E86C

    Uses the same hash as sub breed (same seed, same parity), but extracts
    a 6-bit index into the 64-entry stat delta table.
    """
    if length <= 1:
        return [0] * 13, 0

    raw = hash_sub_breed_raw(char_codes, length)
    stat_idx = extract_stat_index(raw)
    return STAT_DELTA_TABLE[stat_idx], stat_idx


def hash_traits(char_codes, length):
    """
    Polynomial hash for trait assignment from shrine password.
    ROM: 0x0801E960

    Seed from char[2]. Odd indices multiply, even indices add (sign-extended).
    Same parity as main breed hash.
    Returns (trait_id, table_index) where trait_id is looked up from TRAIT_TABLE.
    """
    if length <= 2:
        return 0xFF, 0xFF  # no traits for short passwords

    accum = (char_codes[2] + 3) & 0xFFFF

    for i in range(3, length):
        char_val = char_codes[i]
        if i & 1:  # odd: multiply
            accum = (accum * (char_val + i + 1)) & 0xFFFF
        else:  # even: add (sign-extended)
            accum = (sign_extend_16(accum) + (char_val + i + 1)) & 0xFFFF

    index = (accum - 2) & 0xFF
    return TRAIT_TABLE[index], index


# Backward compatibility alias
hash_techniques = hash_traits


# =============================================================================
# Password Encoding
# =============================================================================

def encode_password(text):
    """Convert ASCII password string to list of GBA character codes."""
    codes = []
    for ch in text:
        if ch not in CHAR_TO_CODE:
            raise ValueError(f"Character '{ch}' not in GBA encoding")
        codes.append(CHAR_TO_CODE[ch])
    return codes


def decode_codes(codes):
    """Convert list of GBA character codes back to ASCII string."""
    return ''.join(CODE_TO_CHAR.get(c, '?') for c in codes)


# =============================================================================
# Full Password Analysis
# =============================================================================

def analyze_password(text):
    """Fully analyze what monster a password produces."""
    codes = encode_password(text)
    length = len(codes)

    main_breed = hash_main_breed(codes, length)
    sub_breed, stat_idx, raw_sub = compute_sub_breed(codes, length, main_breed)
    stat_entry, _ = compute_stat_deltas(codes, length)
    trait_id, trait_idx = hash_traits(codes, length)

    stat_deltas = stat_entry[:6]
    growth_mods = stat_entry[6:12]
    life_mod = stat_entry[12]
    net_stats = sum(stat_deltas)

    # Find the breed record index from combo matrix
    combo_val = BREED_COMBO_MATRIX[main_breed][sub_breed]

    return {
        "password": text,
        "main_breed": main_breed,
        "main_breed_name": BREED_NAMES.get(main_breed, f"?{main_breed}"),
        "sub_breed": sub_breed,
        "sub_breed_name": BREED_NAMES.get(sub_breed, f"?{sub_breed}"),
        "combo_record": combo_val,
        "stat_entry_index": stat_idx,
        "stat_deltas": stat_deltas,
        "stat_labels": ["POW", "INT", "SKI", "SPD", "DEF", "LIF"],
        "growth_mods": growth_mods,
        "life_mod": life_mod,
        "net_stat_delta": net_stats,
        "trait_id": trait_id,
        "trait_name": TRAIT_NAMES.get(trait_id, f"0x{trait_id:02X}"),
        "trait_index": trait_idx,
        # backward compat
        "technique_id": trait_id,
        "technique_index": trait_idx,
    }


# =============================================================================
# Brute-Force Searcher (C-accelerated with Python fallback)
# =============================================================================

def _init_c_engine():
    """Initialize the C search engine with ROM data tables."""
    if _c_lib is None:
        return False

    main_arr = (ctypes.c_uint8 * 256)(*MAIN_BREED_TABLE)
    _c_lib.set_main_breed_table(main_arr, 256)

    sub_arr = (ctypes.c_uint8 * 256)(*SUB_BREED_TABLE)
    _c_lib.set_sub_breed_table(sub_arr, 256)

    flat_stats = []
    for entry in STAT_DELTA_TABLE:
        for v in entry:
            flat_stats.append(v & 0xFF)
    stat_arr = (ctypes.c_int8 * (64 * 13))(*[v if v < 128 else v - 256 for v in flat_stats])
    _c_lib.set_stat_delta_table(stat_arr, 64)

    tech_arr = (ctypes.c_uint8 * 256)(*TRAIT_TABLE)
    _c_lib.set_technique_table(tech_arr, 256)

    flat_combo = []
    for row in BREED_COMBO_MATRIX:
        for v in row:
            flat_combo.append(v)
    combo_arr = (ctypes.c_int16 * (30 * 40))(*flat_combo)
    _c_lib.set_breed_combo(combo_arr)

    codes_arr = (ctypes.c_uint16 * len(VALID_CODES))(*VALID_CODES)
    _c_lib.set_valid_codes(codes_arr, len(VALID_CODES))

    return True


def _c_search(target_main, target_sub, pw_len, top_n):
    """Run a single password-length search using the C engine. Returns list of results."""
    _c_lib.set_top_n(top_n)
    _c_lib.reset_results()

    sub_arg = target_sub if target_sub is not None else -1
    _c_lib.search(target_main, sub_arg, pw_len)

    n = _c_lib.get_num_results()
    checked = _c_lib.get_total_checked()
    matched = _c_lib.get_total_matched()

    results = []
    for i in range(n):
        net = ctypes.c_int()
        codes = (ctypes.c_uint16 * 8)()
        pw_len_out = ctypes.c_int()
        main_b = ctypes.c_uint8()
        sub_b = ctypes.c_uint8()
        stat_idx = ctypes.c_uint8()
        tech_id = ctypes.c_uint8()
        deltas = (ctypes.c_int8 * 6)()

        _c_lib.get_result(i,
                          ctypes.byref(net), codes, ctypes.byref(pw_len_out),
                          ctypes.byref(main_b), ctypes.byref(sub_b),
                          ctypes.byref(stat_idx), ctypes.byref(tech_id), deltas)

        pw_codes = [codes[j] for j in range(pw_len_out.value)]
        pw_text = decode_codes(pw_codes)
        stat_entry = STAT_DELTA_TABLE[stat_idx.value]

        results.append((
            net.value, pw_text, main_b.value, sub_b.value,
            stat_idx.value, stat_entry, tech_id.value
        ))

    return results, checked, matched


def brute_force_search_optimized(target_main, target_sub=None, target_trait=None, max_len=5, min_len=3, top_n=10):
    """
    Brute-force search with C acceleration when available.
    Falls back to pure Python if the shared library isn't compiled.

    target_trait: if set, only return passwords that assign this trait ID.
    """
    use_c = _c_lib is not None and _init_c_engine()
    if use_c and target_trait is None:
        print("  (using C-accelerated search engine)")
    elif use_c and target_trait is not None:
        print("  (using Python search for trait filtering)")
        use_c = False  # C engine doesn't support trait filtering yet

    start_time = time.time()
    all_results = []
    total_checked = 0
    total_matched = 0

    for pw_len in range(min_len, max_len + 1):
        if pw_len < 3:
            continue

        len_start = time.time()

        if use_c:
            results, checked, matched = _c_search(target_main, target_sub, pw_len, top_n)
            all_results.extend(results)
        else:
            results, checked, matched = _python_search(
                target_main, target_sub, target_trait, pw_len, top_n
            )
            all_results.extend(results)

        total_checked += checked
        total_matched += matched
        elapsed = time.time() - len_start
        rate = checked / max(elapsed, 0.001)
        print(f"  Length {pw_len}: {checked:>12,} passwords, {matched:>6,} breed matches, "
              f"{elapsed:.1f}s ({rate:,.0f}/s)")

    # Final sort and trim
    all_results.sort(key=lambda x: -x[0])
    all_results = all_results[:top_n]

    total_time = time.time() - start_time
    print(f"\nTotal: {total_checked:,} passwords checked, {total_matched:,} breed matches, {total_time:.1f}s")

    return all_results


def _python_search(target_main, target_sub, target_trait, pw_len, top_n):
    """Pure Python fallback search for a single password length."""
    codes_arr = VALID_CODES
    results = []
    checked = 0
    matched = 0
    min_net = -999

    main_byte_ok = [False] * 256
    for i in range(256):
        if MAIN_BREED_TABLE[i] == target_main:
            main_byte_ok[i] = True

    _se16 = sign_extend_16
    _ext_sub = extract_sub_breed_index
    _ext_stat = extract_stat_index
    _main_tbl = MAIN_BREED_TABLE
    _sub_tbl = SUB_BREED_TABLE
    _stat_tbl = STAT_DELTA_TABLE
    _combo = BREED_COMBO_MATRIX

    def search(depth, codes, main_acc, sub_acc):
        nonlocal checked, matched, results, min_net

        if depth == pw_len:
            checked += 1
            main_idx = (main_acc - 1) & 0xFF
            if not main_byte_ok[main_idx]:
                return
            main = _main_tbl[main_idx]
            raw_sub = (sub_acc - 2) & 0xFFFF
            sub_tbl_idx = _ext_sub(raw_sub)
            sub_breed = _sub_tbl[sub_tbl_idx]
            if sub_breed > 39:
                sub_breed = main
            elif _combo[main][sub_breed] == 0:
                sub_breed = main
            if target_sub is not None and sub_breed != target_sub:
                return
            matched += 1
            stat_idx = _ext_stat(raw_sub)
            stat_entry = _stat_tbl[stat_idx]
            net = stat_entry[0] + stat_entry[1] + stat_entry[2] + stat_entry[3] + stat_entry[4] + stat_entry[5]

            trait_id, _ = hash_traits(codes, pw_len)
            if target_trait is not None and trait_id != target_trait:
                return

            if len(results) < top_n or net > min_net:
                pw_text = decode_codes(codes)
                results.append((net, pw_text, main, sub_breed, stat_idx, stat_entry, trait_id))
                results.sort(key=lambda x: -x[0])
                if len(results) > top_n:
                    results = results[:top_n]
                if len(results) >= top_n:
                    min_net = results[-1][0]
            return

        for code in codes_arr:
            new_codes = codes + [code]
            i = depth
            if i == 0:
                new_main = (code + 1) & 0xFFFF
                new_sub = sub_acc
            elif i == 1:
                new_main = (main_acc * (code + i + 1)) & 0xFFFF
                new_sub = (code + 2) & 0xFFFF
            elif i & 1:
                new_main = (main_acc * (code + i + 1)) & 0xFFFF
                new_sub = (_se16(sub_acc) + (code + i + 1)) & 0xFFFF
            else:
                new_main = (_se16(main_acc) + (code + i + 1)) & 0xFFFF
                new_sub = (sub_acc * (code + i + 1)) & 0xFFFF
            search(i + 1, new_codes, new_main, new_sub)

    search(0, [], 0, 0)
    return results, checked, matched


# =============================================================================
# Meet-in-the-Middle Solver (delegates to shrine_mitm module)
# =============================================================================

from shrine_mitm import mitm_search as _mitm_search_impl


def _precompute_valid_outputs(target_main, target_sub, target_trait):
    """
    Precompute the set of valid final accumulator values for each hash,
    given the desired breed/sub/trait targets.

    Returns (main_finals, sub_raw_targets, trait_finals) where:
      main_finals: set of 16-bit main_acc values whose low 8 bits map to target breed
      sub_raw_targets: set of 16-bit raw sub_acc values giving desired sub+stat combo
      trait_finals: set of 16-bit trait_acc values whose low 8 bits map to target trait
    """
    # Main: (acc - 1) & 0xFF must index to target_main in MAIN_BREED_TABLE
    main_byte_hits = [i for i in range(256) if MAIN_BREED_TABLE[i] == target_main]
    # Each hit byte can come from any of 256 high-byte values
    main_finals = set()
    for low in main_byte_hits:
        final_low = (low + 1) & 0xFFFF  # acc & 0xFF must equal low+1
        for hi in range(256):
            main_finals.add((hi << 8) | (final_low & 0xFF))

    # Sub: (acc - 2) & 0xFFFF is the raw value; extract sub breed index + stat index
    sub_raw_targets = set()
    for raw in range(65536):
        sbi = extract_sub_breed_index(raw)
        sub_breed = SUB_BREED_TABLE[sbi]
        if sub_breed > 39:
            sub_breed = target_main
        elif BREED_COMBO_MATRIX[target_main][sub_breed] == 0:
            sub_breed = target_main
        if target_sub is not None and sub_breed != target_sub:
            continue
        sub_raw_targets.add(raw)
    # Convert raw -> acc: acc = raw + 2
    sub_finals = set((r + 2) & 0xFFFF for r in sub_raw_targets)

    # Trait: (acc - 2) & 0xFF must index to target_trait in TRAIT_TABLE
    trait_finals = set()
    if target_trait is not None:
        trait_byte_hits = [i for i in range(256) if TRAIT_TABLE[i] == target_trait]
        for low in trait_byte_hits:
            final_low = (low + 2) & 0xFFFF
            for hi in range(256):
                trait_finals.add((hi << 8) | (final_low & 0xFF))
    else:
        trait_finals = None  # no trait constraint

    return main_finals, sub_finals, trait_finals


def _apply_step_forward(ma, sa, ta, ci, i):
    """Apply character ci at position i to all three accumulators (forward)."""
    k = ci + i + 1
    if i & 1:  # odd: main=mul, sub=add, trait=mul
        ma = (ma * k) & 0xFFFF
        sa = (sa + k) & 0xFFFF
        ta = (ta * k) & 0xFFFF
    else:  # even: main=add, sub=mul, trait=add
        ma = (ma + k) & 0xFFFF
        sa = (sa * k) & 0xFFFF
        ta = (ta + k) & 0xFFFF
    return ma, sa, ta


def _invert_step(acc, ci, i, is_mul):
    """
    Invert one hash step. Returns list of possible pre-step accumulator values.
    If the step was multiplication by k: acc_prev * k = acc (mod 65536)
    If the step was addition of k: acc_prev + k = acc (mod 65536)
    """
    k = ci + i + 1
    if is_mul:
        if k % 2 == 1:  # odd: unique inverse
            inv = _mod_inverse_16(k)
            return [(acc * inv) & 0xFFFF]
        else:
            # even multiplier loses information; find all preimages
            # k * x ≡ acc (mod 65536). If k = 2^v * k', solutions are:
            # x ≡ acc * (k')^{-1} (mod 65536 / 2^v) if 2^v | acc, else no solution
            results = []
            for candidate in range(0, 65536, 1):
                if (candidate * k) & 0xFFFF == acc:
                    results.append(candidate)
            return results
    else:
        return [(acc - k) & 0xFFFF]


def _precompute_even_mul_inverses():
    """
    Precompute inverses for all possible even multipliers encountered in the backward
    phase (positions 4-7). Returns dict: (k, acc) -> [preimage, ...].
    Cached at module level to avoid recomputation.
    """
    # Positions 4-7, the multiplier k = c_i + i + 1
    # Main hash: mul at odd positions (5, 7)
    # Sub hash: mul at even positions (4, 6)
    # Trait hash: mul at odd positions (5, 7)
    # So mul positions are 4(sub), 5(main+trait), 6(sub), 7(main+trait)
    # k values: pos4: c+5 (5..77), pos5: c+6 (6..78), pos6: c+7 (7..79), pos7: c+8 (8..80)
    # Even k values need precomputed full inverse tables
    even_inv = {}
    for k in range(2, 82, 2):  # all possible even multipliers
        # Build: acc -> list of x where x*k ≡ acc (mod 65536)
        table = {}
        for x in range(65536):
            a = (x * k) & 0xFFFF
            if a not in table:
                table[a] = []
            table[a].append(x)
        even_inv[k] = table
    return even_inv


# Module-level cache for even multiplier inverse tables
_EVEN_INV = None


def _get_even_inv():
    global _EVEN_INV
    if _EVEN_INV is None:
        _EVEN_INV = _precompute_even_mul_inverses()
    return _EVEN_INV


def _invert_mul(acc, k):
    """Invert a multiplication step: find all x such that x*k ≡ acc (mod 65536)."""
    if k % 2 == 1:
        inv = _mod_inverse_16(k)
        return [(acc * inv) & 0xFFFF]
    else:
        table = _get_even_inv().get(k)
        if table is None:
            return []
        return table.get(acc, [])


def mitm_search(target_main, target_sub=None, target_trait=None, pw_len=8, top_n=10):
    """
    Meet-in-the-middle solver for passwords of a given length.

    Splits the password at the midpoint. Builds a forward hash table from the
    first half, then inverts the second half from desired outputs and matches.

    Returns list of (net_stat, password, main, sub, stat_idx, stat_entry, trait_id).
    """
    if pw_len < 3:
        return []

    VC = VALID_CODES
    split = min(4, pw_len)  # split point: first 'split' chars forward, rest backward

    # For short passwords (3-5), MITM has little benefit; use constrained enumeration
    if pw_len <= 5:
        return _mitm_short(target_main, target_sub, target_trait, pw_len, top_n)

    print(f"  Building forward table (length {split})...", end="", flush=True)
    t0 = time.time()

    # Forward phase: enumerate c0..c_{split-1}
    # State = (main_acc, sub_acc, trait_acc)
    # main starts at c0+1, sub starts at c1+2, trait starts at c2+3
    forward = {}
    fwd_count = 0

    for c0 in VC:
        ma0 = (c0 + 1) & 0xFFFF
        for c1 in VC:
            ma1 = (ma0 * (c1 + 2)) & 0xFFFF
            sa1 = (c1 + 2) & 0xFFFF
            for c2 in VC:
                ma2 = (ma1 + (c2 + 3)) & 0xFFFF
                sa2 = (sa1 * (c2 + 3)) & 0xFFFF
                ta2 = (c2 + 3) & 0xFFFF
                for c3 in VC:
                    ma3 = (ma2 * (c3 + 4)) & 0xFFFF
                    sa3 = (sa2 + (c3 + 4)) & 0xFFFF
                    ta3 = (ta2 * (c3 + 4)) & 0xFFFF
                    state = (ma3, sa3, ta3)
                    if state not in forward:
                        forward[state] = []
                    forward[state].append((c0, c1, c2, c3))
                    fwd_count += 1

    t1 = time.time()
    print(f" {fwd_count:,} combos -> {len(forward):,} unique states ({t1-t0:.1f}s)")

    # Backward phase: enumerate c4..c_{pw_len-1}
    # For each combo, compute the transformation applied to state (ma, sa, ta)
    # then for each valid final output, invert to find required pre-c4 state
    back_len = pw_len - split

    print(f"  Backward search ({len(VC)}^{back_len} = {len(VC)**back_len:,} combos)...", end="", flush=True)
    t2 = time.time()

    results = []
    min_net = -999
    match_count = 0

    def backward_search(depth, back_codes, ma, sa, ta):
        """Recursively enumerate backward chars, tracking hash state."""
        nonlocal results, min_net, match_count

        pos = split + depth  # absolute position in password

        if depth == back_len:
            # Check all three constraints on final state
            main_idx = (ma - 1) & 0xFF
            if MAIN_BREED_TABLE[main_idx] != target_main:
                return

            raw_sub = (sa - 2) & 0xFFFF
            sbi = extract_sub_breed_index(raw_sub)
            sub_breed = SUB_BREED_TABLE[sbi]
            if sub_breed > 39:
                sub_breed = target_main
            elif BREED_COMBO_MATRIX[target_main][sub_breed] == 0:
                sub_breed = target_main
            if target_sub is not None and sub_breed != target_sub:
                return

            trait_idx = (ta - 2) & 0xFF
            trait_id = TRAIT_TABLE[trait_idx]
            if target_trait is not None and trait_id != target_trait:
                return

            match_count += 1
            stat_idx = extract_stat_index(raw_sub)
            stat_entry = STAT_DELTA_TABLE[stat_idx]
            net = sum(stat_entry[:6])

            if len(results) < top_n or net > min_net:
                # We have the backward chars; now look up forward table for the pre-split state
                # But we need the pre-split state that LED to this final state.
                # Actually, we're building forward FROM the forward state,
                # so the (ma, sa, ta) we started with IS the forward state.
                # We need to find it in the forward table.
                # Wait -- this approach enumerates backward chars forward from
                # a forward state. We need a different approach.
                pass
            return

        for ci in VC:
            k = ci + pos + 1
            if pos & 1:  # odd: main=mul, sub=add, trait=mul
                new_ma = (ma * k) & 0xFFFF
                new_sa = (sa + k) & 0xFFFF
                new_ta = (ta * k) & 0xFFFF
            else:  # even: main=add, sub=mul, trait=add
                new_ma = (ma + k) & 0xFFFF
                new_sa = (sa * k) & 0xFFFF
                new_ta = (ta + k) & 0xFFFF
            backward_search(depth + 1, back_codes + [ci], new_ma, new_sa, new_ta)

    # The correct MITM: enumerate backward chars, apply them forward from
    # each possible initial state, and check outputs. But iterating over all
    # forward states * backward combos is too much.
    #
    # Instead: enumerate backward combos. For each, the backward combo defines
    # a FUNCTION f(state) -> final_state. We need final_state to satisfy output
    # constraints. The function is: series of mul/add steps.
    # If we represent f as: final = A*init + B (mod 65536) per component,
    # then init = (final - B) * A^{-1}. But the alternating mul/add makes
    # this an AFFINE transform per component, and the three components are
    # independent (they share the same char sequence but different operations).
    #
    # For each backward combo (c4..c7):
    #   main_final = main_transform(main_init)
    #   sub_final  = sub_transform(sub_init)
    #   trait_final = trait_transform(trait_init)
    # Each transform is a chain of affine ops, composable into a single
    # final = A * init + B (mod 65536).
    # Then init = (final - B) * A^{-1} if A is odd, or multiple preimages if A even.

    # Let me implement this properly with affine composition.
    # An affine transform is (A, B) meaning f(x) = A*x + B mod 65536
    # Composition: if f(x) = A*x+B and g(x) = C*x+D, then g(f(x)) = C*(A*x+B)+D = CA*x + CB+D
    # Multiply step (*k): A=k, B=0 -> composes as (A*k, B*k)
    # Add step (+k): A=1, B=k -> composes as (A, B+k)

    results = []
    min_net = -999
    match_count = 0
    back_checked = 0

    def enumerate_backward_affine(depth, back_codes, m_A, m_B, s_A, s_B, t_A, t_B):
        nonlocal results, min_net, match_count, back_checked

        pos = split + depth

        if depth == back_len:
            back_checked += 1
            # For each valid final output, invert affine to get required init state
            # main: final_m = m_A * init_m + m_B. Need (final_m - 1) & 0xFF in target.
            # sub:  final_s = s_A * init_s + s_B. Need (final_s - 2) & 0xFFFF in target_raws.
            # trait: final_t = t_A * init_t + t_B. Need (final_t - 2) & 0xFF in target.

            # Trait constraint first (most selective)
            if target_trait is not None:
                trait_byte_hits = [i for i in range(256) if TRAIT_TABLE[i] == target_trait]
                t_needed_finals_low = set((idx + 2) & 0xFF for idx in trait_byte_hits)
            else:
                t_needed_finals_low = set(range(256))  # any

            # Main constraint
            m_needed_finals_low = set((idx + 1) & 0xFF
                                      for idx in range(256) if MAIN_BREED_TABLE[idx] == target_main)

            # For each needed trait final (low byte), find init_t candidates
            # final_t & 0xFF = needed_low -> final_t = hi*256 + needed_low for hi in 0..255
            # init_t = (final_t - t_B) * t_A^{-1} if t_A odd, else multiple
            if t_A % 2 == 1:
                t_inv = _mod_inverse_16(t_A)
            else:
                t_inv = None

            # Similarly for main
            if m_A % 2 == 1:
                m_inv = _mod_inverse_16(m_A)
            else:
                m_inv = None

            # Similarly for sub
            if s_A % 2 == 1:
                s_inv = _mod_inverse_16(s_A)
            else:
                s_inv = None

            # Collect all valid init_t values
            init_t_set = set()
            for low in t_needed_finals_low:
                for hi in range(256):
                    final_t = (hi << 8) | low
                    if t_inv is not None:
                        it = ((final_t - t_B) * t_inv) & 0xFFFF
                        init_t_set.add(it)
                    else:
                        for it_cand in _invert_mul((final_t - t_B) & 0xFFFF, t_A):
                            init_t_set.add(it_cand)

            if not init_t_set:
                return

            # Collect all valid init_m values
            init_m_set = set()
            for low in m_needed_finals_low:
                for hi in range(256):
                    final_m = (hi << 8) | low
                    if m_inv is not None:
                        im = ((final_m - m_B) * m_inv) & 0xFFFF
                        init_m_set.add(im)
                    else:
                        for im_cand in _invert_mul((final_m - m_B) & 0xFFFF, m_A):
                            init_m_set.add(im_cand)

            if not init_m_set:
                return

            # For sub: we need (final_s - 2) to be a valid raw sub value
            # This is more complex since we need specific 16-bit raw values.
            # Precompute valid sub raw values once per call (done outside).
            # init_s = (final_s - s_B) * s_A^{-1}
            # final_s = raw + 2 for each valid raw
            # So init_s = (raw + 2 - s_B) * s_A^{-1}

            # Look up matches in forward table
            for fwd_state, fwd_chars_list in _fwd_iter(forward, init_m_set, init_t_set):
                fm, fs, ft = fwd_state
                if fm not in init_m_set or ft not in init_t_set:
                    continue
                # Check sub: final_s = s_A * fs + s_B
                final_s = (s_A * fs + s_B) & 0xFFFF
                raw_sub = (final_s - 2) & 0xFFFF
                sbi = extract_sub_breed_index(raw_sub)
                sub_breed = SUB_BREED_TABLE[sbi]
                if sub_breed > 39:
                    sub_breed = target_main
                elif BREED_COMBO_MATRIX[target_main][sub_breed] == 0:
                    sub_breed = target_main
                if target_sub is not None and sub_breed != target_sub:
                    continue

                # Verify main and trait
                final_m = (m_A * fm + m_B) & 0xFFFF
                main_idx = (final_m - 1) & 0xFF
                if MAIN_BREED_TABLE[main_idx] != target_main:
                    continue

                final_t = (t_A * ft + t_B) & 0xFFFF
                trait_idx_val = (final_t - 2) & 0xFF
                trait_id = TRAIT_TABLE[trait_idx_val]
                if target_trait is not None and trait_id != target_trait:
                    continue

                match_count += 1
                stat_idx = extract_stat_index(raw_sub)
                stat_entry = STAT_DELTA_TABLE[stat_idx]
                net = sum(stat_entry[:6])

                if len(results) < top_n or net > min_net:
                    for fc in fwd_chars_list:
                        pw_codes = list(fc) + back_codes
                        pw_text = decode_codes(pw_codes)
                        results.append((net, pw_text, target_main, sub_breed,
                                        stat_idx, stat_entry, trait_id))
                    results.sort(key=lambda x: -x[0])
                    if len(results) > top_n * 2:
                        results = results[:top_n]
                    if len(results) >= top_n:
                        min_net = results[-1][0]
            return

        for ci in VC:
            k = ci + pos + 1
            if pos & 1:  # odd: main mul, sub add, trait mul
                new_mA = (m_A * k) & 0xFFFF
                new_mB = (m_B * k) & 0xFFFF
                new_sA = s_A
                new_sB = (s_B + k) & 0xFFFF
                new_tA = (t_A * k) & 0xFFFF
                new_tB = (t_B * k) & 0xFFFF
            else:  # even: main add, sub mul, trait add
                new_mA = m_A
                new_mB = (m_B + k) & 0xFFFF
                new_sA = (s_A * k) & 0xFFFF
                new_sB = (s_B * k) & 0xFFFF
                new_tA = t_A
                new_tB = (t_B + k) & 0xFFFF
            enumerate_backward_affine(depth + 1, back_codes + [ci],
                                       new_mA, new_mB, new_sA, new_sB, new_tA, new_tB)

    # The above approach with full init_m_set / init_t_set iteration for each backward
    # combo is too slow because of the set sizes. Let me use a simpler direct approach:
    # iterate forward table and check.
    # Actually, let me redesign: the forward table is keyed by (ma, sa, ta).
    # For each backward combo, we can compute required init state per valid output
    # and do direct dict lookups. The trick: we can't enumerate all 65536 possible
    # hi bytes for each constraint. But we CAN iterate the forward table directly.

    # REVISED APPROACH: Forward table, then for each backward combo, iterate forward
    # states and check if the final output satisfies constraints.
    # But that's 28M * 28M = too much for len 8.
    #
    # CORRECT MITM: use the affine representation, but look up directly.
    # For each backward combo defining affine (m_A, m_B, s_A, s_B, t_A, t_B):
    #   For each state (fm, fs, ft) in forward table:
    #     final_m = m_A*fm + m_B, final_s = s_A*fs + s_B, final_t = t_A*ft + t_B
    #     Check constraints on final values.
    # This is len(forward) * backward_combos = too much.
    #
    # The REAL key: instead of iterating all forward states, we invert from specific
    # target final values to find the ONE required forward state.
    # Sub hash is the most constrained (16-bit target), so invert sub first.
    # For each backward combo and each valid sub_raw target:
    #   init_s = (raw + 2 - s_B) * s_A^{-1}  (if s_A odd, else branch)
    #   Then check if any (*, init_s, *) exists in forward table (keyed differently).
    #
    # We need the forward table indexed by sub_acc (sa) for this to work.
    # Let me rebuild the forward table as: sa -> list of (ma, ta, chars)

    # Rebuild forward table keyed by sub_acc for efficient lookup
    pass

    # OK - I realize this inline approach is getting too complex. Let me implement
    # a clean version. Canceling the recursive approach.
    results = []
    return results


def _fwd_iter(forward, init_m_set, init_t_set):
    """Iterate forward table entries matching the m and t init sets."""
    for state, chars_list in forward.items():
        if state[0] in init_m_set and state[2] in init_t_set:
            yield state, chars_list


def _mitm_short(target_main, target_sub, target_trait, pw_len, top_n):
    """MITM for short passwords (3-5 chars) using constrained enumeration."""
    results = []
    min_net = -999
    VC = VALID_CODES

    for codes in _enumerate_codes(VC, pw_len):
        main_breed = hash_main_breed(codes, pw_len)
        if main_breed != target_main:
            continue
        sub_breed, stat_idx, _ = compute_sub_breed(codes, pw_len, main_breed)
        if target_sub is not None and sub_breed != target_sub:
            continue
        trait_id, _ = hash_traits(codes, pw_len)
        if target_trait is not None and trait_id != target_trait:
            continue
        stat_entry = STAT_DELTA_TABLE[stat_idx]
        net = sum(stat_entry[:6])
        if len(results) < top_n or net > min_net:
            pw_text = decode_codes(codes)
            results.append((net, pw_text, target_main, sub_breed, stat_idx, stat_entry, trait_id))
            results.sort(key=lambda x: -x[0])
            if len(results) > top_n:
                results = results[:top_n]
            if len(results) >= top_n:
                min_net = results[-1][0]

    return results


def _enumerate_codes(vc, length):
    """Generate all code combinations of given length."""
    if length == 0:
        yield []
        return
    for c in vc:
        for rest in _enumerate_codes(vc, length - 1):
            yield [c] + rest


# =============================================================================
# Display
# =============================================================================

def print_results(results, target_main, target_sub=None):
    """Print formatted results table."""
    main_name = BREED_NAMES.get(target_main, f"ID {target_main}")
    sub_name = BREED_NAMES.get(target_sub, f"ID {target_sub}") if target_sub is not None else "any"

    print(f"\n{'='*90}")
    print(f"  Target: {main_name} (main={target_main}) / {sub_name} (sub={target_sub})")
    print(f"{'='*90}")

    if not results:
        print("\n  No matching passwords found!")
        print("  Try increasing --max-len or searching without --sub to allow any sub breed.")
        return

    print(f"\n {'Rank':>4s} | {'Password':<10s} | {'Net':>4s} | {'POW':>4s} {'INT':>4s} {'SKI':>4s} "
          f"{'SPD':>4s} {'DEF':>4s} {'LIF':>4s} | {'Entry':>5s} | {'Sub':<8s} | {'Trait':<10s}")
    print(f" {'-'*4}-+-{'-'*10}-+-{'-'*4}-+-{'-'*29}-+-{'-'*5}-+-{'-'*8}-+-{'-'*10}")

    for rank, (net, pw, main, sub, stat_idx, stat_entry, trait_id) in enumerate(results, 1):
        deltas = stat_entry[:6]
        sub_name_short = BREED_NAMES.get(sub, f"?{sub}")
        trait_str = TRAIT_NAMES.get(trait_id, f"0x{trait_id:02X}") if trait_id != 0xFF else "(none)"
        # Show password in quotes to make spaces visible
        pw_display = f'"{pw}"'
        print(f" {rank:4d} | {pw_display:<10s} | {net:+4d} | {deltas[0]:+4d} {deltas[1]:+4d} {deltas[2]:+4d} "
              f"{deltas[3]:+4d} {deltas[4]:+4d} {deltas[5]:+4d} | {stat_idx:5d} | {sub_name_short:<8s} | {trait_str}")

    # Show what the best result would look like with base stats
    best = results[0]
    net, pw, main, sub, stat_idx, stat_entry, trait_id = best
    combo_val = BREED_COMBO_MATRIX[main][sub]
    if combo_val > 0 and combo_val <= len(BREED_BASE_STATS):
        base = BREED_BASE_STATS[combo_val - 1]
        deltas = stat_entry[:6]
        print(f"\n  Best password: \"{pw}\"")
        print(f"  Breed: {BREED_NAMES.get(main, '?')}/{BREED_NAMES.get(sub, '?')} (record #{combo_val})")
        labels = ["POW", "INT", "SKI", "SPD", "DEF", "LIF"]
        print(f"  {'Stat':>5s}  {'Base':>5s}  {'Delta':>5s}  {'Final':>5s}")
        print(f"  {'-'*5}  {'-'*5}  {'-'*5}  {'-'*5}")
        total_base = 0
        total_final = 0
        for i, label in enumerate(labels):
            final = base[i] + deltas[i]
            total_base += base[i]
            total_final += final
            print(f"  {label:>5s}  {base[i]:5d}  {deltas[i]:+5d}  {final:5d}")
        print(f"  {'-'*5}  {'-'*5}  {'-'*5}  {'-'*5}")
        print(f"  {'TOTAL':>5s}  {total_base:5d}  {net:+5d}  {total_final:5d}")
        life_mod = stat_entry[12]
        growth = stat_entry[6:12]
        print(f"\n  Lifespan modifier: {life_mod:+d}")
        print(f"  Growth modifiers:  {growth}")
        trait_name = TRAIT_NAMES.get(trait_id, f"0x{trait_id:02X}")
        if trait_id != 0xFF:
            print(f"  Shrine trait: {trait_name} (0x{trait_id:02X})")
        else:
            print(f"  Shrine trait: (none)")


# =============================================================================
# CLI
# =============================================================================

def resolve_breed_id(name_or_id, names_dict):
    """Resolve a breed name or numeric ID to an integer breed ID."""
    if name_or_id is None:
        return None
    try:
        return int(name_or_id)
    except ValueError:
        pass
    name_lower = name_or_id.lower()
    # Check aliases first
    if name_lower in BREED_ALIASES:
        return BREED_ALIASES[name_lower]
    # Exact match
    for bid, bname in names_dict.items():
        if bname.lower() == name_lower:
            return bid
    # Partial match
    for bid, bname in names_dict.items():
        if name_lower in bname.lower():
            return bid
    raise ValueError(f"Unknown breed name: '{name_or_id}'. Valid names: {', '.join(names_dict.values())}")


def resolve_trait_id(name_or_id):
    """Resolve a trait name or hex/decimal ID to a trait ID integer."""
    if name_or_id is None:
        return None
    # Try hex (0x02) or decimal
    try:
        if name_or_id.startswith("0x") or name_or_id.startswith("0X"):
            return int(name_or_id, 16)
        return int(name_or_id)
    except ValueError:
        pass
    # Normalize and search
    key = name_or_id.lower().replace(" ", "").replace("+", "plus")
    if key in TRAIT_NAME_TO_ID:
        return TRAIT_NAME_TO_ID[key]
    # Partial match on trait names
    for tid, tname in TRAIT_NAMES.items():
        if name_or_id.lower() in tname.lower():
            return tid
    valid = [f"{n} (0x{i:02X})" for i, n in TRAIT_NAMES.items() if i != 0xFF]
    raise ValueError(f"Unknown trait: '{name_or_id}'. Valid traits:\n  " + "\n  ".join(valid))


def list_breeds():
    """List all breeds with hash frequency and valid sub breeds."""
    print("Main Breed IDs:")
    print(f"  {'ID':>2s}  {'Name':<12s}  {'Hash Freq':>9s}  Valid Sub Breeds")
    print(f"  {'-'*2}  {'-'*12}  {'-'*9}  {'-'*40}")
    for bid, bname in sorted(BREED_NAMES.items()):
        count = sum(1 for v in MAIN_BREED_TABLE if v == bid)
        # Find valid sub breeds
        valid_subs = []
        for sub_id in range(40):
            if BREED_COMBO_MATRIX[bid][sub_id] != 0:
                sub_name = BREED_NAMES.get(sub_id, f"?{sub_id}")
                valid_subs.append(sub_name)
        subs_str = ", ".join(valid_subs) if valid_subs else "none"
        if len(subs_str) > 50:
            subs_str = subs_str[:47] + "..."
        print(f"  {bid:2d}  {bname:<12s}  {count:4d}/256   {subs_str}")


def list_assignable_traits():
    """List all traits that can be assigned through the shrine password system."""
    from collections import Counter
    trait_counts = Counter(t for t in TRAIT_TABLE if t != 0xFF)
    print("Traits assignable via shrine password (from trait hash table at 0x081EA020):")
    print(f"  {'ID':>4s}  {'Name':<10s}  {'Frequency':>9s}")
    print(f"  {'-'*4}  {'-'*10}  {'-'*9}")
    for tid in sorted(trait_counts.keys()):
        name = TRAIT_NAMES.get(tid, f"0x{tid:02X}")
        count = trait_counts[tid]
        print(f"  0x{tid:02X}  {name:<10s}  {count:4d}/256")


def analyze_and_print(password):
    """Analyze a password and print detailed results."""
    result = analyze_password(password)

    print(f"\n  Password: \"{result['password']}\" ({len(password)} characters)")
    print(f"  Main breed: {result['main_breed_name']} (ID {result['main_breed']})")
    print(f"  Sub breed:  {result['sub_breed_name']} (ID {result['sub_breed']})")

    combo_val = result['combo_record']
    if combo_val > 0 and combo_val <= len(BREED_BASE_STATS):
        base = BREED_BASE_STATS[combo_val - 1]
        labels = result['stat_labels']
        deltas = result['stat_deltas']
        net = result['net_stat_delta']

        print(f"\n  Stat entry: #{result['stat_entry_index']} (net {net:+d})")
        print(f"  {'Stat':>5s}  {'Base':>5s}  {'Delta':>5s}  {'Final':>5s}")
        print(f"  {'-'*5}  {'-'*5}  {'-'*5}  {'-'*5}")
        total_base = 0
        total_final = 0
        for i, label in enumerate(labels):
            final = base[i] + deltas[i]
            total_base += base[i]
            total_final += final
            print(f"  {label:>5s}  {base[i]:5d}  {deltas[i]:+5d}  {final:5d}")
        print(f"  {'-'*5}  {'-'*5}  {'-'*5}  {'-'*5}")
        print(f"  {'TOTAL':>5s}  {total_base:5d}  {net:+5d}  {total_final:5d}")
    else:
        print(f"\n  Stat entry: #{result['stat_entry_index']}")
        labels = result['stat_labels']
        deltas = result['stat_deltas']
        for label, d in zip(labels, deltas):
            print(f"    {label}: {d:+d}")
        print(f"  Net stat delta: {result['net_stat_delta']:+d}")

    print(f"\n  Growth mods: {result['growth_mods']}")
    print(f"  Life modifier: {result['life_mod']:+d}")
    trait_id = result['trait_id']
    trait_name = result['trait_name']
    if trait_id != 0xFF:
        print(f"  Shrine trait: {trait_name} (0x{trait_id:02X}, table index {result['trait_index']})")
    else:
        print(f"  Shrine trait: (none)")


def main():
    parser = argparse.ArgumentParser(
        description="MRA2 Optimal Password Generator - find shrine passwords producing the best monsters",
        epilog="Examples:\n"
               "  %(prog)s --breed Dragon --top 10\n"
               "  %(prog)s --breed Golem --sub Monol --trait IronHart\n"
               "  %(prog)s --breed Pixie --sub Dragon --min-len 3 --max-len 8\n"
               "  %(prog)s --analyze \"MgTFJ\"\n"
               "  %(prog)s --list-breeds\n",
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )

    breed_group = parser.add_mutually_exclusive_group()
    breed_group.add_argument("--breed", help="Main breed name (e.g. Pixie, Golem, Dragon)")
    breed_group.add_argument("--breed-id", type=int, help="Main breed numeric ID (0-29)")

    sub_group = parser.add_mutually_exclusive_group()
    sub_group.add_argument("--sub", help="Sub breed name (e.g. Dragon, Tiger)")
    sub_group.add_argument("--sub-id", type=int, help="Sub breed numeric ID (0-29)")

    parser.add_argument("--trait",
                        help="Target trait name or ID (e.g. IronHart, Expert, 0x02)")
    parser.add_argument("--list-traits", action="store_true",
                        help="List all traits assignable through the shrine system")

    parser.add_argument("--top", type=int, default=10,
                        help="Number of top results to show (default: 10)")
    parser.add_argument("--min-len", type=int, default=8,
                        help="Minimum password length (default: 8)")
    parser.add_argument("--max-len", type=int, default=8,
                        help="Maximum password length (default: 8)")
    parser.add_argument("--solver", choices=["auto", "brute", "mitm"], default="auto",
                        help="Solver engine: auto (brute 3-5, MITM 6-8), brute, or mitm")
    parser.add_argument("--stat-entry", type=int, default=None,
                        help="Filter to a specific stat delta table entry index (0-63)")
    parser.add_argument("--analyze",
                        help="Analyze a specific password (show breed, stats, traits)")
    parser.add_argument("--list-breeds", action="store_true",
                        help="List all breed names, IDs, and valid sub breeds")

    args = parser.parse_args()

    if args.list_breeds:
        list_breeds()
        return

    if args.list_traits:
        list_assignable_traits()
        return

    if args.analyze:
        analyze_and_print(args.analyze)
        return

    target_main = args.breed_id
    if args.breed:
        target_main = resolve_breed_id(args.breed, BREED_NAMES)

    target_sub = args.sub_id
    if args.sub:
        target_sub = resolve_breed_id(args.sub, BREED_NAMES)

    target_trait = None
    if args.trait:
        target_trait = resolve_trait_id(args.trait)

    if target_main is None:
        parser.error("Must specify --breed/--breed-id, --analyze, or --list-breeds")

    main_name = BREED_NAMES.get(target_main, f"ID {target_main}")
    sub_name = BREED_NAMES.get(target_sub, "any") if target_sub is not None else "any"
    trait_name = TRAIT_NAMES.get(target_trait, f"0x{target_trait:02X}") if target_trait is not None else "any"

    print(f"MRA2 Optimal Password Generator")
    print(f"  Target breed: {main_name} / {sub_name}")
    if target_trait is not None:
        print(f"  Target trait: {trait_name} (0x{target_trait:02X})")
    if args.stat_entry is not None:
        print(f"  Stat entry filter: #{args.stat_entry}")
    print(f"  Password lengths: {args.min_len}-{args.max_len}")
    print(f"  Solver: {args.solver}")
    print()

    # Route to appropriate solver(s)
    all_results = []

    if args.solver == "brute":
        # Force brute-force for all lengths
        all_results = brute_force_search_optimized(
            target_main=target_main,
            target_sub=target_sub,
            target_trait=target_trait,
            max_len=args.max_len,
            min_len=args.min_len,
            top_n=args.top,
        )
    elif args.solver == "mitm":
        # Force MITM for all lengths
        for pw_len in range(max(args.min_len, 3), args.max_len + 1):
            r = _mitm_search_impl(target_main, target_sub, target_trait,
                                  pw_len=pw_len, top_n=args.top)
            all_results.extend(r)
    else:
        # Auto: Python brute-force for 3-4, C brute-force for 5, MITM for 6-8
        # When trait filtering is active, C engine can't filter traits, so use MITM from 5
        bf_cap = 4 if target_trait is not None else 5
        bf_max = min(args.max_len, bf_cap)
        mitm_start = bf_cap + 1

        if args.min_len <= bf_max:
            print(f"--- Brute-force (lengths {args.min_len}-{bf_max}) ---")
            bf_results = brute_force_search_optimized(
                target_main=target_main,
                target_sub=target_sub,
                target_trait=target_trait,
                max_len=bf_max,
                min_len=args.min_len,
                top_n=args.top,
            )
            all_results.extend(bf_results)

        if args.max_len >= mitm_start:
            print(f"\n--- MITM solver (lengths {max(args.min_len, mitm_start)}-{args.max_len}) ---")
            for pw_len in range(max(args.min_len, mitm_start), args.max_len + 1):
                print(f"\n  Length {pw_len}:")
                r = _mitm_search_impl(target_main, target_sub, target_trait,
                                      pw_len=pw_len, top_n=args.top)
                all_results.extend(r)
                print(f"  Found {len(r)} results for length {pw_len}")

    # Filter by stat entry if requested
    if args.stat_entry is not None:
        all_results = [r for r in all_results if r[4] == args.stat_entry]

    # Sort and trim
    all_results.sort(key=lambda x: -x[0])
    all_results = all_results[:args.top]

    print_results(all_results, target_main, target_sub)


if __name__ == "__main__":
    main()
