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
    pdf.body("This guide covers four core systems extracted from the MRA2 ROM. Here's the one-sentence summary for each:")
    pdf.ln(2)

    pdf.bold_body("Training & Raising")
    pdf.body("Your monster's stat gains are determined by your coach's quality, your breed's hidden growth curve (early/late bloomer), and your monster's age. Drills are free; sparring costs 3-5 weeks of lifespan per session.")

    pdf.bold_body("Battle")
    pdf.body("Battle outcomes are decided by hidden type matchups, stat gaps (only gaps > 100 matter), guts level, loyalty, level difference, and whether a technique was used (1.5x multiplier). Missing costs -4 guts, creating death spirals.")

    pdf.bold_body("Lifespan & Aging")
    pdf.body("All breeds live 237-280 weeks (only 18% variance). Growth peaks at different times depending on your breed's curve type. Sparring is the main lifespan drain. Regular drills are basically free.")

    pdf.bold_body("Combining (Breeding)")
    pdf.body("Offspring stats = parent stats + a percentage bonus based on stress tier and breed bonus. Breed bonus (+10) matters far more than stress tier. Rest parents before combining. Both need technique proficiency > 48 to pass on moves.")

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
    # MODDING CHEAT SHEET
    # ==========================================
    pdf.add_page()
    pdf.section_title("Modding Cheat Sheet")
    pdf.body("High-impact balance changes that can be made by editing ROM data:")

    pdf.sub_title("Training Balance")
    pdf.bullet("Change coach stat totals to buff/nerf specific coaches")
    pdf.bullet("Change sparring fatigue costs (27-45) to make technique learning cheaper")
    pdf.bullet("Set all fatigue to 0 to remove lifespan drain entirely")

    pdf.sub_title("Battle Balance")
    pdf.bullet("Reduce the 100-point stat dead zone (e.g., to 50) to reward balanced builds")
    pdf.bullet("Reduce miss penalty from -4 to -2 guts for less ACC dominance")
    pdf.bullet("Reduce technique multiplier from 1.5x to 1.2x")
    pdf.bullet("Edit the type matchup grid to rebalance breed advantages")

    pdf.sub_title("Lifespan Balance")
    pdf.bullet("Multiply all breed lifespans (e.g., x2) for more forgiving gameplay")
    pdf.bullet("Flatten growth curves so all breeds grow evenly at any age")
    pdf.bullet("Halve sparring costs so technique learning is less punishing")

    pdf.sub_title("Combining Balance")
    pdf.bullet("Raise the 255 stat cap for deeper multi-generation breeding")
    pdf.bullet("Adjust breed bonuses to change which combinations are optimal")
    pdf.bullet("Lower technique proficiency threshold (from 48) for easier tech inheritance")

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
