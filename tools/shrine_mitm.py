#!/usr/bin/env python3
"""
MRA2 Meet-in-the-Middle Password Solver

C-accelerated MITM for 8-char passwords (14 million x faster than brute-force).
Pure Python fallback for 3-5 char (brute-force) and 6-7 char (Python MITM).
"""

import ctypes
import time
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from shrine_data import (
    MAIN_BREED_TABLE, SUB_BREED_TABLE, STAT_DELTA_TABLE, TRAIT_TABLE,
    BREED_COMBO_MATRIX, VALID_CODES, BREED_NAMES, TRAIT_NAMES, CODE_TO_CHAR,
)

# --- Load C library ---

_mitm_lib = None
_so_path = Path(__file__).parent / "shrine_mitm_c.so"

if _so_path.exists():
    try:
        _mitm_lib = ctypes.CDLL(str(_so_path))
        _mitm_lib.mitm_build_forward.restype = ctypes.c_int
        _mitm_lib.mitm_build_valid_finals.restype = ctypes.c_int
        _mitm_lib.mitm_solve_8.restype = ctypes.c_uint64
        _mitm_lib.mitm_get_num_results.restype = ctypes.c_int
        _mitm_lib.mitm_get_match_count.restype = ctypes.c_uint64
    except Exception as e:
        print(f"  Warning: could not load shrine_mitm.so: {e}")
        _mitm_lib = None


def _init_c_tables():
    """Push ROM tables into the C library."""
    arr = (ctypes.c_uint8 * 256)(*MAIN_BREED_TABLE)
    _mitm_lib.mitm_set_main_breed_table(arr, 256)

    arr = (ctypes.c_uint8 * 256)(*SUB_BREED_TABLE)
    _mitm_lib.mitm_set_sub_breed_table(arr, 256)

    flat = []
    for entry in STAT_DELTA_TABLE:
        for v in entry:
            flat.append(v & 0xFF)
    arr = (ctypes.c_int8 * (64 * 13))(*[v if v < 128 else v - 256 for v in flat])
    _mitm_lib.mitm_set_stat_delta_table(arr, 64)

    arr = (ctypes.c_uint8 * 256)(*TRAIT_TABLE)
    _mitm_lib.mitm_set_trait_table(arr, 256)

    flat_combo = []
    for row in BREED_COMBO_MATRIX:
        for v in row:
            flat_combo.append(v)
    arr = (ctypes.c_int16 * (30 * 40))(*flat_combo)
    _mitm_lib.mitm_set_breed_combo(arr)

    arr = (ctypes.c_uint16 * len(VALID_CODES))(*VALID_CODES)
    _mitm_lib.mitm_set_valid_codes(arr, len(VALID_CODES))


# --- Helper functions ---

def extract_sub_breed_index(raw):
    result = 0; temp = raw; weight = 1
    for _ in range(8):
        temp >>= 1; result |= (temp & weight); weight <<= 1
    return result & 0xFF

def extract_stat_index(raw):
    result = 0; temp = raw; weight = 1
    for _ in range(6):
        result |= (temp & weight); temp >>= 1; weight <<= 1
    return result & 0x3F

def _decode(codes):
    return ''.join(CODE_TO_CHAR.get(c, '?') for c in codes)


# --- C-accelerated MITM for length 8 ---

def _c_mitm_8(target_main, target_sub, target_trait, top_n, verbose):
    """Run the C MITM solver for 8-character passwords."""
    _init_c_tables()
    sub_arg = target_sub if target_sub is not None else -1
    trait_arg = target_trait if target_trait is not None else -1
    _mitm_lib.mitm_set_targets(target_main, sub_arg, trait_arg)
    _mitm_lib.mitm_set_top_n(top_n)
    _mitm_lib.mitm_reset()

    if verbose:
        print("  [C-MITM] Building forward table...", end="", flush=True)
    t0 = time.time()
    fwd_count = _mitm_lib.mitm_build_forward()
    if verbose:
        print(f" {fwd_count:,} entries ({time.time()-t0:.1f}s)")

    if verbose:
        print("  [C-MITM] Precomputing valid sub outputs...", end="", flush=True)
    t1 = time.time()
    nv = _mitm_lib.mitm_build_valid_finals()
    if verbose:
        print(f" {nv:,} values ({time.time()-t1:.1f}s)")

    if verbose:
        print("  [C-MITM] Backward solve (8-char)...", end="", flush=True)
    t2 = time.time()
    back_count = _mitm_lib.mitm_solve_8()
    elapsed = time.time() - t2
    match_count = _mitm_lib.mitm_get_match_count()
    if verbose:
        print(f" {back_count:,} combos, {match_count:,} matches ({elapsed:.1f}s)")

    n = _mitm_lib.mitm_get_num_results()
    results = []
    for i in range(n):
        net = ctypes.c_int()
        codes = (ctypes.c_uint16 * 8)()
        pw_len = ctypes.c_int()
        main_b = ctypes.c_uint8()
        sub_b = ctypes.c_uint8()
        stat_idx = ctypes.c_uint8()
        trait_id = ctypes.c_uint8()
        _mitm_lib.mitm_get_result(i, ctypes.byref(net), codes, ctypes.byref(pw_len),
                                  ctypes.byref(main_b), ctypes.byref(sub_b),
                                  ctypes.byref(stat_idx), ctypes.byref(trait_id))
        pw_codes = [codes[j] for j in range(pw_len.value)]
        pw_text = _decode(pw_codes)
        stat_entry = STAT_DELTA_TABLE[stat_idx.value]
        results.append((net.value, pw_text, main_b.value, sub_b.value,
                        stat_idx.value, stat_entry, trait_id.value))
    return results


# --- Python brute-force for short passwords (3-5) ---

def _python_short(target_main, target_sub, target_trait, pw_len, top_n):
    """Brute-force search for 3-5 char passwords with all-hash tracking."""
    vc = VALID_CODES
    results = []
    min_net = -999

    def search(depth, codes, ma, sa, ta):
        nonlocal results, min_net
        if depth == pw_len:
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
            stat_idx = extract_stat_index(raw_sub)
            stat_entry = STAT_DELTA_TABLE[stat_idx]
            net = sum(stat_entry[:6])
            if len(results) < top_n or net > min_net:
                pw_text = _decode(codes)
                results.append((net, pw_text, target_main, sub_breed,
                                stat_idx, stat_entry, trait_id))
                results.sort(key=lambda x: -x[0])
                if len(results) > top_n:
                    results = results[:top_n]
                if len(results) >= top_n:
                    min_net = results[-1][0]
            return

        pos = depth
        for ci in vc:
            k = ci + pos + 1
            if pos == 0:
                search(1, codes + [ci], (ci + 1) & 0xFFFF, sa, ta)
            elif pos == 1:
                search(2, codes + [ci], (ma * k) & 0xFFFF, (ci + 2) & 0xFFFF, ta)
            elif pos == 2:
                search(3, codes + [ci], (ma + k) & 0xFFFF, (sa * k) & 0xFFFF, (ci + 3) & 0xFFFF)
            elif pos & 1:
                search(pos + 1, codes + [ci], (ma * k) & 0xFFFF, (sa + k) & 0xFFFF, (ta * k) & 0xFFFF)
            else:
                search(pos + 1, codes + [ci], (ma + k) & 0xFFFF, (sa * k) & 0xFFFF, (ta + k) & 0xFFFF)

    search(0, [], 0, 0, 0)
    return results


# --- Python MITM for length 6-7 ---

def _python_mitm_67(target_main, target_sub, target_trait, pw_len, top_n, verbose):
    """Python MITM for 5-7 char passwords. Variable split point."""
    vc = VALID_CODES
    split = min(4, pw_len - 1)  # At least 1 char in backward phase

    if verbose:
        print(f"  Building forward table...", end="", flush=True)
    t0 = time.time()

    fwd = {}
    for c0 in vc:
        ma0 = (c0 + 1) & 0xFFFF
        for c1 in vc:
            k1 = c1 + 2
            ma1 = (ma0 * k1) & 0xFFFF
            sa1 = k1
            for c2 in vc:
                k2 = c2 + 3
                ma2 = (ma1 + k2) & 0xFFFF
                sa2 = (sa1 * k2) & 0xFFFF
                ta2 = k2
                for c3 in vc:
                    k3 = c3 + 4
                    ma3 = (ma2 * k3) & 0xFFFF
                    sa3 = (sa2 + k3) & 0xFFFF
                    ta3 = (ta2 * k3) & 0xFFFF
                    if sa3 not in fwd:
                        fwd[sa3] = []
                    fwd[sa3].append((ma3, ta3, c0, c1, c2, c3))

    if verbose:
        print(f" ({time.time()-t0:.1f}s)")

    # Precompute valid finals (same logic as C)
    valid_finals = []
    for raw in range(65536):
        sbi = extract_sub_breed_index(raw)
        sub_b = SUB_BREED_TABLE[sbi]
        if sub_b > 39:
            sub_b = target_main
        elif BREED_COMBO_MATRIX[target_main][sub_b] == 0:
            sub_b = target_main
        if target_sub is not None and sub_b != target_sub:
            continue
        si = extract_stat_index(raw)
        se = STAT_DELTA_TABLE[si]
        net = sum(se[:6])
        valid_finals.append(((raw + 2) & 0xFFFF, si, net, sub_b, se))
    valid_finals.sort(key=lambda x: -x[2])

    if verbose:
        back_len = pw_len - 4
        print(f"  Backward solve ({len(vc)}^{back_len}, {len(valid_finals)} sub targets)...", flush=True)
    t1 = time.time()

    results = []
    min_net = -999
    match_count = 0

    def _mod_inv16(a):
        return pow(a, -1, 65536)

    def back_enum(depth, codes, mA, mB, sA, sB, tA, tB):
        nonlocal results, min_net, match_count
        back_len = pw_len - 4
        if depth == back_len:
            for (fsa, si, net, sub_b, se) in valid_finals:
                if len(results) >= top_n and net <= min_net:
                    break
                # Invert sub: init_sa = (fsa - sB) * inv(sA)
                if sA & 1:
                    init_sa = ((fsa - sB) * _mod_inv16(sA)) & 0xFFFF
                    entries = fwd.get(init_sa)
                    if entries is None:
                        continue
                    for (fwd_ma, fwd_ta, c0, c1, c2, c3) in entries:
                        final_ma = (mA * fwd_ma + mB) & 0xFFFF
                        mi = (final_ma - 1) & 0xFF
                        if MAIN_BREED_TABLE[mi] != target_main:
                            continue
                        final_ta = (tA * fwd_ta + tB) & 0xFFFF
                        ti = (final_ta - 2) & 0xFF
                        tid = TRAIT_TABLE[ti]
                        if target_trait is not None and tid != target_trait:
                            continue
                        match_count += 1
                        if len(results) < top_n or net > min_net:
                            pw = _decode([c0, c1, c2, c3] + codes)
                            results.append((net, pw, target_main, sub_b, si, se, tid))
                            results.sort(key=lambda x: -x[0])
                            if len(results) > top_n * 2:
                                results = results[:top_n]
                            if len(results) >= top_n:
                                min_net = results[-1][0]
                else:
                    # Even sA: multiple preimages
                    def _gcd(a, b):
                        while b: a, b = b, a % b
                        return a
                    g = _gcd(sA & 0xFFFF, 65536)
                    target_val = (fsa - sB) & 0xFFFF
                    if target_val % g != 0:
                        continue
                    a_red = sA // g
                    t_red = target_val // g
                    m_red = 65536 // g
                    inv_a = pow(a_red, -1, m_red)
                    x0 = (t_red * inv_a) % m_red
                    for gi in range(g):
                        init_sa = (x0 + gi * m_red) & 0xFFFF
                        entries = fwd.get(init_sa)
                        if entries is None:
                            continue
                        for (fwd_ma, fwd_ta, c0, c1, c2, c3) in entries:
                            final_ma = (mA * fwd_ma + mB) & 0xFFFF
                            mi = (final_ma - 1) & 0xFF
                            if MAIN_BREED_TABLE[mi] != target_main:
                                continue
                            final_ta = (tA * fwd_ta + tB) & 0xFFFF
                            ti = (final_ta - 2) & 0xFF
                            tid = TRAIT_TABLE[ti]
                            if target_trait is not None and tid != target_trait:
                                continue
                            match_count += 1
                            if len(results) < top_n or net > min_net:
                                pw = _decode([c0, c1, c2, c3] + codes)
                                results.append((net, pw, target_main, sub_b, si, se, tid))
                                results.sort(key=lambda x: -x[0])
                                if len(results) > top_n * 2:
                                    results = results[:top_n]
                                if len(results) >= top_n:
                                    min_net = results[-1][0]
            return

        pos = 4 + depth
        k_base = pos + 1
        for ci in vc:
            k = ci + k_base
            if pos & 1:
                back_enum(depth + 1, codes + [ci],
                          (mA * k) & 0xFFFF, (mB * k) & 0xFFFF,
                          sA, (sB + k) & 0xFFFF,
                          (tA * k) & 0xFFFF, (tB * k) & 0xFFFF)
            else:
                back_enum(depth + 1, codes + [ci],
                          mA, (mB + k) & 0xFFFF,
                          (sA * k) & 0xFFFF, (sB * k) & 0xFFFF,
                          tA, (tB + k) & 0xFFFF)

    back_enum(0, [], 1, 0, 1, 0, 1, 0)
    if verbose:
        print(f"  Done: {match_count:,} matches ({time.time()-t1:.1f}s)")
    return results[:top_n]


# --- Main entry point ---

def mitm_search(target_main, target_sub=None, target_trait=None,
                pw_len=8, top_n=10, verbose=True):
    """
    MITM solver entry point. Routes to:
      - Python brute-force for 3-5 chars
      - Python MITM for 6-7 chars
      - C MITM for 8 chars
    """
    if pw_len <= 4:
        if verbose:
            print(f"  (Python brute-force, length {pw_len})")
        return _python_short(target_main, target_sub, target_trait, pw_len, top_n)

    if pw_len == 8 and _mitm_lib is not None:
        return _c_mitm_8(target_main, target_sub, target_trait, top_n, verbose)

    if pw_len == 8 and _mitm_lib is None:
        print("  WARNING: shrine_mitm_c.so not found. Length 8 requires the C solver.")
        print("  Build with: gcc -O3 -shared -fPIC -o shrine_mitm_c.so shrine_mitm.c")
        return []

    # 5-7: Python MITM (split at 4, back_len = pw_len - 4)
    return _python_mitm_67(target_main, target_sub, target_trait, pw_len, top_n, verbose)


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="MRA2 MITM Password Solver")
    parser.add_argument("--breed", type=int, required=True, help="Main breed ID")
    parser.add_argument("--sub", type=int, default=None, help="Sub breed ID")
    parser.add_argument("--trait", type=int, default=None, help="Trait ID")
    parser.add_argument("--len", type=int, default=8, help="Password length")
    parser.add_argument("--top", type=int, default=10, help="Top N results")
    args = parser.parse_args()

    print(f"Searching for breed={args.breed} sub={args.sub} trait={args.trait} len={args.len}")
    results = mitm_search(args.breed, args.sub, args.trait, args.len, args.top)
    print(f"\nTop {len(results)} results:")
    for i, (net, pw, main, sub, si, se, tid) in enumerate(results):
        tname = TRAIT_NAMES.get(tid, f"0x{tid:02X}")
        sname = BREED_NAMES.get(sub, f"?{sub}")
        deltas = ', '.join(f"{v:+d}" for v in se[:6])
        print(f"  {i+1:3d}. \"{pw}\" net={net:+d} [{deltas}] sub={sname} stat#{si} trait={tname}")
