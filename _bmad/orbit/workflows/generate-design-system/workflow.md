# Generate Design System Workflow

**Agent:** Aurora (Frontend Designer & UI/UX Specialist)
**Purpose:** Generate comprehensive design systems using UI UX Pro Max skill
**Output:** MASTER.md design system file with optional page-specific overrides

## Workflow Overview

This workflow leverages the UI UX Pro Max skill to generate professional design systems in minutes. It creates a Master + Overrides pattern for hierarchical design system management.

## Prerequisites

- Python 3.x installed
- UI UX Pro Max skill installed (.claude/skills/ui-ux-pro-max/)
- Aurora sidecar memory initialized

## Steps

1. **Gather Requirements** - Understand project context, industry, style preferences
2. **Generate Design System** - Use UI UX Pro Max to create comprehensive design system
3. **Persist Design System** - Save to design-system/{project}/MASTER.md
4. **Log to Sidecar** - Track design decisions in Aurora's memory
5. **Review & Iterate** - Present design system to user for feedback

## Usage

When user requests design system generation:

```
User: "Generate design system for a luxury beauty spa website"
Aurora: [Follows workflow steps]
```

## Master + Overrides Pattern

- **MASTER.md**: Global source of truth for all design rules
- **pages/{page-name}.md**: Page-specific overrides when needed
- **Hierarchical retrieval**: Page files override Master rules

## Next Step

{project-root}/_bmad/orbit/workflows/generate-design-system/steps/step-01-gather-requirements.md
