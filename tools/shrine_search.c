/*
 * MRA2 shrine password brute-force search engine.
 *
 * Compiled as a shared library and called from Python via ctypes.
 * Implements the polynomial hash with incremental accumulator tracking
 * and early breed-match pruning.
 *
 * Build: gcc -O3 -shared -fPIC -o shrine_search.so shrine_search.c
 */

#include <stdint.h>
#include <string.h>
#include <stdio.h>

/* ROM lookup tables -- filled in by Python before calling search */
static uint8_t main_breed_table[256];
static uint8_t sub_breed_table[256];
static int8_t  stat_delta_table[64][13];
static uint8_t technique_table[256];
static int16_t breed_combo[30][40];

/* Valid character codes */
static uint16_t valid_codes[128];
static int num_valid_codes = 0;

/* Results storage */
#define MAX_RESULTS 256

typedef struct {
    int net_stat;
    uint16_t codes[8];
    int pw_len;
    uint8_t main_breed;
    uint8_t sub_breed;
    uint8_t stat_idx;
    uint8_t tech_id;
    int8_t deltas[6];
} result_t;

static result_t results[MAX_RESULTS];
static int num_results = 0;
static int top_n = 10;
static int min_net_threshold = -999;

/* Counters */
static uint64_t total_checked = 0;
static uint64_t total_matched = 0;

/* ---- Helpers ---- */

static inline int16_t sign_extend_16(uint16_t val) {
    return (int16_t)val;
}

static uint8_t extract_sub_breed_index(uint16_t raw) {
    /* Extracts odd-positioned bits: shift first, then mask */
    uint16_t result = 0;
    uint16_t temp = raw;
    uint16_t weight = 1;
    for (int i = 0; i < 8; i++) {
        temp >>= 1;
        result |= (temp & weight);
        weight <<= 1;
    }
    return (uint8_t)(result & 0xFF);
}

static uint8_t extract_stat_index(uint16_t raw) {
    /* Extracts even-positioned bits: mask first, then shift */
    uint16_t result = 0;
    uint16_t temp = raw;
    uint16_t weight = 1;
    for (int i = 0; i < 6; i++) {
        result |= (temp & weight);
        temp >>= 1;
        weight <<= 1;
    }
    return (uint8_t)(result & 0x3F);
}

static void insert_result(int net, uint16_t *codes, int pw_len,
                          uint8_t main_b, uint8_t sub_b, uint8_t stat_idx,
                          uint8_t tech_id) {
    if (num_results < top_n || net > min_net_threshold) {
        /* Find insertion point (sorted descending by net) */
        int pos = num_results;
        for (int i = 0; i < num_results; i++) {
            if (net > results[i].net_stat) {
                pos = i;
                break;
            }
        }

        /* Shift lower results down */
        int cap = num_results < top_n ? num_results : top_n - 1;
        if (cap > pos) {
            memmove(&results[pos + 1], &results[pos],
                    (cap - pos) * sizeof(result_t));
        }

        /* Insert */
        results[pos].net_stat = net;
        memcpy(results[pos].codes, codes, pw_len * sizeof(uint16_t));
        results[pos].pw_len = pw_len;
        results[pos].main_breed = main_b;
        results[pos].sub_breed = sub_b;
        results[pos].stat_idx = stat_idx;
        results[pos].tech_id = tech_id;
        for (int i = 0; i < 6; i++)
            results[pos].deltas[i] = stat_delta_table[stat_idx][i];

        if (num_results < top_n)
            num_results++;

        if (num_results >= top_n)
            min_net_threshold = results[num_results - 1].net_stat;
    }
}

/* ---- Technique hash (only called for matching passwords) ---- */

static uint8_t compute_technique(uint16_t *codes, int length) {
    if (length <= 2) return 0xFF;

    uint16_t accum = (codes[2] + 3) & 0xFFFF;
    for (int i = 3; i < length; i++) {
        if (i & 1) {
            accum = (accum * (codes[i] + i + 1)) & 0xFFFF;
        } else {
            accum = (uint16_t)(sign_extend_16(accum) + (codes[i] + i + 1));
        }
    }
    uint8_t idx = (accum - 2) & 0xFF;
    return technique_table[idx];
}

/* ---- Recursive search with incremental accumulators ---- */

static void search_recursive(int depth, int pw_len, uint16_t *codes,
                             uint16_t main_acc, uint16_t sub_acc,
                             uint8_t target_main, int target_sub,
                             const uint8_t *main_byte_ok) {
    if (depth == pw_len) {
        total_checked++;

        uint8_t main_idx = (main_acc - 1) & 0xFF;
        if (!main_byte_ok[main_idx]) return;

        uint8_t main_b = main_breed_table[main_idx];

        uint16_t raw_sub = (sub_acc - 2) & 0xFFFF;
        uint8_t sub_tbl_idx = extract_sub_breed_index(raw_sub);
        uint8_t sub_b = sub_breed_table[sub_tbl_idx];

        if (sub_b > 39) sub_b = main_b;
        else if (breed_combo[main_b][sub_b] == 0) sub_b = main_b;

        if (target_sub >= 0 && sub_b != (uint8_t)target_sub) return;

        total_matched++;

        uint8_t stat_idx = extract_stat_index(raw_sub);
        int net = 0;
        for (int i = 0; i < 6; i++)
            net += stat_delta_table[stat_idx][i];

        if (num_results < top_n || net > min_net_threshold) {
            uint8_t tech = compute_technique(codes, pw_len);
            insert_result(net, codes, pw_len, main_b, sub_b, stat_idx, tech);
        }
        return;
    }

    for (int ci = 0; ci < num_valid_codes; ci++) {
        uint16_t code = valid_codes[ci];
        codes[depth] = code;

        uint16_t new_main, new_sub;

        if (depth == 0) {
            new_main = (code + 1) & 0xFFFF;
            new_sub = sub_acc;
        } else if (depth == 1) {
            int i = 1;
            /* Main: odd -> multiply */
            new_main = (main_acc * (code + i + 1)) & 0xFFFF;
            /* Sub: seed from char[1] */
            new_sub = (code + 2) & 0xFFFF;
        } else {
            int i = depth;
            if (i & 1) {
                /* Main: odd -> multiply; Sub: odd -> add (sign-extended) */
                new_main = (main_acc * (code + i + 1)) & 0xFFFF;
                new_sub = (uint16_t)(sign_extend_16(sub_acc) + (code + i + 1));
            } else {
                /* Main: even -> add (sign-extended); Sub: even -> multiply */
                new_main = (uint16_t)(sign_extend_16(main_acc) + (code + i + 1));
                new_sub = (sub_acc * (code + i + 1)) & 0xFFFF;
            }
        }

        search_recursive(depth + 1, pw_len, codes, new_main, new_sub,
                          target_main, target_sub, main_byte_ok);
    }
}

/* ---- Public API ---- */

void set_main_breed_table(const uint8_t *data, int len) {
    memcpy(main_breed_table, data, len < 256 ? len : 256);
}

void set_sub_breed_table(const uint8_t *data, int len) {
    memcpy(sub_breed_table, data, len < 256 ? len : 256);
}

void set_stat_delta_table(const int8_t *data, int entries) {
    memcpy(stat_delta_table, data, entries * 13);
}

void set_technique_table(const uint8_t *data, int len) {
    memcpy(technique_table, data, len < 256 ? len : 256);
}

void set_breed_combo(const int16_t *data) {
    memcpy(breed_combo, data, 30 * 40 * sizeof(int16_t));
}

void set_valid_codes(const uint16_t *codes, int count) {
    num_valid_codes = count < 128 ? count : 128;
    memcpy(valid_codes, codes, num_valid_codes * sizeof(uint16_t));
}

void set_top_n(int n) {
    top_n = n < MAX_RESULTS ? n : MAX_RESULTS;
}

void search(uint8_t target_main, int target_sub, int pw_len) {
    uint8_t main_byte_ok[256] = {0};
    for (int i = 0; i < 256; i++) {
        if (main_breed_table[i] == target_main)
            main_byte_ok[i] = 1;
    }

    uint16_t codes[8] = {0};
    search_recursive(0, pw_len, codes, 0, 0,
                     target_main, target_sub, main_byte_ok);
}

void reset_results(void) {
    num_results = 0;
    total_checked = 0;
    total_matched = 0;
    min_net_threshold = -999;
}

int get_num_results(void) { return num_results; }
uint64_t get_total_checked(void) { return total_checked; }
uint64_t get_total_matched(void) { return total_matched; }

void get_result(int idx, int *net, uint16_t *codes, int *pw_len,
                uint8_t *main_b, uint8_t *sub_b, uint8_t *stat_idx,
                uint8_t *tech_id, int8_t *deltas) {
    if (idx < 0 || idx >= num_results) return;
    *net = results[idx].net_stat;
    memcpy(codes, results[idx].codes, 8 * sizeof(uint16_t));
    *pw_len = results[idx].pw_len;
    *main_b = results[idx].main_breed;
    *sub_b = results[idx].sub_breed;
    *stat_idx = results[idx].stat_idx;
    *tech_id = results[idx].tech_id;
    memcpy(deltas, results[idx].deltas, 6);
}
