# Aurora Skills Guide — Adding Frontend Skills & Components

**For:** Marky (mark@aivate.net)
**Agent:** Aurora (Frontend Designer & UI/UX Specialist)
**Module:** ORBIT

---

## Table of Contents

1. [Architecture Overview](#1-architecture-overview)
2. [Adding a New Prompt (Skill)](#2-adding-a-new-prompt-skill)
3. [Adding a Menu Trigger](#3-adding-a-menu-trigger)
4. [Adding Principles & Critical Actions](#4-adding-principles--critical-actions)
5. [Full Example: Component Integration Protocol](#5-full-example-component-integration-protocol)
6. [Logging to Sidecar Memory](#6-logging-to-sidecar-memory)
7. [Adding a Full Workflow (Multi-Step)](#7-adding-a-full-workflow-multi-step)
8. [Quick Reference Checklist](#8-quick-reference-checklist)
9. [Common Mistakes to Avoid](#9-common-mistakes-to-avoid)

---

## 1. Architecture Overview

Aurora's "soul" is split across these locations:

```
orbit-module/
├── _bmad/
│   ├── orbit/
│   │   ├── agents/
│   │   │   └── frontend-designer.yaml    ← Aurora's brain (agent definition)
│   │   └── workflows/
│   │       ├── generate-design-system/    ← Multi-step workflow (exists)
│   │       └── design-frontend/           ← Referenced but MISSING
│   └── _memory/
│       └── aurora-sidecar/
│           ├── README.md                  ← Sidecar docs
│           ├── design-decisions.md        ← Design system generation log
│           └── ui-libraries.md            ← Library tracking
└── .claude/
    └── skills/
        └── ui-ux-pro-max/                 ← Separate skill (design systems)
```

**What goes where:**

| Location | Purpose | Example |
|----------|---------|---------|
| `frontend-designer.yaml` → `persona` | Who Aurora IS (identity, principles) | "Accessibility is a requirement" |
| `frontend-designer.yaml` → `critical_actions` | Things Aurora MUST always do | "Load design-decisions.md before work" |
| `frontend-designer.yaml` → `prompts` | Structured skill templates | Component integration protocol |
| `frontend-designer.yaml` → `menu` | User-facing triggers | `[IC] Integrate Component` |
| `aurora-sidecar/` | Persistent memory across sessions | Past design decisions, library usage |
| `workflows/` | Complex multi-step procedures | Generate design system (4 steps) |

---

## 2. Adding a New Prompt (Skill)

Prompts are Aurora's structured skills. They live in the `prompts:` section of `frontend-designer.yaml`.

### Structure

```yaml
    - id: 'your-prompt-id'          # Unique kebab-case identifier
      content: |
        <instructions>
        What this prompt does — Aurora reads this as her directive.
        </instructions>

        **Step 1 — [Step Name]**

        [What to do in this step]

        **Step 2 — [Step Name]**

        [What to do in this step]
```

### Rules

- `id` must be unique across all prompts in the file
- Use kebab-case: `integrate-component`, `review-accessibility`, `audit-design`
- The `<instructions>` block tells Aurora what this skill does
- Use markdown formatting inside `content: |` (the `|` preserves line breaks)
- Keep each step actionable and specific — Aurora follows them literally

### Where to Insert

Add new prompts AFTER the last existing prompt and BEFORE the `menu:` section:

```yaml
  prompts:
    - id: 'ui-review'
      content: |
        ...

    - id: 'component-recommendation'
      content: |
        ...

    - id: 'your-new-prompt'        # ← ADD HERE
      content: |
        ...

  menu:                             # ← BEFORE this line
```

---

## 3. Adding a Menu Trigger

Menu triggers are how users invoke Aurora's skills. They live in the `menu:` section.

### Single Trigger

```yaml
    - trigger: 'trigger-name'
      route: '#prompt-id'                    # Points to a prompt by id
      description: 'What it does 🎯'
      type: exec
```

### Multi Trigger (Multiple Options on One Line)

```yaml
    - multi: '[XX] Option One [YY] Option Two'
      triggers:
        - option-one:
            input: XX
            route: '#prompt-id'
            description: 'First option 🎯'
            type: exec
        - option-two:
            input: YY
            route: '#other-prompt-id'
            description: 'Second option 🔧'
            type: exec
```

### Route Types

| Route | Points To | Example |
|-------|-----------|---------|
| `#prompt-id` | A prompt in the same YAML | `#integrate-component` |
| `{project-root}/_bmad/.../workflow.md` | An external workflow file | Full workflow with steps |
| (none — use `action:` instead) | Freeform agent behavior | `action: 'Quick design analysis'` |

### Trigger Types

| Type | Behavior |
|------|----------|
| `exec` | Execute the prompt or workflow |
| `action` | Aurora responds freely based on the action description |

---

## 4. Adding Principles & Critical Actions

### Principles

Principles shape HOW Aurora thinks. Add to `persona.principles:`:

```yaml
    principles:
      - "Existing principle here"
      - "Your new principle here"       # ← ADD at the end
```

**Good principles are:**
- Short (one sentence)
- Opinionated (take a stance)
- Actionable (Aurora can follow them)

**Examples:**
```yaml
      - "Component integration follows a strict validation-first protocol"
      - "Never ship a component without verifying responsive behavior"
      - "Prefer composition over custom CSS for component variants"
      - "Every component must have a demo usage example"
```

### Critical Actions

Critical actions are things Aurora MUST do every time. Add to `critical_actions:`:

```yaml
  critical_actions:
    - 'Existing action here'
    - 'Your new action here'            # ← ADD at the end
```

**Good critical actions are:**
- Imperative (commands, not suggestions)
- Specific (name exact files, paths, or behaviors)
- Essential (things that break if skipped)

**Examples:**
```yaml
    - 'Verify Shadcn + Tailwind + TypeScript are initialized before any component work'
    - 'Always provide a demo.tsx showing component usage after integration'
    - 'Check /components/ui path exists before placing any component'
```

---

## 5. Full Example: Component Integration Protocol

Here is a complete example of adding a new skill to Aurora. This adds the ability to integrate React components into a codebase.

### Step A — Add the Principle (line 20, after last principle)

```yaml
      - "Component integration follows a strict validation-first protocol"
```

### Step B — Add the Critical Action (line 26, after last action)

```yaml
    - 'When integrating components: validate stack (Shadcn + Tailwind + TypeScript) → verify /components/ui path → place component → provide demo usage'
```

### Step C — Add the Prompt (after `component-recommendation` prompt, before `menu:`)

```yaml
    - id: 'integrate-component'
      content: |
        <instructions>
        You are given a task to integrate an existing React component into the codebase.
        Follow this protocol exactly in order.
        </instructions>

        **Step 1 — Stack Validation**

        The codebase MUST support:
        - shadcn project structure
        - Tailwind CSS
        - TypeScript

        If any are missing, STOP and provide setup instructions:
        - shadcn: `npx shadcn@latest init`
        - Tailwind: follow official Tailwind CSS install guide for the framework
        - TypeScript: `npx tsc --init` or framework-specific setup

        **Step 2 — Component Path Verification**

        Determine the default path for components and styles.
        If the default component path is NOT `/components/ui`:
        - Explain that `/components/ui` is the shadcn convention
        - shadcn CLI installs primitives there by default
        - Third-party shadcn-compatible components expect this path
        - Import aliases like `@/components/ui/button` are standard across the ecosystem
        - Provide instructions to create the folder: `mkdir -p src/components/ui`

        **Step 3 — Component Placement**

        Copy-paste the component file to `/components/ui/[component-name].tsx`
        - Preserve the exact file name provided
        - Do NOT rename or restructure the component
        - Verify all imports resolve correctly

        **Step 4 — Demo Usage**

        Provide a demo file showing how to import and render the component:
        ```tsx
        import ComponentName from "@/components/ui/[component-name]";

        export default function Demo() {
          return <ComponentName />;
        }
        ```

        **Step 5 — Dependency Check**

        List any additional dependencies the component requires that may not be installed:
        - npm packages (e.g., `lucide-react`, `clsx`, `class-variance-authority`)
        - shadcn primitives (e.g., `npx shadcn@latest add button`)
        - Peer dependencies

        **Step 6 — Log to Sidecar**

        Log the integration to `aurora-sidecar/design-decisions.md` with:
        - Component name and source
        - Path placed
        - Any setup steps performed
        - Dependencies added
```

### Step D — Add the Menu Trigger

Replace the existing standalone `design-frontend` trigger with a multi-trigger:

**Remove:**
```yaml
    - trigger: 'design-frontend'
      route: '{project-root}/_bmad/orbit/workflows/design-frontend/workflow.md'
      description: 'Design frontend 🎨'
```

**Replace with:**
```yaml
    - multi: '[IC] Integrate Component [DF] Design Frontend'
      triggers:
        - integrate-component:
            input: IC
            route: '#integrate-component'
            description: 'Integrate component into project 🧩'
            type: exec
        - design-frontend:
            input: DF
            route: '{project-root}/_bmad/orbit/workflows/design-frontend/workflow.md'
            description: 'Design frontend 🎨'
            type: exec
```

---

## 6. Logging to Sidecar Memory

Aurora's sidecar memory persists across sessions. When adding new skills, decide if they should log to existing files or need a new one.

### Using Existing Log Files

**design-decisions.md** — For design system generations and component integrations:
```markdown
## [2026-02-06] - Component: e-commerce-product-detail

**Source:** 21st.dev
**Path:** /components/ui/e-commerce-product-detail.tsx
**Stack Verified:** Shadcn ✅ Tailwind ✅ TypeScript ✅
**Dependencies Added:** none (self-contained SVG icons)
**Demo:** Created demo.tsx with `<ProductDetail />` usage

---
```

**ui-libraries.md** — For tracking which libraries a project uses.

### Creating a New Sidecar File

If your skill needs its own tracking, create a new file in `_bmad/_memory/aurora-sidecar/`:

```
_bmad/_memory/aurora-sidecar/
├── design-decisions.md
├── ui-libraries.md
├── component-integrations.md     ← NEW (if needed)
└── README.md
```

Then add a critical action so Aurora loads it:
```yaml
    - 'Load {project-root}/_bmad/_memory/aurora-sidecar/component-integrations.md before integrating components'
```

---

## 7. Adding a Full Workflow (Multi-Step)

For complex multi-step procedures, create a workflow directory instead of a prompt.

### Directory Structure

```
_bmad/orbit/workflows/your-workflow-name/
├── workflow.md          ← Main entry point
└── steps/
    ├── step-1.md        ← Individual steps
    ├── step-2.md
    └── step-3.md
```

### workflow.md Template

```markdown
# Your Workflow Name

## Steps
1. [Step 1 Title](steps/step-1.md)
2. [Step 2 Title](steps/step-2.md)
3. [Step 3 Title](steps/step-3.md)

## Context Required
- [What Aurora needs before starting]

## Output
- [What this workflow produces]
```

### Linking from Agent YAML

```yaml
    - trigger: 'your-workflow'
      route: '{project-root}/_bmad/orbit/workflows/your-workflow-name/workflow.md'
      description: 'Your workflow description 🔧'
```

### When to Use Prompts vs Workflows

| Use a **Prompt** when... | Use a **Workflow** when... |
|--------------------------|---------------------------|
| Single-page instructions | 3+ distinct phases |
| Can fit in ~50 lines | Needs separate step files |
| No branching logic | Has conditional paths |
| Quick skill | Complex multi-turn procedure |

---

## 8. Quick Reference Checklist

When adding a new frontend skill to Aurora:

- [ ] **Define the skill** — What does it do? Write the prompt content
- [ ] **Pick an id** — Unique, kebab-case (e.g., `integrate-component`)
- [ ] **Add the prompt** — In `prompts:` section of `frontend-designer.yaml`
- [ ] **Add menu trigger** — In `menu:` section, pointing to `#your-prompt-id`
- [ ] **Add principle** (optional) — If it changes how Aurora thinks
- [ ] **Add critical action** (optional) — If Aurora must ALWAYS do something
- [ ] **Add sidecar logging** (optional) — If the skill should track its history
- [ ] **Test it** — Invoke Aurora and trigger the new skill
- [ ] **Commit** — `git add` the changed YAML and any new files

---

## 9. Common Mistakes to Avoid

| Mistake | Why It's Bad | Fix |
|---------|-------------|-----|
| Putting skill logic in `design-decisions.md` | That's a log file, not a skill definition | Put skills in `frontend-designer.yaml` prompts |
| Duplicate prompt `id` | Aurora won't know which to execute | Use unique ids across all prompts |
| Missing `type: exec` on trigger | Trigger won't execute properly | Always specify `type: exec` for prompt/workflow routes |
| Route to non-existent workflow | Dead link, Aurora errors | Verify file exists before referencing |
| Overly vague principles | Aurora can't act on them | Make principles specific and actionable |
| Not loading sidecar in critical_actions | Aurora forgets past work | Add a "Load file X" critical action |
| Adding to `identity:` instead of `prompts:` | Identity is who she IS, not what she DOES | Use prompts for skills, identity for personality |

---

## Relationship to UI UX Pro Max

**UI UX Pro Max** and **Aurora's prompts** are separate, complementary layers:

```
UI UX Pro Max (Skill)          Aurora Agent (YAML)
─────────────────────          ────────────────────
Generates design systems  →    Integrates components
Colors, typography, styles →   Places files, verifies stack
MASTER.md output          →    /components/ui placement
Design-level decisions    →    Implementation-level actions
```

They do NOT conflict. UI UX Pro Max creates the design. Aurora's prompts implement it.

---

*Generated 2026-02-06 for the ORBIT Module*
