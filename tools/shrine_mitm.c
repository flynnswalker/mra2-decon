/*
 * MRA2 Meet-in-the-Middle shrine password solver.
 *
 * Splits 8-char passwords at position 4:
 *   Forward:  enumerate c0-c3, build hash table keyed by sub_acc
 *   Backward: enumerate c4-c7, compute sub affine, invert to find init_sa,
 *             look up forward table, verify main/trait constraints
 *
 * Build: gcc -O3 -shared -fPIC -o shrine_mitm_c.so shrine_mitm.c
 */

#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

/* ROM tables (set by Python) */
static uint8_t  main_breed_table[256];
static uint8_t  sub_breed_table[256];
static int8_t   stat_delta_table[64][13];
static uint8_t  trait_table[256];
static int16_t  breed_combo[30][40];

static uint16_t valid_codes[128];
static int      num_codes = 0;

/* Forward table entry */
typedef struct {
    uint16_t main_acc;
    uint16_t trait_acc;
    uint16_t codes[4]; /* c0, c1, c2, c3 */
} fwd_entry_t;

/* Forward table: 65536 buckets keyed by sub_acc */
#define NUM_BUCKETS 65536
static fwd_entry_t **fwd_buckets;
static int          *fwd_counts;
static int          *fwd_caps;

/* Valid final sub_acc values for target constraints */
static uint16_t *valid_finals;     /* final_sa values that pass sub-breed check */
static int      *valid_stat_idx;   /* corresponding stat index */
static int      *valid_net_stat;   /* corresponding net stat delta */
static uint8_t  *valid_sub_breed;  /* corresponding sub breed */
static int       num_valid_finals = 0;

/* Results */
#define MAX_RESULTS 512
typedef struct {
    int      net_stat;
    uint16_t codes[8];
    uint8_t  main_breed;
    uint8_t  sub_breed;
    uint8_t  stat_idx;
    uint8_t  trait_id;
} mitm_result_t;

static mitm_result_t mitm_results[MAX_RESULTS];
static int mitm_num_results = 0;
static int mitm_top_n = 10;
static int mitm_min_net = -999;
static uint64_t mitm_match_count = 0;

/* Target filters */
static uint8_t target_main_breed = 0;
static int     target_sub_breed = -1;  /* -1 = any */
static int     target_trait_id = -1;   /* -1 = any */

/* --- Helpers --- */

static uint8_t extract_sub_breed_index(uint16_t raw) {
    uint16_t result = 0, temp = raw, weight = 1;
    for (int i = 0; i < 8; i++) {
        temp >>= 1;
        result |= (temp & weight);
        weight <<= 1;
    }
    return (uint8_t)(result & 0xFF);
}

static uint8_t extract_stat_index(uint16_t raw) {
    uint16_t result = 0, temp = raw, weight = 1;
    for (int i = 0; i < 6; i++) {
        result |= (temp & weight);
        temp >>= 1;
        weight <<= 1;
    }
    return (uint8_t)(result & 0x3F);
}

static uint16_t mod_inv16(uint16_t a) {
    /* Extended Euclidean for inverse mod 65536, a must be odd */
    uint32_t inv = a;
    inv = inv * (2 - a * inv);  /* 4 bits */
    inv = inv * (2 - a * inv);  /* 8 bits */
    inv = inv * (2 - a * inv);  /* 16 bits */
    inv = inv * (2 - a * inv);  /* 32 bits - plenty */
    return (uint16_t)(inv & 0xFFFF);
}

static void insert_mitm_result(int net, uint16_t *codes8,
                               uint8_t main_b, uint8_t sub_b,
                               uint8_t stat_idx, uint8_t trait_id) {
    if (mitm_num_results < mitm_top_n || net > mitm_min_net) {
        int pos = mitm_num_results;
        for (int i = 0; i < mitm_num_results; i++) {
            if (net > mitm_results[i].net_stat) { pos = i; break; }
        }
        int cap = mitm_num_results < mitm_top_n ? mitm_num_results : mitm_top_n - 1;
        if (cap > pos)
            memmove(&mitm_results[pos+1], &mitm_results[pos],
                    (cap - pos) * sizeof(mitm_result_t));
        mitm_results[pos].net_stat = net;
        memcpy(mitm_results[pos].codes, codes8, 8 * sizeof(uint16_t));
        mitm_results[pos].main_breed = main_b;
        mitm_results[pos].sub_breed = sub_b;
        mitm_results[pos].stat_idx = stat_idx;
        mitm_results[pos].trait_id = trait_id;
        if (mitm_num_results < mitm_top_n) mitm_num_results++;
        if (mitm_num_results >= mitm_top_n)
            mitm_min_net = mitm_results[mitm_num_results-1].net_stat;
    }
}

/* --- Public API: table setup --- */

void mitm_set_main_breed_table(const uint8_t *d, int n)  { memcpy(main_breed_table, d, n < 256 ? n : 256); }
void mitm_set_sub_breed_table(const uint8_t *d, int n)   { memcpy(sub_breed_table, d, n < 256 ? n : 256); }
void mitm_set_trait_table(const uint8_t *d, int n)       { memcpy(trait_table, d, n < 256 ? n : 256); }
void mitm_set_breed_combo(const int16_t *d)              { memcpy(breed_combo, d, 30*40*sizeof(int16_t)); }

void mitm_set_stat_delta_table(const int8_t *d, int entries) {
    memcpy(stat_delta_table, d, entries * 13);
}

void mitm_set_valid_codes(const uint16_t *c, int n) {
    num_codes = n < 128 ? n : 128;
    memcpy(valid_codes, c, num_codes * sizeof(uint16_t));
}

void mitm_set_targets(uint8_t main_b, int sub_b, int trait_id) {
    target_main_breed = main_b;
    target_sub_breed = sub_b;
    target_trait_id = trait_id;
}

void mitm_set_top_n(int n) {
    mitm_top_n = n < MAX_RESULTS ? n : MAX_RESULTS;
}

void mitm_reset(void) {
    mitm_num_results = 0;
    mitm_min_net = -999;
    mitm_match_count = 0;
}

/* --- Forward phase --- */

static void fwd_alloc(void) {
    fwd_buckets = (fwd_entry_t **)calloc(NUM_BUCKETS, sizeof(fwd_entry_t *));
    fwd_counts  = (int *)calloc(NUM_BUCKETS, sizeof(int));
    fwd_caps    = (int *)calloc(NUM_BUCKETS, sizeof(int));
}

static void fwd_free(void) {
    if (!fwd_buckets) return;
    for (int i = 0; i < NUM_BUCKETS; i++)
        free(fwd_buckets[i]);
    free(fwd_buckets); free(fwd_counts); free(fwd_caps);
    fwd_buckets = NULL; fwd_counts = NULL; fwd_caps = NULL;
}

static void fwd_insert(uint16_t sa, uint16_t ma, uint16_t ta,
                        uint16_t c0, uint16_t c1, uint16_t c2, uint16_t c3) {
    int idx = sa;
    if (fwd_counts[idx] >= fwd_caps[idx]) {
        int newcap = fwd_caps[idx] ? fwd_caps[idx] * 2 : 8;
        fwd_buckets[idx] = (fwd_entry_t *)realloc(fwd_buckets[idx],
                                                    newcap * sizeof(fwd_entry_t));
        fwd_caps[idx] = newcap;
    }
    fwd_entry_t *e = &fwd_buckets[idx][fwd_counts[idx]++];
    e->main_acc = ma;
    e->trait_acc = ta;
    e->codes[0] = c0; e->codes[1] = c1; e->codes[2] = c2; e->codes[3] = c3;
}

int mitm_build_forward(void) {
    fwd_free();
    fwd_alloc();
    int nc = num_codes;
    uint16_t *vc = valid_codes;
    int total = 0;

    for (int a = 0; a < nc; a++) {
        uint16_t c0 = vc[a];
        uint16_t ma0 = (c0 + 1) & 0xFFFF;
        for (int b = 0; b < nc; b++) {
            uint16_t c1 = vc[b];
            uint16_t k1 = c1 + 2;
            uint16_t ma1 = (ma0 * k1) & 0xFFFF;
            uint16_t sa1 = k1;
            for (int c = 0; c < nc; c++) {
                uint16_t c2 = vc[c];
                uint16_t k2 = c2 + 3;
                uint16_t ma2 = (ma1 + k2) & 0xFFFF;
                uint16_t sa2 = (sa1 * k2) & 0xFFFF;
                uint16_t ta2 = k2; /* trait seed */
                for (int d = 0; d < nc; d++) {
                    uint16_t c3 = vc[d];
                    uint16_t k3 = c3 + 4;
                    uint16_t ma3 = (ma2 * k3) & 0xFFFF;
                    uint16_t sa3 = (sa2 + k3) & 0xFFFF;
                    uint16_t ta3 = (ta2 * k3) & 0xFFFF;
                    fwd_insert(sa3, ma3, ta3, c0, c1, c2, c3);
                    total++;
                }
            }
        }
    }
    return total;
}

/* --- Precompute valid final sub outputs --- */

int mitm_build_valid_finals(void) {
    free(valid_finals); free(valid_stat_idx); free(valid_net_stat); free(valid_sub_breed);
    valid_finals    = (uint16_t *)malloc(65536 * sizeof(uint16_t));
    valid_stat_idx  = (int *)malloc(65536 * sizeof(int));
    valid_net_stat  = (int *)malloc(65536 * sizeof(int));
    valid_sub_breed = (uint8_t *)malloc(65536);
    num_valid_finals = 0;

    for (uint32_t raw = 0; raw < 65536; raw++) {
        uint8_t sbi = extract_sub_breed_index((uint16_t)raw);
        uint8_t sub_b = sub_breed_table[sbi];
        if (sub_b > 39)
            sub_b = target_main_breed;
        else if (breed_combo[target_main_breed][sub_b] == 0)
            sub_b = target_main_breed;
        if (target_sub_breed >= 0 && sub_b != (uint8_t)target_sub_breed)
            continue;
        uint8_t si = extract_stat_index((uint16_t)raw);
        int net = 0;
        for (int j = 0; j < 6; j++) net += stat_delta_table[si][j];

        uint16_t final_sa = (uint16_t)((raw + 2) & 0xFFFF);
        valid_finals[num_valid_finals]    = final_sa;
        valid_stat_idx[num_valid_finals]  = si;
        valid_net_stat[num_valid_finals]  = net;
        valid_sub_breed[num_valid_finals] = sub_b;
        num_valid_finals++;
    }

    /* Sort by net stat descending for early pruning */
    for (int i = 0; i < num_valid_finals - 1; i++) {
        for (int j = i + 1; j < num_valid_finals; j++) {
            if (valid_net_stat[j] > valid_net_stat[i]) {
                uint16_t tf = valid_finals[i]; valid_finals[i] = valid_finals[j]; valid_finals[j] = tf;
                int ts = valid_stat_idx[i]; valid_stat_idx[i] = valid_stat_idx[j]; valid_stat_idx[j] = ts;
                int tn = valid_net_stat[i]; valid_net_stat[i] = valid_net_stat[j]; valid_net_stat[j] = tn;
                uint8_t tb = valid_sub_breed[i]; valid_sub_breed[i] = valid_sub_breed[j]; valid_sub_breed[j] = tb;
            }
        }
    }
    return num_valid_finals;
}

/* --- Main byte lookup --- */
static uint8_t main_byte_ok[256];

static void build_main_ok(void) {
    memset(main_byte_ok, 0, 256);
    for (int i = 0; i < 256; i++)
        if (main_breed_table[i] == target_main_breed)
            main_byte_ok[i] = 1;
}

/* --- Backward phase for length 8 --- */

uint64_t mitm_solve_8(void) {
    build_main_ok();
    int nc = num_codes;
    uint16_t *vc = valid_codes;
    uint64_t back_count = 0;

    /*
     * Positions 4-7 hash operations:
     *   pos 4 (even): main += k, sub *= k, trait += k
     *   pos 5 (odd):  main *= k, sub += k, trait *= k
     *   pos 6 (even): main += k, sub *= k, trait += k
     *   pos 7 (odd):  main *= k, sub += k, trait *= k
     *
     * Track sub affine: final_sa = sA * init_sa + sB
     * For each backward combo, invert sub affine for each valid final_sa
     * to find required init_sa, then look up forward table.
     */

    for (int a = 0; a < nc; a++) {
        uint16_t c4 = vc[a];
        uint16_t k4 = c4 + 5;
        /* pos 4 even: sub *= k4 => sA=k4, sB=0 */
        uint16_t sA4 = k4, sB4 = 0;

        for (int b = 0; b < nc; b++) {
            uint16_t c5 = vc[b];
            uint16_t k5 = c5 + 6;
            /* pos 5 odd: sub += k5 => sA=sA4, sB=sB4+k5 = k5 */
            uint16_t sA5 = sA4;
            uint16_t sB5 = (sB4 + k5) & 0xFFFF;

            for (int c = 0; c < nc; c++) {
                uint16_t c6 = vc[c];
                uint16_t k6 = c6 + 7;
                /* pos 6 even: sub *= k6 */
                uint16_t sA6 = (sA5 * k6) & 0xFFFF;
                uint16_t sB6 = (sB5 * k6) & 0xFFFF;

                /* Also track main/trait affines for this prefix c4,c5,c6
                 * to avoid recomputing per c7 */
                /* main: pos4 += k4, pos5 *= k5, pos6 += k6
                 *   mA=k5, mB= k4*k5 + k6 */
                uint16_t mA6 = k5;
                uint16_t mB6 = (uint16_t)(((uint32_t)k4 * k5 + k6) & 0xFFFF);
                /* trait: pos4 += k4, pos5 *= k5, pos6 += k6
                 *   tA=k5, tB= k4*k5 + k6  (same structure as main!) */
                uint16_t tA6 = k5;
                uint16_t tB6 = (uint16_t)(((uint32_t)k4 * k5 + k6) & 0xFFFF);

                for (int d = 0; d < nc; d++) {
                    uint16_t c7 = vc[d];
                    uint16_t k7 = c7 + 8;
                    back_count++;

                    /* pos 7 odd: sub += k7 */
                    uint16_t sA7 = sA6;
                    uint16_t sB7 = (sB6 + k7) & 0xFFFF;

                    /* main: pos7 *= k7 */
                    uint16_t mA7 = (mA6 * k7) & 0xFFFF;
                    uint16_t mB7 = (mB6 * k7) & 0xFFFF;

                    /* trait: pos7 *= k7 */
                    uint16_t tA7 = (tA6 * k7) & 0xFFFF;
                    uint16_t tB7 = (tB6 * k7) & 0xFFFF;

                    /* Invert sub affine for each valid final_sa */
                    /* final_sa = sA7 * init_sa + sB7 */
                    /* init_sa = (final_sa - sB7) * inv(sA7) if sA7 odd */

                    if (sA7 & 1) {
                        /* Odd: unique inverse */
                        uint16_t inv_sA = mod_inv16(sA7);
                        for (int v = 0; v < num_valid_finals; v++) {
                            int net = valid_net_stat[v];
                            if (mitm_num_results >= mitm_top_n && net <= mitm_min_net)
                                break; /* sorted descending, prune rest */

                            uint16_t init_sa = (uint16_t)(((valid_finals[v] - sB7) * inv_sA) & 0xFFFF);
                            int bucket = init_sa;
                            int cnt = fwd_counts[bucket];
                            if (cnt == 0) continue;
                            fwd_entry_t *entries = fwd_buckets[bucket];

                            uint8_t si = (uint8_t)valid_stat_idx[v];
                            uint8_t sub_b = valid_sub_breed[v];

                            for (int e = 0; e < cnt; e++) {
                                /* Check main */
                                uint16_t final_ma = (uint16_t)((mA7 * entries[e].main_acc + mB7) & 0xFFFF);
                                uint8_t mi = (final_ma - 1) & 0xFF;
                                if (!main_byte_ok[mi]) continue;

                                /* Check trait */
                                uint16_t final_ta = (uint16_t)((tA7 * entries[e].trait_acc + tB7) & 0xFFFF);
                                uint8_t ti = (final_ta - 2) & 0xFF;
                                uint8_t tid = trait_table[ti];
                                if (target_trait_id >= 0 && tid != (uint8_t)target_trait_id)
                                    continue;

                                mitm_match_count++;
                                uint16_t pw[8];
                                pw[0] = entries[e].codes[0];
                                pw[1] = entries[e].codes[1];
                                pw[2] = entries[e].codes[2];
                                pw[3] = entries[e].codes[3];
                                pw[4] = c4; pw[5] = c5; pw[6] = c6; pw[7] = c7;
                                insert_mitm_result(net, pw, target_main_breed, sub_b, si, tid);
                            }
                        }
                    } else {
                        /* Even sA7: multiple preimages */
                        /* sA7 * x ≡ (final - sB7) mod 65536 */
                        /* gcd(sA7, 65536) solutions if target divisible by gcd */
                        uint16_t g = sA7;
                        uint16_t m = 0; /* 65536 as uint32 */
                        { /* compute gcd */
                            uint32_t ga = g, gb = 65536;
                            while (gb) { uint32_t t = gb; gb = ga % gb; ga = t; }
                            g = (uint16_t)ga;
                        }
                        uint32_t m_red = 65536 / g;
                        uint16_t a_red = sA7 / g;
                        uint16_t inv_a_red = mod_inv16(a_red); /* a_red is now odd */

                        for (int v = 0; v < num_valid_finals; v++) {
                            int net = valid_net_stat[v];
                            if (mitm_num_results >= mitm_top_n && net <= mitm_min_net)
                                break;

                            uint16_t target_val = (valid_finals[v] - sB7) & 0xFFFF;
                            if (target_val % g != 0) continue;

                            uint16_t t_red = target_val / g;
                            uint32_t x0 = ((uint32_t)t_red * inv_a_red) % m_red;

                            uint8_t si = (uint8_t)valid_stat_idx[v];
                            uint8_t sub_b = valid_sub_breed[v];

                            for (uint32_t i = 0; i < g; i++) {
                                uint16_t init_sa = (uint16_t)((x0 + i * m_red) & 0xFFFF);
                                int bucket = init_sa;
                                int cnt = fwd_counts[bucket];
                                if (cnt == 0) continue;
                                fwd_entry_t *entries = fwd_buckets[bucket];

                                for (int e = 0; e < cnt; e++) {
                                    uint16_t final_ma = (uint16_t)((mA7 * entries[e].main_acc + mB7) & 0xFFFF);
                                    uint8_t mi = (final_ma - 1) & 0xFF;
                                    if (!main_byte_ok[mi]) continue;

                                    uint16_t final_ta = (uint16_t)((tA7 * entries[e].trait_acc + tB7) & 0xFFFF);
                                    uint8_t ti = (final_ta - 2) & 0xFF;
                                    uint8_t tid = trait_table[ti];
                                    if (target_trait_id >= 0 && tid != (uint8_t)target_trait_id)
                                        continue;

                                    mitm_match_count++;
                                    uint16_t pw[8];
                                    pw[0] = entries[e].codes[0];
                                    pw[1] = entries[e].codes[1];
                                    pw[2] = entries[e].codes[2];
                                    pw[3] = entries[e].codes[3];
                                    pw[4] = c4; pw[5] = c5; pw[6] = c6; pw[7] = c7;
                                    insert_mitm_result(net, pw, target_main_breed, sub_b, si, tid);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    fwd_free();
    return back_count;
}

/* --- Results API --- */
int      mitm_get_num_results(void) { return mitm_num_results; }
uint64_t mitm_get_match_count(void) { return mitm_match_count; }

void mitm_get_result(int idx, int *net, uint16_t *codes, int *pw_len,
                     uint8_t *main_b, uint8_t *sub_b, uint8_t *stat_idx,
                     uint8_t *trait_id) {
    if (idx < 0 || idx >= mitm_num_results) return;
    *net = mitm_results[idx].net_stat;
    memcpy(codes, mitm_results[idx].codes, 8 * sizeof(uint16_t));
    *pw_len = 8;
    *main_b = mitm_results[idx].main_breed;
    *sub_b  = mitm_results[idx].sub_breed;
    *stat_idx = mitm_results[idx].stat_idx;
    *trait_id = mitm_results[idx].trait_id;
}
