#!/usr/bin/env python3
"""MRA2 Breeding Mechanics - Extracted from ROM disassembly."""
import json
from pathlib import Path

STRESS_THRESHOLDS = [24, 49, 69, 89, 100]


def compute_stress_tier(p1s, p2s):
    """Map average parent stress to breeding tier 1-5."""
    avg = (p1s + p2s) // 2
    for i, t in enumerate(STRESS_THRESHOLDS):
        if avg <= t:
            return i + 1
    return 5


def get_breed_bonus(breed_param, stat_idx):
    """Get breed-specific stat bonus (+10 for matching combos)."""
    bonuses = {
        0x14: [10, 0, 0, 0, 0, 0],
        0x15: [0, 0, 0, 0, 10, 0],
        0x16: [0, 0, 10, 0, 0, 0],
        0x17: [0, 0, 0, 10, 0, 0],
        0x18: [0, 10, 0, 0, 0, 0],
        0x19: [0, 0, 0, 0, 0, 10],
        0x1F: [0, 0, 0, 0, 10, 10],
        0x20: [10, 10, 0, 0, 0, 0],
        0x21: [0, 0, 10, 10, 0, 0],
    }
    return bonuses.get(breed_param, [0] * 6)[stat_idx]


def compute_stat_inheritance(base, breed_bonus, stress_tier):
    """Stat = base + ((base*256/100) * (bonus+tier)) >> 8, max 255."""
    if base == 0:
        return 0
    scaled = (base * 256) // 100
    delta = (scaled * (breed_bonus + stress_tier)) >> 8
    return min(base + delta, 255)


def compute_child_stress(p1s, p2s):
    """Child stress = (parent1 + parent2) / 5."""
    return (p1s + p2s) // 5


def dump_breed_data(rom_path, output_dir="analysis"):
    """Dump breeding data to JSON."""
    out = Path(output_dir) / "formulas"
    out.mkdir(parents=True, exist_ok=True)
    data = {
        "stress_thresholds": STRESS_THRESHOLDS,
        "stat_formula": "base + ((base*256/100)*(bonus+tier))>>8, max 255",
        "child_stress": "(p1+p2)/5",
        "breed_bonuses": {
            "0x14": "POW+10",
            "0x15": "DEF+10",
            "0x16": "SKI+10",
            "0x17": "SPD+10",
            "0x18": "INT+10",
            "0x19": "LIF+10",
            "0x1F": "DEF+10,LIF+10",
            "0x20": "POW+10,INT+10",
            "0x21": "SKI+10,SPD+10",
        },
    }
    path = out / "breeding_data.json"
    path.write_text(json.dumps(data, indent=2))
    print("Wrote breeding_data.json")


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Usage: python breeding.py <rom>")
        sys.exit(1)
    dump_breed_data(sys.argv[1])
