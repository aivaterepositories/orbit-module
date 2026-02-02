# Step 1: Gather Requirements

**Agent:** Aurora
**Purpose:** Understand the project context and design requirements

## Actions

### 1. Ask User for Project Details

Extract the following information through conversation:

**Required Information:**
- **Project Name**: What should we call this project?
- **Project Type**: SaaS, e-commerce, portfolio, dashboard, landing page, blog, mobile app, etc.
- **Industry/Domain**: Healthcare, fintech, beauty, education, gaming, etc.
- **Style Preferences**: Minimal, elegant, playful, professional, dark mode, glassmorphism, etc.
- **Brand Colors** (if any): Specific colors the user wants to use
- **Tech Stack**: React, Vue, Next.js, HTML+Tailwind, etc. (default to html-tailwind)

### 2. Example Questions

**If user request is vague:**
```
I need a bit more information to create the perfect design system:

1. What type of project is this? (e.g., SaaS dashboard, e-commerce store, portfolio)
2. What industry or domain? (e.g., healthcare, fintech, beauty, gaming)
3. Any style preferences? (e.g., minimal, elegant, playful, dark mode)
4. Do you have brand colors in mind?
5. What tech stack will you use? (default: HTML + Tailwind)
```

**If user request is clear:**
```
Perfect! I've extracted:
- Project: [name]
- Type: [type]
- Industry: [industry]
- Style: [style keywords]
- Tech Stack: [stack]

Let me generate your design system now.
```

### 3. Build Search Query

Combine the extracted information into a search query for UI UX Pro Max:

**Format:**
```
[project-type] [industry] [style-keywords]
```

**Examples:**
- "beauty spa wellness service elegant professional"
- "fintech dashboard crypto modern glassmorphism"
- "ecommerce fashion luxury minimal dark"

## Output

Store in conversation context:
- `project_name`: String
- `search_query`: String
- `tech_stack`: String (default: "html-tailwind")
- `brand_colors`: Optional string

## Next Step

{project-root}/_bmad/orbit/workflows/generate-design-system/steps/step-02-generate-design-system.md
