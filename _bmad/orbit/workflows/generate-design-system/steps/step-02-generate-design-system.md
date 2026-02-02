# Step 2: Generate Design System

**Agent:** Aurora
**Purpose:** Execute UI UX Pro Max Python scripts to generate comprehensive design system

## Actions

### 1. Verify Python Installation

```bash
python3 --version
```

**If Python is not installed**, guide the user:

**macOS:**
```bash
brew install python3
```

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install python3
```

**Windows:**
```powershell
winget install Python.Python.3.12
```

### 2. Generate Design System with Persistence

Execute the UI UX Pro Max design system generator:

```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "[search_query]" \
  --design-system \
  --persist \
  -p "[project_name]" \
  -f markdown
```

**Parameters:**
- `[search_query]`: The query built in Step 1 (e.g., "beauty spa wellness elegant")
- `--design-system`: Generates comprehensive design system (required)
- `--persist`: Saves to design-system/{project}/MASTER.md
- `-p "[project_name]"`: Project name for folder and header
- `-f markdown`: Output format (markdown for file persistence)

**Example:**
```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "beauty spa wellness service elegant professional" \
  --design-system \
  --persist \
  -p "Serenity Spa" \
  -f markdown
```

### 3. Expected Output

The script will create:
- `design-system/serenity-spa/MASTER.md` - Global design system
- `design-system/serenity-spa/pages/` - Folder for page overrides

### 4. Optional: Generate Page-Specific Override

If user needs a specific page with different design rules:

```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "[page-specific-query]" \
  --design-system \
  --persist \
  -p "[project_name]" \
  --page "[page-name]" \
  -f markdown
```

**Example:**
```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "dashboard data analytics modern" \
  --design-system \
  --persist \
  -p "Serenity Spa" \
  --page "admin-dashboard" \
  -f markdown
```

This creates:
- `design-system/serenity-spa/pages/admin-dashboard.md`

## Output

Design system files created at:
- `design-system/{project-slug}/MASTER.md`
- `design-system/{project-slug}/pages/{page-name}.md` (if page override generated)

## Next Step

{project-root}/_bmad/orbit/workflows/generate-design-system/steps/step-03-log-to-sidecar.md
