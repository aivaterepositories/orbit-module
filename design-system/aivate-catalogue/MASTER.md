# Design System Master File - Aivate Catalogue

> **LOGIC:** When building a specific page, first check `design-system/pages/[page-name].md`.
> If that file exists, its rules **override** this Master file.
> If not, strictly follow the rules below.

---

**Project:** Aivate Catalogue
**Generated:** 2026-02-03 (Updated with Brand Guidelines)
**Brand:** Aivate Official Brand Guidelines

---

## 🎨 Aivate Brand Colors

### Primary Colors

| Role | Name | Hex | RGB | CMYK | Usage |
|------|------|-----|-----|------|-------|
| **Primary** | Mint Green | `#99F6E4` | 136/235/197 | 42/0/16/8 | Innovation, vibrancy, tech-forward presence |
| **Secondary** | Indigo 600 | `#4F46E5` | 89/70/223 | 60/69/0/13 | Confidence, creativity, cutting-edge tech |
| **Grounding** | Slate 900 | `#0F172A` | 14/17/34 | 59/50/0/87 | Depth, professionalism, stability |

### Neutral Support Colors

| Role | Name | Hex | RGB | CMYK | Usage |
|------|------|-----|-----|------|-------|
| **Black** | Absolute Black | `#000000` | 0/0/0 | 0/0/0/100 | Contrast, definition, sophistication |
| **White** | Pure White | `#FFFFFF` | 0/0/0 | 0/0/0/0 | Clarity, breathability, modern aesthetic |

### Gradient (Signature Brand Element)

**Indigo-Mint Gradient:**
- Start: `#88ebc5` (Mint)
- End: `#5946df` (Indigo)

**Usage Rules:**
- ✅ Use for: Logo, hero sections, buttons, icons, feature highlights
- ❌ Avoid: Overusing (maintain impact and consistency)

### CSS Variables

```css
:root {
  /* Primary Colors */
  --color-mint: #99F6E4;
  --color-indigo: #4F46E5;
  --color-slate: #0F172A;

  /* Neutrals */
  --color-black: #000000;
  --color-white: #FFFFFF;

  /* Gradient */
  --gradient-indigo-mint: linear-gradient(135deg, #88ebc5 0%, #5946df 100%);

  /* Semantic Colors */
  --color-primary: var(--color-indigo);
  --color-secondary: var(--color-mint);
  --color-background: var(--color-white);
  --color-text: var(--color-black);
  --color-text-inverse: var(--color-white);
}
```

---

## 📝 Typography - Aivate Brand

### Primary Typeface: Open Sans

**Font Family:** Open Sans (Google Fonts)
**Character:** Clean, modern, highly readable sans-serif
**Performance:** Consistent across digital and print platforms

**Google Fonts Import:**
```css
@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap');
```

### Font Weights Available
- Light (300)
- Regular (400)
- Medium (500)
- SemiBold (600)
- Bold (700)
- ExtraBold (800)

### Typography Scale

```css
/* Headings */
h1 {
  font-family: 'Open Sans', sans-serif;
  font-size: 3rem; /* 48px */
  font-weight: 700;
  line-height: 1.2;
  letter-spacing: -0.02em;
}

h2 {
  font-family: 'Open Sans', sans-serif;
  font-size: 2.25rem; /* 36px */
  font-weight: 700;
  line-height: 1.3;
}

h3 {
  font-family: 'Open Sans', sans-serif;
  font-size: 1.875rem; /* 30px */
  font-weight: 600;
  line-height: 1.4;
}

h4 {
  font-family: 'Open Sans', sans-serif;
  font-size: 1.5rem; /* 24px */
  font-weight: 600;
  line-height: 1.5;
}

/* Body Text */
body {
  font-family: 'Open Sans', sans-serif;
  font-size: 1rem; /* 16px */
  font-weight: 400;
  line-height: 1.6;
  letter-spacing: 0;
}

/* Small Text */
small {
  font-size: 0.875rem; /* 14px */
  line-height: 1.5;
}
```

### Aivate Typography Usage Guidelines

**From Brand Guidelines:**
1. ✅ Maintain consistent line spacing and letter spacing for readability
2. ✅ Use bold weights sparingly (headings, CTAs, metrics only)
3. ✅ Avoid over-styling (no italics/underlines unless for emphasis)
4. ✅ Ensure proper contrast between text and background (esp. with mint and indigo)
5. ✅ Stick to sentence case (avoid all caps unless button/label)

---

## 🎨 Font Color Usage by Context

### Default (Light Mode)
```css
/* Light Mode - Default */
.heading {
  color: #4F46E5; /* Indigo 600 */
}

.subheading {
  color: #4F46E5; /* Indigo 600 */
}

.body-text {
  color: #000000; /* Black */
}
```

### Dark Mode
```css
/* Dark Mode - Slate 900 Background */
.dark .heading {
  color: #99F6E4; /* Mint Green */
}

.dark .subheading {
  color: #99F6E4; /* Mint Green */
}

.dark .body-text {
  color: #FFFFFF; /* White */
}
```

### Indigo Background
```css
/* Indigo Background */
.bg-indigo .heading {
  color: #99F6E4; /* Mint on Indigo */
}

.bg-indigo .subheading {
  color: #99F6E4;
}

.bg-indigo .body-text {
  color: #FFFFFF;
}
```

### Mint Background
```css
/* Mint Background */
.bg-mint .heading {
  color: #4F46E5; /* Indigo on Mint */
}

.bg-mint .subheading {
  color: #4F46E5;
}

.bg-mint .body-text {
  color: #0F172A; /* Slate 900 */
}
```

---

## 🧩 Component Specs (Aivate Brand)

### Buttons

```css
/* Primary Button - Indigo with Mint Hover */
.btn-primary {
  background: #4F46E5; /* Indigo */
  color: #FFFFFF;
  padding: 12px 32px;
  border-radius: 8px;
  font-family: 'Open Sans', sans-serif;
  font-weight: 600;
  font-size: 16px;
  transition: all 200ms ease;
  cursor: pointer;
  border: none;
  text-transform: uppercase; /* Buttons use all caps */
  letter-spacing: 0.05em;
}

.btn-primary:hover {
  background: #99F6E4; /* Mint on hover */
  color: #0F172A; /* Slate text */
  transform: translateY(-2px);
  box-shadow: 0 8px 16px rgba(79, 70, 229, 0.3);
}

/* Gradient Button - Signature Aivate Style */
.btn-gradient {
  background: linear-gradient(135deg, #88ebc5 0%, #5946df 100%);
  color: #FFFFFF;
  padding: 12px 32px;
  border-radius: 8px;
  font-family: 'Open Sans', sans-serif;
  font-weight: 600;
  font-size: 16px;
  transition: all 200ms ease;
  cursor: pointer;
  border: none;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.btn-gradient:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 24px rgba(79, 70, 229, 0.4);
  filter: brightness(1.1);
}

/* Secondary Button - Outlined */
.btn-secondary {
  background: transparent;
  color: #4F46E5;
  border: 2px solid #4F46E5;
  padding: 12px 32px;
  border-radius: 8px;
  font-family: 'Open Sans', sans-serif;
  font-weight: 600;
  font-size: 16px;
  transition: all 200ms ease;
  cursor: pointer;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.btn-secondary:hover {
  background: #4F46E5;
  color: #FFFFFF;
}
```

### Cards

```css
.card {
  background: #FFFFFF;
  border-radius: 16px;
  padding: 24px;
  border: 1px solid rgba(79, 70, 229, 0.1);
  transition: all 250ms ease;
  cursor: pointer;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 32px rgba(79, 70, 229, 0.15);
  border-color: #4F46E5;
}

/* Card with Gradient Border */
.card-gradient-border {
  background: #FFFFFF;
  border-radius: 16px;
  padding: 24px;
  position: relative;
  overflow: hidden;
}

.card-gradient-border::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: 16px;
  padding: 2px;
  background: linear-gradient(135deg, #88ebc5 0%, #5946df 100%);
  -webkit-mask: linear-gradient(#fff 0 0) content-box, linear-gradient(#fff 0 0);
  -webkit-mask-composite: xor;
  mask-composite: exclude;
}
```

### Inputs

```css
.input {
  padding: 12px 16px;
  border: 2px solid rgba(79, 70, 229, 0.2);
  border-radius: 8px;
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  transition: all 200ms ease;
  background: #FFFFFF;
  color: #000000;
}

.input:focus {
  border-color: #4F46E5;
  outline: none;
  box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
}

.input::placeholder {
  color: rgba(0, 0, 0, 0.4);
}
```

### Navigation Cards (for Landing Page)

```css
.nav-card {
  background: #FFFFFF;
  border-radius: 20px;
  padding: 48px 32px;
  border: 2px solid rgba(79, 70, 229, 0.1);
  transition: all 300ms ease;
  cursor: pointer;
  text-align: center;
  position: relative;
  overflow: hidden;
}

.nav-card::before {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(135deg, #88ebc5 0%, #5946df 100%);
  opacity: 0;
  transition: opacity 300ms ease;
}

.nav-card:hover::before {
  opacity: 0.05;
}

.nav-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 20px 40px rgba(79, 70, 229, 0.2);
  border-color: #4F46E5;
}

.nav-card-icon {
  width: 64px;
  height: 64px;
  margin: 0 auto 24px;
  background: linear-gradient(135deg, #88ebc5 0%, #5946df 100%);
  border-radius: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #FFFFFF;
}

.nav-card-title {
  font-family: 'Open Sans', sans-serif;
  font-size: 24px;
  font-weight: 700;
  color: #4F46E5;
  margin-bottom: 12px;
}

.nav-card-description {
  font-family: 'Open Sans', sans-serif;
  font-size: 16px;
  color: #000000;
  opacity: 0.7;
}
```

---

## 📐 Spacing System

| Token | Value | Usage |
|-------|-------|-------|
| `--space-xs` | `4px` / `0.25rem` | Tight gaps |
| `--space-sm` | `8px` / `0.5rem` | Icon gaps, inline spacing |
| `--space-md` | `16px` / `1rem` | Standard padding |
| `--space-lg` | `24px` / `1.5rem` | Section padding |
| `--space-xl` | `32px` / `2rem` | Large gaps |
| `--space-2xl` | `48px` / `3rem` | Section margins |
| `--space-3xl` | `64px` / `4rem` | Hero padding |
| `--space-4xl` | `96px` / `6rem` | Major section spacing |

---

## 🎭 Shadow System

```css
:root {
  --shadow-sm: 0 2px 4px rgba(15, 23, 42, 0.05);
  --shadow-md: 0 4px 12px rgba(79, 70, 229, 0.1);
  --shadow-lg: 0 12px 24px rgba(79, 70, 229, 0.15);
  --shadow-xl: 0 20px 40px rgba(79, 70, 229, 0.2);

  /* Gradient glow */
  --shadow-gradient: 0 8px 32px rgba(89, 70, 223, 0.3);
}
```

---

## 🎨 Design Principles (Aivate Brand)

### Color Philosophy
- **Innovation:** Mint Green symbolizes forward-thinking and vibrancy
- **Confidence:** Indigo represents cutting-edge technology and creativity
- **Stability:** Slate 900 grounds the brand with professionalism
- **Clarity:** Pure white ensures breathability and modern aesthetic

### Typography Philosophy
- **Readability First:** Open Sans ensures clarity across all platforms
- **Consistency:** Maintain spacing and avoid over-styling
- **Hierarchy:** Use bold weights strategically (headings, CTAs, metrics)
- **Accessibility:** Proper contrast ratios, especially on colored backgrounds

### Gradient Usage Strategy
- **Sparingly Applied:** Logo, hero sections, key buttons, icons
- **Maximum Impact:** Avoid overuse to maintain brand recognition
- **Visual Highlights:** Feature important elements with gradient treatment

---

## 🚫 Anti-Patterns (Do NOT Use)

### Typography Violations
- ❌ **All caps for body text** (only for buttons/labels)
- ❌ **Over-styling** (excessive italics, underlines)
- ❌ **Inconsistent spacing** (maintain line/letter spacing)
- ❌ **Poor contrast** (ensure readability on all backgrounds)
- ❌ **Random font weights** (use system: 400 body, 600 subheadings, 700 headings)

### Color Violations
- ❌ **Gradient overuse** (reserve for key elements only)
- ❌ **Off-brand colors** (stick to defined palette)
- ❌ **Low contrast combinations** (test all text/background pairs)
- ❌ **Inconsistent color usage** (follow context rules: light/dark/mint/indigo)

### Component Violations
- ❌ **Emojis as icons** (use SVG icons from Heroicons/Lucide)
- ❌ **Missing cursor:pointer** (all interactive elements need it)
- ❌ **Layout-shifting hovers** (use transform, not scale on containers)
- ❌ **Instant state changes** (always use transitions 150-300ms)
- ❌ **Invisible focus states** (critical for accessibility)

---

## ✅ Pre-Delivery Checklist

### Brand Compliance
- [ ] All colors match Aivate palette (Mint, Indigo, Slate, Black, White)
- [ ] Typography uses Open Sans exclusively
- [ ] Font color usage follows context rules (light/dark/mint/indigo backgrounds)
- [ ] Gradient used sparingly (logo, hero, buttons, highlights only)
- [ ] Sentence case used (all caps only for buttons/labels)

### Technical Quality
- [ ] All interactive elements have `cursor: pointer`
- [ ] Hover states with smooth transitions (150-300ms)
- [ ] Focus states visible for keyboard navigation
- [ ] Text contrast meets WCAG AA (4.5:1 minimum)
- [ ] Responsive at 375px, 768px, 1024px, 1440px
- [ ] `prefers-reduced-motion` respected
- [ ] No horizontal scroll on mobile
- [ ] Images optimized (WebP, lazy loading)

### Aivate-Specific
- [ ] Bold weights used sparingly (headings, CTAs, metrics)
- [ ] Line/letter spacing consistent
- [ ] No over-styling (italics/underlines only for emphasis)
- [ ] Proper contrast on colored backgrounds verified
- [ ] Gradient elements maintain impact (not overused)

---

## 📱 Responsive Breakpoints

```css
/* Mobile First Approach */
/* xs: 0-639px (mobile) */
/* sm: 640px+ (large mobile) */
/* md: 768px+ (tablet) */
/* lg: 1024px+ (desktop) */
/* xl: 1280px+ (large desktop) */
/* 2xl: 1536px+ (extra large) */
```

---

**Design System Version:** 2.0 (Aivate Brand Guidelines)
**Last Updated:** 2026-02-03
**Status:** Production Ready - Aivate Official Colors & Typography
**Reference:** Aivate Brand Guidelines Document
