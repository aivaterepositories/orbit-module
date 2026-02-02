# Step 4: Review & Present Design System

**Agent:** Aurora
**Purpose:** Present the generated design system to the user and offer refinements

## Actions

### 1. Read the Generated MASTER.md

```bash
cat design-system/[project-slug]/MASTER.md
```

### 2. Present Design System Summary

Provide a clear, structured summary:

```markdown
## Design System Generated: [Project Name]

I've created a comprehensive design system for your project!

### 📂 Files Created
- `design-system/[project-slug]/MASTER.md` - Your global design system

### 🎨 Key Design Decisions

**Colors:**
- Primary: [hex] - [color name/mood]
- Secondary: [hex]
- CTA: [hex]
- Background: [hex]
- Text: [hex]

**Typography:**
- Headings: [font name]
- Body: [font name]
- Mood: [typography mood]

**Style:** [style name]
- [Key characteristics]

**Page Pattern:** [pattern name]
- [Section structure]
- [CTA strategy]

**Key Effects:**
- [Effects and animations]

**Anti-Patterns to Avoid:**
- [Anti-patterns from reasoning]

### ✅ Pre-Delivery Checklist Included
- No emojis as icons (SVG only)
- Cursor pointer on all clickable elements
- Smooth transitions (150-300ms)
- 4.5:1 contrast minimum
- Responsive breakpoints
- And more...

### 📖 How to Use This Design System

1. **Read MASTER.md** - Your source of truth for all design decisions
2. **Follow the component specs** - Button, card, input, modal styles included
3. **Check pre-delivery checklist** - Before delivering any UI code
4. **Create page overrides** - When specific pages need different rules

### Next Steps

Would you like me to:
1. **Generate a page-specific override** (e.g., for dashboard, checkout, etc.)
2. **Refine the design system** (different colors, style, or typography)
3. **Start building components** using this design system
4. **Export to Figma** (if you use Figma for designs)

Let me know what you'd like to do next!
```

### 3. Offer Iterations

**If user wants refinements:**
```
I can regenerate the design system with different parameters:
- Try a different style (e.g., glassmorphism, brutalism, etc.)
- Adjust the color mood (warmer, cooler, more vibrant)
- Change typography pairing (more playful, more serious)
- Focus on different page pattern

Just let me know what you'd like to adjust!
```

**If user wants page overrides:**
```
I can create page-specific design overrides for:
- Dashboard/Admin panels
- Checkout/Payment flows
- Pricing pages
- Blog/Article pages
- Authentication pages

Which page needs custom design rules?
```

### 4. Optional: Generate Additional Searches

If user needs more specific guidance:

```bash
# Get detailed UX guidelines
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "animation accessibility hover transitions" \
  --domain ux

# Get alternative typography options
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "elegant luxury serif" \
  --domain typography

# Get stack-specific best practices
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "responsive layout form validation" \
  --stack html-tailwind
```

## Output

- User understands the design system
- User is ready to proceed with implementation or refinement

## Workflow Complete

Aurora has successfully generated and presented the design system!

**User can now:**
- Build UI components using MASTER.md
- Request page-specific overrides
- Iterate on the design system
- Start implementation with clear design guidance
