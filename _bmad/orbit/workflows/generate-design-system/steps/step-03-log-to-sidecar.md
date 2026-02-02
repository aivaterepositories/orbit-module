# Step 3: Log to Aurora Sidecar Memory

**Agent:** Aurora
**Purpose:** Track design system decisions in Aurora's sidecar memory for future reference

## Actions

### 1. Read the Generated MASTER.md

```bash
cat design-system/[project-slug]/MASTER.md
```

### 2. Append to Aurora's Design Decisions Log

**File:** `_bmad/_memory/aurora-sidecar/design-decisions.md`

**Format:**
```markdown
## [Timestamp] - [Project Name]

**Query:** [search_query]
**Project Type:** [type]
**Style:** [style_name]
**Tech Stack:** [tech_stack]

**Key Decisions:**
- Primary Color: [hex]
- Typography: [heading] / [body]
- Pattern: [pattern_name]
- Notable Effects: [key_effects]

**Files Generated:**
- design-system/[project-slug]/MASTER.md
- design-system/[project-slug]/pages/[page].md (if applicable)

**Notes:** [Any special considerations or customizations]

---
```

### 3. Example Log Entry

```markdown
## 2026-02-02 23:45 - Serenity Spa

**Query:** beauty spa wellness service elegant professional
**Project Type:** Beauty/Wellness Service
**Style:** Minimalism + Elegant
**Tech Stack:** html-tailwind

**Key Decisions:**
- Primary Color: #E8B4A8 (Soft Rose)
- Typography: Playfair Display / Lato
- Pattern: Hero-Centric with Trust Signals
- Notable Effects: Soft shadows, gentle hover transitions, subtle parallax

**Files Generated:**
- design-system/serenity-spa/MASTER.md

**Notes:** Client emphasized trust and professionalism. Soft colors to convey relaxation and luxury.

---
```

### 4. Update UI Libraries Log (Optional)

If using specific component libraries or tools:

**File:** `_bmad/_memory/aurora-sidecar/ui-libraries.md`

**Format:**
```markdown
## [Project Name] - [Timestamp]

**Libraries Used:**
- Heroicons for SVG icons
- Tailwind CSS for styling
- [Other libraries]

**Component Sources:**
- Buttons: Custom from MASTER.md
- Cards: Custom from MASTER.md
- Forms: [Component library if used]

---
```

## Output

Logs written to:
- `_bmad/_memory/aurora-sidecar/design-decisions.md`
- `_bmad/_memory/aurora-sidecar/ui-libraries.md` (optional)

## Next Step

{project-root}/_bmad/orbit/workflows/generate-design-system/steps/step-04-review-present.md
