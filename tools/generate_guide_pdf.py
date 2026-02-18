#!/usr/bin/env python3
"""Generate a phone-friendly PDF of all MRA2 extracted mechanics."""

from fpdf import FPDF

class MRA2Doc(FPDF):
    def header(self):
        if self.page_no() > 1:
            self.set_font("Helvetica", "I", 8)
            self.set_text_color(120, 120, 120)
            self.cell(0, 5, "MRA2 Mechanics Guide", align="C", new_x="LMARGIN", new_y="NEXT")
            self.ln(2)

    def footer(self):
        self.set_y(-15)
        self.set_font("Helvetica", "I", 8)
        self.set_text_color(120, 120, 120)
        self.cell(0, 10, f"Page {self.page_no()}/{{nb}}", align="C")

    def section_title(self, title):
        self.set_font("Helvetica", "B", 16)
        self.set_text_color(30, 60, 120)
        self.ln(4)
        self.cell(0, 10, title, new_x="LMARGIN", new_y="NEXT")
        self.set_draw_color(30, 60, 120)
        self.line(self.l_margin, self.get_y(), self.w - self.r_margin, self.get_y())
        self.ln(4)

    def sub_title(self, title):
        self.set_font("Helvetica", "B", 13)
        self.set_text_color(50, 80, 140)
        self.ln(3)
        self.cell(0, 8, title, new_x="LMARGIN", new_y="NEXT")
        self.ln(2)

    def sub_sub_title(self, title):
        self.set_font("Helvetica", "B", 11)
        self.set_text_color(70, 70, 70)
        self.ln(2)
        self.cell(0, 7, title, new_x="LMARGIN", new_y="NEXT")
        self.ln(1)

    def body(self, text):
        self.set_font("Helvetica", "", 10)
        self.set_text_color(30, 30, 30)
        self.multi_cell(0, 5.5, text)
        self.ln(1)

    def bold_body(self, text):
        self.set_font("Helvetica", "B", 10)
        self.set_text_color(30, 30, 30)
        self.multi_cell(0, 5.5, text)
        self.ln(1)

    def bullet(self, text):
        self.set_font("Helvetica", "", 10)
        self.set_text_color(30, 30, 30)
        self.cell(0, 5.5, "  - " + text, new_x="LMARGIN", new_y="NEXT")

    def formula_box(self, text):
        self.set_font("Courier", "", 9)
        self.set_fill_color(240, 240, 245)
        self.set_text_color(30, 30, 30)
        y = self.get_y()
        self.set_x(self.l_margin + 4)
        self.multi_cell(self.w - self.l_margin - self.r_margin - 8, 5.5, text, fill=True)
        self.ln(2)

    def table_row(self, cells, widths, bold=False):
        self.set_font("Helvetica", "B" if bold else "", 9)
        self.set_text_color(30, 30, 30)
        h = 6
        for i, (cell, w) in enumerate(zip(cells, widths)):
            if bold:
                self.set_fill_color(220, 230, 245)
                self.cell(w, h, str(cell), border=1, fill=True)
            else:
                bg = (248, 248, 252) if self.get_y() % 2 < 1 else (255, 255, 255)
                self.set_fill_color(*bg)
                self.cell(w, h, str(cell), border=1, fill=True)
        self.ln(h)

    def callout(self, text):
        self.set_fill_color(255, 248, 220)
        self.set_font("Helvetica", "I", 10)
        self.set_text_color(80, 60, 0)
        self.set_x(self.l_margin + 2)
        self.multi_cell(self.w - self.l_margin - self.r_margin - 4, 5.5, text, fill=True)
        self.ln(2)


def build_pdf():
    pdf = MRA2Doc(orientation="P", unit="mm", format="A5")  # A5 = phone-friendly
    pdf.alias_nb_pages()
    pdf.set_auto_page_break(auto=True, margin=18)
    pdf.set_margins(12, 12, 12)

    # --- COVER PAGE ---
    pdf.add_page()
    pdf.ln(25)
    pdf.set_font("Helvetica", "B", 22)
    pdf.set_text_color(30, 60, 120)
    pdf.cell(0, 12, "Monster Rancher", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(0, 12, "Advance 2", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(5)
    pdf.set_font("Helvetica", "", 14)
    pdf.set_text_color(80, 80, 80)
    pdf.cell(0, 8, "Complete Mechanics Guide", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(8)
    pdf.set_font("Helvetica", "I", 10)
    pdf.set_text_color(120, 120, 120)
    pdf.cell(0, 6, "Extracted from ROM disassembly", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(0, 6, "Cross-validated with LegendCup community data", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.ln(15)
    pdf.set_font("Helvetica", "", 9)
    pdf.set_text_color(100, 100, 100)
    pdf.cell(0, 5, "mra2-decon project / February 2026", align="C", new_x="LMARGIN", new_y="NEXT")

    # --- QUICK REFERENCE ---
    pdf.add_page()
    pdf.section_title("Quick Reference")
    pdf.body("This guide covers 10 game systems extracted from the MRA2 ROM. One-sentence summaries:")
    pdf.ln(1)

    pdf.bold_body("Training")
    pdf.body("Light Drills have equal stat weights; Heavy Drills skew toward POW/DEF/LIF. Stat gains come from pattern-matching minigame results. Drills are free; sparring costs 3-5 weeks of lifespan.")

    pdf.bold_body("Battle")
    pdf.body("Deterministic 8-phase scoring (no RNG). Stat gaps under 100 contribute nothing. Techniques give 1.5x. Missing costs -4 guts, creating death spirals.")

    pdf.bold_body("Lifespan & Fatigue")
    pdf.body("All breeds live 237-280 weeks. Growth peaks at different ages per breed. Weekly drain is 400-500 pts + random. Trait 0x33 (Listless) adds 50% more drain. Older monsters tire 3x faster.")

    pdf.bold_body("Sparring & Techniques")
    pdf.body("Technique learning is DETERMINISTIC (35 condition checks, not random). 'Good Chance' means most conditions met. Sparring stat gain = current_stat minus breed base. AGIMA stats are display-only.")

    pdf.bold_body("Traits")
    pdf.body("87 traits with 6 effect types. StatKing gives +50 to all battle stats. Listless adds 50% lifespan drain. Element traits give +/-3 or +/-5 damage. Traits reset to 0 during weekly training.")

    pdf.bold_body("Items & Food")
    pdf.body("76 items decoded. Food reduces fatigue/stress. Supplements are breed-indexed (same item differs per breed). Gems passively offset weekly drain. Feed your monster the correct food type (1-5).")

    pdf.bold_body("Combining")
    pdf.body("30x40 breed matrix. Offspring starts from breed base stats (NOT parent stats), modified by compatibility %. 27 Legendary recipes. Fureria/Gadamon/Buragma give +10% to 2 stats.")

    pdf.bold_body("Tournaments & Rank")
    pdf.body("Ranks E through S with monthly decay. Opponents cap at 250 stats. Stray encounters need stat_total > 499 and rank_points > 699.")

    pdf.bold_body("Shrine / Passwords")
    pdf.body("Polynomial hash: 4 hashes from one password. 256-entry breed tables, 64-entry stat delta table. Longer passwords = better hash distribution. Dictionary table for known words.")

    # ==========================================
    # TRAINING
    # ==========================================
    pdf.add_page()
    pdf.section_title("Training & Raising")

    pdf.sub_title("The Coach System")
    pdf.body("MRA2 has 65 coach profiles in the game. Each coach has fixed stat totals for all 6 stats, a drill difficulty level (3-5), trait modifiers, and a lifespan cost. Named coaches like Morgan, Arther, and Aegis are specific entries in this table.")
    pdf.body("Your monster's stat gains from drills are bounded by the coach's stat totals. Once your monster approaches the coach's level in a stat, gains taper off. Better coaches = higher ceiling = stronger monsters.")

    pdf.sub_title("What Determines Stat Gains")
    pdf.body("Five things feed into how much your monster grows each week:")
    pdf.bullet("Coach stat totals (sets the ceiling)")
    pdf.bullet("Monster's growth curve type (early/mid/late/flat bloomer)")
    pdf.bullet("Monster's current aging stage (young = fast growth, old = slow)")
    pdf.bullet("A hidden 57-week training cycle (small bonus at weeks 50-54)")
    pdf.bullet("Stats capped at 999 maximum")

    pdf.sub_title("The Hidden Cost of Sparring")
    pdf.body("This is the most important hidden mechanic for long-term play. Every coach has a fatigue cost that drains lifespan:")

    w = [40, 35, 52]
    pdf.table_row(["Cost Type", "Per Session", "Found In"], w, bold=True)
    pdf.table_row(["Beneficial (-3)", "+0.3 weeks life", "Regular drill coaches"], w)
    pdf.table_row(["Neutral (0)", "No impact", "Many mid coaches"], w)
    pdf.table_row(["Expensive (27-45)", "2.7-4.5 weeks life", "Sparring coaches"], w)

    pdf.ln(2)
    pdf.callout("Key insight: Sparring (to learn techniques) is the most expensive thing you can do to your monster's lifespan. Regular drills for stats are essentially free. Build stats first, spar later.")

    pdf.sub_title("Coach Quality Tiers")
    w = [28, 35, 28, 36]
    pdf.table_row(["Tier", "Stat Total", "Difficulty", "Examples"], w, bold=True)
    pdf.table_row(["Basic", "1400-1700", "3", "Early AGIMA coaches"], w)
    pdf.table_row(["Standard", "1700-2100", "3-4", "Mid-game coaches"], w)
    pdf.table_row(["Advanced", "2100-2600", "4-5", "Morgan, Arther"], w)
    pdf.table_row(["Elite", "2600-3500", "5", "Late-game coaches"], w)
    pdf.table_row(["Legendary", "3500-3850", "5", "Endgame specials"], w)

    pdf.ln(2)
    pdf.body("The top coaches have individual stats of 800-900. These are what enable all-999 builds.")

    pdf.sub_title("The Save/Reload Exploit")
    pdf.body("The game's random number generator is extremely simple (seed multiplied by 41). This is why the 'Nyght Method' works: the RNG state is saved with your game, so reloading and making a different choice shifts the sequence, potentially giving better training results.")

    # ==========================================
    # BATTLE
    # ==========================================
    pdf.add_page()
    pdf.section_title("Battle System")

    pdf.sub_title("How Attack Outcomes Are Decided")
    pdf.body("Each attack computes a score through 7 phases. The final score determines hit quality:")

    pdf.sub_sub_title("Phase 1: Type Compatibility")
    pdf.body("Hidden matchup grid between monster types. Gives -2 to +2 advantage. Some fights are rigged before they start. This is invisible to the player.")

    pdf.sub_sub_title("Phase 2: Guts Level")
    pdf.body("Average of both monsters' guts, mapped to tiers:")

    w = [30, 25, 35]
    pdf.table_row(["Avg Guts", "Tier", "Impact"], w, bold=True)
    pdf.table_row(["0-24", "Low", "Small bonus"], w)
    pdf.table_row(["25-49", "Med-Low", "Moderate bonus"], w)
    pdf.table_row(["50-69", "Medium", "Good bonus"], w)
    pdf.table_row(["70-89", "High", "Strong bonus"], w)
    pdf.table_row(["90+", "Very High", "Maximum bonus"], w)

    pdf.sub_sub_title("Phase 3: Loyalty / Mood")
    pdf.body("Same tiered system. Happy monsters literally fight harder.")

    pdf.sub_sub_title("Phase 4: Stat Differences (Core Formula)")
    pdf.body("For each of the 6 stats, the game checks the gap between attacker and defender:")
    pdf.callout("Stat gaps of 100 or less contribute NOTHING. Only advantages beyond 100 count.")
    pdf.body("For gaps above 100:")
    pdf.formula_box("bonus per stat = 1 + (gap_beyond_100 x 20 / 256)")
    pdf.body("Example: Your POW 500 vs opponent 300 = gap 200. Bonus = 1 + (100 x 20 / 256) = 8 points. All 6 stats are checked and bonuses stack.")

    pdf.sub_sub_title("Phase 5: Breed Compatibility")
    pdf.body("Another hidden -2 to +2 grid, this time based on breed family. Separate from type compatibility.")

    pdf.sub_sub_title("Phase 6: Level + Technique")
    pdf.body("Same level: +10. One level apart: +5. If a technique is used:")
    pdf.callout("Entire accumulated score is multiplied by 1.5x. This is why techniques dominate competitive play.")

    pdf.sub_title("Score to Outcome")
    w = [22, 33, 35]
    pdf.table_row(["Score", "Result", "Guts Change"], w, bold=True)
    pdf.table_row(["0-40", "Miss / Block", "-4 guts"], w)
    pdf.table_row(["41-50", "Grazing Hit", "-1 guts"], w)
    pdf.table_row(["51-65", "Solid Hit", "No change"], w)
    pdf.table_row(["66-99", "Heavy Hit", "+1 guts"], w)
    pdf.table_row(["100+", "Devastating", "+1 guts"], w)

    pdf.ln(2)
    pdf.callout("Missing costs -4 guts. This creates a death spiral: miss -> lose guts -> can't attack -> fall behind. This is why ACC is the most important stat.")

    pdf.sub_title("Why Certain Monsters Dominate")
    pdf.bullet("ACC is king: missing punishes hard, hitting rewards")
    pdf.bullet("Specialization > balance: the 100-point dead zone means small stat advantages don't register")
    pdf.bullet("Techniques are essential: 1.5x multiplier on everything")
    pdf.bullet("Hidden type matchups can swing fights before stats matter")
    pdf.bullet("Guts regen compounds: more attacks AND stronger attacks AND faster miss recovery")

    # ==========================================
    # LIFESPAN
    # ==========================================
    pdf.add_page()
    pdf.section_title("Lifespan & Aging")

    pdf.sub_title("How Lifespan Works")
    pdf.body("Every monster gets a fixed pool of lifespan points at birth. 10 points = 1 in-game week. All 194 monster types have base lifespans between 2370-2800 points (237-280 weeks).")

    w = [30, 30, 22, 45]
    pdf.table_row(["Category", "Weeks", "Count", "Notes"], w, bold=True)
    pdf.table_row(["Short-lived", "237-244", "16", "Pixie/Jell types"], w)
    pdf.table_row(["Below avg", "245-254", "51", "Lighter breeds"], w)
    pdf.table_row(["Average", "255-264", "56", "Most types"], w)
    pdf.table_row(["Above avg", "265-274", "28", "Sturdier breeds"], w)
    pdf.table_row(["Long-lived", "275-280", "1", "Longest breed"], w)

    pdf.ln(1)
    pdf.body("Only 18% variance between shortest and longest-lived breeds. How you raise the monster matters far more than breed choice for lifespan.")

    pdf.sub_title("Growth Curves: Early vs Late Bloomers")
    pdf.body("Each breed has one of 6 growth curve types that determine WHEN during their life they grow fastest. The game tracks an 'aging stage' from 0 (near death) to 15 (young), and maps it to a growth rate from 10 (minimum) to 30 (peak).")

    w = [25, 23, 25, 54]
    pdf.table_row(["Curve", "Peak", "Timing", "Strategy"], w, bold=True)
    pdf.table_row(["Early", "Stg 4-5", "First 30%", "Train hard immediately"], w)
    pdf.table_row(["Early-Mid", "Stg 6", "First 40%", "Heavy first year"], w)
    pdf.table_row(["Mid", "Stg 7", "Middle", "Steady throughout"], w)
    pdf.table_row(["Mid-Late", "Stg 8", "2nd half", "Patient, ramp up"], w)
    pdf.table_row(["Late", "Stg 10", "Last 35%", "Light early, heavy late"], w)
    pdf.table_row(["Flat", "All ~25", "Always", "Any schedule works"], w)

    pdf.ln(2)
    pdf.callout("Matching your training intensity to your breed's growth window can yield 20-30% more total stats over a lifetime. Early Bloomers should train hard from day one. Late Bloomers reward patience.")

    pdf.sub_title("What Drains Lifespan")
    pdf.bullet("Regular drills: FREE (0 cost) or slightly beneficial (-3 = +0.3 weeks)")
    pdf.bullet("Sparring: EXPENSIVE (27-45 points = 2.7-4.5 weeks of life per session)")
    pdf.bullet("Natural aging: occurs weekly regardless")
    pdf.ln(2)
    pdf.body("Practical example: A monster with 250 weeks of life that does 8 sparring sessions (avg cost ~40) loses ~32 weeks = 13% of its total lifespan. But 200 weeks of pure drills costs essentially nothing.")

    # ==========================================
    # COMBINING
    # ==========================================
    pdf.add_page()
    pdf.section_title("Combining (Breeding)")

    pdf.sub_title("The Combining Process")
    pdf.body("When you take two monsters to the Studio, offspring quality is determined by these inputs, in order:")

    pdf.sub_sub_title("1. Stress Tier")
    pdf.body("Average both parents' stress (0-100), map to a quality tier:")

    w = [33, 15, 30]
    pdf.table_row(["Avg Stress", "Tier", "Quality"], w, bold=True)
    pdf.table_row(["0-24", "1", "Excellent"], w)
    pdf.table_row(["25-49", "2", "Good"], w)
    pdf.table_row(["50-69", "3", "Average"], w)
    pdf.table_row(["70-89", "4", "Poor"], w)
    pdf.table_row(["90-100", "5", "Terrible"], w)

    pdf.ln(1)
    pdf.callout("Rest both parents before combining! Getting stress below 24 each gives you the best tier. This is the easiest optimization most players miss.")

    pdf.sub_sub_title("2. Breed-Specific Bonuses")
    pdf.body("Some breed combinations give +10 to specific stats:")
    pdf.bullet("Single-stat bonuses: POW, INT, ACC, SPD, DEF, or LIF +10")
    pdf.bullet("Dual bonuses: DEF+LIF, POW+INT, or ACC+SPD each get +10")
    pdf.bullet("Many combinations have no bonus")

    pdf.sub_sub_title("3. The Stat Inheritance Formula")
    pdf.body("Each stat calculated independently:")
    pdf.formula_box("offspring = parent_stat x (1 + (breed_bonus + stress_tier) / 100)\ncapped at 255")

    pdf.body("Example with parent POW = 200:")
    w = [44, 22, 22]
    pdf.table_row(["Scenario", "Result", "Gain"], w, bold=True)
    pdf.table_row(["Tier 1 + breed bonus", "222", "+11%"], w)
    pdf.table_row(["Tier 1, no bonus", "202", "+1%"], w)
    pdf.table_row(["Tier 3 + breed bonus", "226", "+13%"], w)
    pdf.table_row(["Tier 5, no bonus", "210", "+5%"], w)

    pdf.ln(1)
    pdf.callout("Breed bonus (+10) is worth far more than stress tier optimization. Getting the right breed combination matters most.")

    pdf.sub_sub_title("4. Offspring Stress")
    pdf.formula_box("offspring_stress = (parent1_stress + parent2_stress) / 5")
    pdf.body("Even two maxed-out parents (stress 100 each) only produce offspring with stress 40. The child starts in decent shape regardless.")

    pdf.sub_sub_title("5. Trait Inheritance")
    pdf.body("Traits from both parents combine via OR. If Parent 1 has Ironhart and Parent 2 has Charisma, the offspring gets both. Traits only accumulate, never diminish through breeding.")

    pdf.sub_sub_title("6. Technique Inheritance")
    pdf.body("Both parents must have technique proficiency above 48. If either is below, no techniques carry over. Make sure both parents have enough sparring/battle experience before combining.")

    # ==========================================
    # FATIGUE, STRESS & FOOD
    # ==========================================
    pdf.add_page()
    pdf.section_title("Fatigue, Stress & Food")

    pdf.sub_title("Fatigue Accumulation")
    pdf.body("Fatigue (0-100%) increases every week. Older monsters tire much faster:")

    w = [40, 42, 45]
    pdf.table_row(["Monster Age", "Extra Fatigue/Wk", "Total/Wk"], w, bold=True)
    pdf.table_row(["Young (400+)", "None", "+1"], w)
    pdf.table_row(["Mid (300-399)", "+1 (25% chance)", "+1 to +2"], w)
    pdf.table_row(["Older (200-299)", "+1 (50% chance)", "+1 to +2"], w)
    pdf.table_row(["Old (100-199)", "+1 always", "+2"], w)
    pdf.table_row(["Elderly (0-99)", "+2 always", "+3"], w)

    pdf.ln(1)
    pdf.callout("Older monsters fatigue 3x faster. This creates a downward spiral in their final weeks.")

    pdf.sub_title("Stress: The Sneaky Stat")
    pdf.body("Stress (0-100) increases by +1 every REST week. This is counterintuitive -- idle monsters get bored. Active weeks (training, tournaments) do NOT add stress through this path.")
    pdf.body("Stress is critical for combining: 0-19 = Excellent offspring quality, 80-100 = Terrible.")
    pdf.callout("Keep monsters active. Use items to reduce stress before combining.")

    pdf.sub_title("Happiness Drain by Loyalty")
    pdf.body("High-loyalty monsters need MORE attention. Weekly happiness drain:")

    w = [36, 45, 46]
    pdf.table_row(["Loyalty", "Drain/Week", "Meaning"], w, bold=True)
    pdf.table_row(["Very Disloyal", "30-50", "Low maintenance"], w)
    pdf.table_row(["Neutral", "90-110", "Moderate need"], w)
    pdf.table_row(["Very Loyal", "130-150", "High maintenance"], w)
    pdf.table_row(["Extremely Loyal", "150-200", "Very needy"], w)

    pdf.sub_title("Food Preferences")
    pdf.body("Each breed has a food preference (1-5), evenly distributed. Correct food provides a weekly bonus that offsets lifespan drain. Wrong food gives nothing. Feed items reduce fatigue/stress directly:")
    pdf.bullet("HonCandy (200g): Fatigue -30")
    pdf.bullet("MntCandy (800g): Fatigue -50, Stress -100")
    pdf.bullet("Oily Oil (1000g): Fatigue -128 (massive)")

    # ==========================================
    # SPARRING & TECHNIQUE LEARNING
    # ==========================================
    pdf.add_page()
    pdf.section_title("Sparring & Techniques")

    pdf.sub_title("Technique Learning Is Deterministic")
    pdf.callout("The biggest community misconception: technique learning is NOT random. There is no dice roll. It's a series of 35 condition checks.")
    pdf.body("When a coach can teach a technique, the game checks: Is it already known? Is the breed eligible? Is the specific learn condition met? Is there an empty slot?")
    pdf.body("The 35 conditions include stat comparisons, stat ratios, win records, and stat thresholds. If ALL pass, the technique is learned 100% of the time.")
    pdf.body("'Good Chance' and 'Highly Unlikely' are proximity indicators -- how close you are to meeting the conditions, not probability percentages.")

    pdf.sub_title("Sparring Stat Gains")
    pdf.body("Sparring stat deltas are calculated at coach hiring time:")
    pdf.formula_box("weekly_delta = monster_current_stat - breed_base_stat\nclamped to [-128, +127]")
    pdf.body("If your monster's stat is ABOVE the breed base, you gain. If BELOW, you LOSE stats. This strongly supports 'train stats first, spar later.'")
    pdf.callout("AGIMA teacher stats are display-only. They do NOT affect your actual stat gains from sparring.")

    pdf.sub_title("275 Techniques Decoded")
    pdf.body("30 breeds x 10 slots. Each technique has: damage (9-56), accuracy (24-80), guts cost (30-60), sharpness (0-45), status effect, range, force type (POW/INT/Both), and multi-hit (1-3).")
    pdf.body("Sharpness replaces 'crit' -- higher sharpness biases outcomes toward Strong/Overwhelming tiers rather than being a separate crit roll.")

    # ==========================================
    # TRAITS
    # ==========================================
    pdf.add_page()
    pdf.section_title("Traits / Characteristics")

    pdf.sub_title("87 Traits with 6 Effect Types")
    pdf.body("Each monster has 6 trait slots. Traits are checked via linear search at runtime.")

    pdf.sub_sub_title("Best Traits")
    w = [30, 40, 57]
    pdf.table_row(["Trait", "Effect", "Impact"], w, bold=True)
    pdf.table_row(["StatKing", "+50 all battle stats", "Best trait in game"], w)
    pdf.table_row(["Dignity", "+30 all battle stats", "Second best"], w)
    pdf.table_row(["Fire/Ice/etc", "+3 or +5 element dmg", "Good for specialists"], w)
    pdf.table_row(["Up Claws/Tail", "+3 body part dmg", "Technique boost"], w)

    pdf.sub_sub_title("Worst Traits")
    w = [30, 40, 57]
    pdf.table_row(["Trait", "Effect", "Impact"], w, bold=True)
    pdf.table_row(["Listless", "+50% lifespan drain", "Kills monster fast"], w)
    pdf.table_row(["Lazy/Slump", "Training gain = -25", "Wastes training"], w)
    pdf.table_row(["Worn Out", "Aging stage locked=1", "Stunted growth forever"], w)
    pdf.table_row(["GlssHart", "Stress/mood penalty", "Everywhere"], w)

    pdf.ln(1)
    pdf.callout("Traits reset to 0 during weekly training ticks. Trait development comes from battle, errantry, and events -- not from training.")

    # ==========================================
    # ITEMS & EXPEDITIONS
    # ==========================================
    pdf.add_page()
    pdf.section_title("Items & Expeditions")

    pdf.sub_title("Key Items")
    pdf.body("76 total items. Supplements are breed-indexed (same item differs per breed).")

    w = [30, 18, 79]
    pdf.table_row(["Item", "Cost", "Effect"], w, bold=True)
    pdf.table_row(["StarPrune", "N/A", "Major stat boost (+7, +1)"], w)
    pdf.table_row(["MeatSlab", "1000g", "Large stat boost (+10)"], w)
    pdf.table_row(["DietWeed", "1000g", "Weight loss (-7)"], w)
    pdf.table_row(["ShinyGem", "10000g", "Passive weekly drain offset"], w)
    pdf.table_row(["BrghtGem", "65000g", "Best passive drain offset"], w)
    pdf.table_row(["Fureria", "N/A", "Combining: DEF+LIF +10%"], w)
    pdf.table_row(["Gadamon", "N/A", "Combining: POW+INT +10%"], w)
    pdf.table_row(["Buragma", "N/A", "Combining: SPD+ACC +10%"], w)

    pdf.sub_title("Expeditions")
    pdf.body("16 areas from 2000g to 32500g cost. Duration depends on INT:")
    pdf.bullet("INT 0-400: 24 weeks away")
    pdf.bullet("INT 401-600: 16 weeks")
    pdf.bullet("INT 600+: 8 weeks")
    pdf.body("Loot requires stat thresholds (>499 and >699). Stress decreases -2/week during expeditions. Special encounters at high scores can award rare items.")

    # ==========================================
    # TOURNAMENTS & RANK
    # ==========================================
    pdf.add_page()
    pdf.section_title("Tournaments & Rank")

    pdf.sub_title("Rank Progression")
    pdf.body("Ranks E(0) through S(5). Rank-up at month end. Monthly decay based on current value:")

    w = [35, 30, 62]
    pdf.table_row(["Current Points", "Monthly Decay", "Notes"], w, bold=True)
    pdf.table_row(["300-499", "-2", "Mild decay"], w)
    pdf.table_row(["500-699", "-6", "Moderate decay"], w)
    pdf.table_row(["700-899", "-12", "Heavy decay"], w)
    pdf.table_row(["900+", "-20", "Must keep winning"], w)

    pdf.sub_title("Tournament Rewards")
    pdf.body("Per victory: +140 to +160 stat total, +120-140g money, -1 fatigue. Rank points +160 to +384. Prize money scales with fame tier (20-133g per match).")
    pdf.body("Opponents cap at 250 per stat -- well below a trained monster's 999 ceiling.")

    pdf.sub_title("Stray Encounters")
    pdf.body("Require stat_total > 499 AND rank_points > 699. Score determines tier: common at 1000+, rare at 1400+. Rare encounters have 1-in-3 chance of special event with item rewards.")

    # ==========================================
    # SHRINE / PASSWORDS
    # ==========================================
    pdf.add_page()
    pdf.section_title("Shrine / Passwords")

    pdf.sub_title("The Password Algorithm")
    pdf.body("The shrine computes 4 polynomial hashes from your password. Each hash alternates multiply and add operations per character position:")
    pdf.formula_box("Even step: accumulator += (char + index + 1)\nOdd step:  accumulator *= (char + index + 1)\nFinal:     hash = accumulator & 0xFF")
    pdf.body("The 4 hashes determine: main breed (256 entries), sub breed (256 entries), stat deltas (64 entries), and technique selection.")

    pdf.sub_title("Password Length Matters")
    w = [25, 50, 52]
    pdf.table_row(["Length", "What's Active", "Quality"], w, bold=True)
    pdf.table_row(["1 char", "Pure breed, zero deltas", "Worst"], w)
    pdf.table_row(["2 chars", "Breed + stat deltas", "Better"], w)
    pdf.table_row(["3+ chars", "Full system + techs", "Best"], w)

    pdf.ln(1)
    pdf.body("Community password databases work because there's a dictionary table at 0x08217368 that maps specific words to predetermined monsters, bypassing the hash entirely.")

    pdf.sub_title("Stat Delta Range")
    pdf.body("The 64-entry stat delta table adds -23 to +25 per stat on top of breed base. Best entry adds +66 total stats. Breed base stats (40-175 per stat) matter far more than the password delta.")

    # ==========================================
    # COMMUNITY CORRECTIONS
    # ==========================================
    pdf.add_page()
    pdf.section_title("Community Corrections")
    pdf.body("Findings from ROM analysis that contradict common community beliefs:")
    pdf.ln(1)

    pdf.bold_body("'Technique learning is probabilistic'")
    pdf.body("WRONG. It's 35 deterministic condition checks. No PRNG call exists in the learning path. 'Good Chance' means most conditions met, not 75%.")

    pdf.bold_body("'AGIMA stats affect training gains'")
    pdf.body("WRONG. AGIMA stats are display-only for the coach selection UI. Sparring stat delta = your_stat - breed_base_stat.")

    pdf.bold_body("'Offspring inherit parent stats directly'")
    pdf.body("WRONG. Offspring starts from breed base stats, modified by a compatibility percentage. Parents contribute indirectly through compatibility scoring.")

    pdf.bold_body("'Rest reduces stress'")
    pdf.body("PARTIALLY WRONG. Stress actually increases by +1 every rest week (boredom). Training/tournament weeks do NOT add stress. Items reduce stress directly.")

    pdf.bold_body("'High loyalty is always good'")
    pdf.body("NUANCED. High loyalty increases the Phase 3 battle modifier, but also increases weekly happiness drain by 3-7x. High-loyalty monsters need more food/attention to maintain happiness.")

    # ==========================================
    # MODDING CHEAT SHEET
    # ==========================================
    pdf.add_page()
    pdf.section_title("Modding Cheat Sheet")
    pdf.body("High-impact balance changes via ROM editing:")

    pdf.sub_title("Training")
    pdf.bullet("Coach stat totals: buff/nerf coaches")
    pdf.bullet("Sparring fatigue (27-45): lower for cheaper technique learning")
    pdf.bullet("Light/Heavy drill weights: rebalance stat distribution")

    pdf.sub_title("Battle")
    pdf.bullet("100-point dead zone: lower to reward balanced builds")
    pdf.bullet("Miss penalty (-4 guts): reduce for less ACC dominance")
    pdf.bullet("Technique 1.5x multiplier: tune down for less tech dependency")
    pdf.bullet("Type matchup grid: rebalance breed advantages")
    pdf.bullet("Guts regen timers: adjust SPD-based recovery rates")

    pdf.sub_title("Lifespan & Fatigue")
    pdf.bullet("Breed lifespans: multiply for more forgiving gameplay")
    pdf.bullet("Growth curves: flatten for even growth at any age")
    pdf.bullet("Age-based fatigue: reduce elderly penalty for longer useful life")
    pdf.bullet("Loyalty drain table: reduce to make happiness easier")

    pdf.sub_title("Combining & Traits")
    pdf.bullet("255 stat cap: raise for deeper multi-gen breeding")
    pdf.bullet("Breed combination matrix: change available offspring")
    pdf.bullet("Legendary recipes: add/modify the 27 special combinations")
    pdf.bullet("Trait effect values: tune StatKing +50, Listless 1.5x, etc.")

    pdf.ln(4)
    pdf.set_font("Helvetica", "I", 9)
    pdf.set_text_color(120, 120, 120)
    pdf.cell(0, 5, "Technical reference (ROM addresses, data tables, disassembly)", align="C", new_x="LMARGIN", new_y="NEXT")
    pdf.cell(0, 5, "available in the analysis/ folder of the mra2-decon repo.", align="C", new_x="LMARGIN", new_y="NEXT")

    return pdf


if __name__ == "__main__":
    pdf = build_pdf()
    out = "MRA2_Mechanics_Guide.pdf"
    pdf.output(out)
    print(f"Generated {out}")
