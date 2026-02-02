# Team Setup Guide: Aurora + UI UX Pro Max

**For:** Fiona & Marky
**Purpose:** Enable Aurora's design system generation capabilities on your machines
**Setup Time:** 5-10 minutes

---

## 📊 Sync Analysis: What Syncs via Git?

### ✅ WILL Sync Automatically (Already in Repo)

These files sync when Cob pushes to GitHub:

| Component | Location | Size | Syncs? |
|-----------|----------|------|--------|
| **Aurora Agent Config** | `_bmad/orbit/agents/frontend-designer.yaml` | ~4 KB | ✅ Yes |
| **Design System Workflow** | `_bmad/orbit/workflows/generate-design-system/` | ~12 KB | ✅ Yes |
| **Aurora Sidecar Memory** | `_bmad/_memory/aurora-sidecar/` | ~8 KB | ✅ Yes |
| **Documentation** | `_bmad/orbit/AURORA-UPGRADE-COMPLETE.md` | ~20 KB | ✅ Yes |

### ⚠️ NEEDS Manual Setup (Not Yet in Repo)

These require installation on each machine:

| Component | Location | Size | Syncs? | Action Needed |
|-----------|----------|------|--------|---------------|
| **UI UX Pro Max Skill** | `.claude/skills/ui-ux-pro-max/` | ~636 KB | ⚠️ Optional | Install via CLI **OR** commit to Git |
| **Python 3.x** | System-wide | N/A | ❌ No | Verify installation |
| **uipro CLI** (optional) | Global npm | ~2 MB | ❌ No | Optional for future updates |

---

## 🎯 Two Setup Options

### Option 1: Commit Skill to Git (RECOMMENDED)
**Best for:** Team sharing, version control, consistency
**Pros:** One-time commit, everyone auto-syncs
**Cons:** Adds 636 KB to repo

### Option 2: Each Teammate Installs Separately
**Best for:** Keeping repo minimal
**Pros:** Smaller repo size
**Cons:** Each person runs installation commands

---

## 🚀 RECOMMENDED: Option 1 (Commit to Git)

### Step 1: Cob Commits the Skill (One-Time)

Cob, run these commands:

```bash
# Add UI UX Pro Max skill to Git
git add .claude/skills/ui-ux-pro-max/

# Add Aurora files
git add _bmad/orbit/agents/frontend-designer.yaml
git add _bmad/orbit/workflows/generate-design-system/
git add _bmad/_memory/aurora-sidecar/
git add _bmad/orbit/AURORA-UPGRADE-COMPLETE.md
git add _bmad/orbit/TEAM-SETUP-AURORA-UI-UX-PRO-MAX.md

# Commit everything
git commit -m "$(cat <<'EOF'
Add Aurora UI UX Pro Max integration for team

- Install UI UX Pro Max skill for design system generation
- Update Aurora agent with Python capabilities
- Add generate-design-system workflow
- Initialize Aurora sidecar memory
- Add comprehensive documentation

Teammates: Pull and verify Python installation (see TEAM-SETUP-AURORA-UI-UX-PRO-MAX.md)

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
EOF
)"

# Push to GitHub
git push origin main
```

### Step 2: Fiona & Marky Pull Changes

On your MacBooks, pull the updates:

```bash
cd /path/to/orbit

# Pull latest changes
git pull origin main

# Verify files synced
ls -la .claude/skills/ui-ux-pro-max/
ls -la _bmad/orbit/workflows/generate-design-system/
ls -la _bmad/_memory/aurora-sidecar/
```

**Expected Output:**
```
✅ .claude/skills/ui-ux-pro-max/SKILL.md exists
✅ .claude/skills/ui-ux-pro-max/scripts/search.py exists
✅ _bmad/orbit/workflows/generate-design-system/workflow.md exists
✅ _bmad/_memory/aurora-sidecar/design-decisions.md exists
```

### Step 3: Verify Python Installation

Check if Python 3.x is installed:

```bash
python3 --version
```

**Expected:** `Python 3.x.x` (any version 3.x is fine)

**If NOT installed:**

**macOS (Homebrew):**
```bash
brew install python3
```

**macOS (No Homebrew):**
1. Download from https://www.python.org/downloads/
2. Install the .pkg file
3. Restart terminal

### Step 4: Test Aurora's New Capabilities

```bash
# Test the skill directly
python3 .claude/skills/ui-ux-pro-max/scripts/search.py "fintech dashboard modern" --design-system -p "Test Project"
```

**Expected Output:**
- ASCII box with design system
- Colors, typography, pattern recommendations
- Pre-delivery checklist

**If it works:** ✅ You're all set!

### Step 5: Try Aurora in Claude Code

Invoke Aurora and test:

```
User: "aurora"
[Aurora shows menu]

User: [select number for] generate-design-system

User: "Create design system for a luxury spa website"
```

**Expected:**
- Aurora gathers requirements
- Runs Python script
- Creates design-system/{project}/MASTER.md
- Logs to sidecar memory
- Presents design system

---

## 📦 Alternative: Option 2 (Individual Installation)

If Cob decides NOT to commit the skill to Git, each teammate installs separately.

### For Fiona & Marky:

#### Step 1: Pull Aurora Config (Without Skill)

```bash
cd /path/to/orbit
git pull origin main
```

You'll get:
- ✅ Aurora agent config
- ✅ Workflow files
- ✅ Sidecar memory
- ❌ UI UX Pro Max skill (not included)

#### Step 2: Install UI UX Pro Max Skill

**Option A: Using uipro CLI (Recommended)**

```bash
# Install uipro CLI globally
npm install -g uipro-cli

# Navigate to Orbit project
cd /path/to/orbit

# Install UI UX Pro Max for Claude
uipro init --ai claude
```

**Expected Output:**
```
✔ UI/UX Pro Max installed successfully!
✔ Generated from templates!
```

**Option B: Manual Installation**

If npm doesn't work:

```bash
# Clone the skill repository to a temp location
cd ~/Downloads
git clone https://github.com/nextlevelbuilder/ui-ux-pro-max-skill.git

# Copy to your Orbit project
cp -r ui-ux-pro-max-skill/.claude/skills/ui-ux-pro-max/ \
      /path/to/orbit/.claude/skills/ui-ux-pro-max/
```

#### Step 3: Verify Python

```bash
python3 --version
```

If not installed, follow Step 3 from Option 1 above.

#### Step 4: Test

Same as Step 4 from Option 1.

---

## 🔍 Verification Checklist

After setup, verify everything works:

### ✅ File Verification

Run these commands:

```bash
# Check Aurora agent config
cat _bmad/orbit/agents/frontend-designer.yaml | grep "Design System Generator"
# Should output: role line mentioning "Design System Generator"

# Check workflow exists
ls -la _bmad/orbit/workflows/generate-design-system/workflow.md
# Should show the file exists

# Check sidecar memory
ls -la _bmad/_memory/aurora-sidecar/
# Should show: design-decisions.md, ui-libraries.md, README.md

# Check UI UX Pro Max skill
ls -la .claude/skills/ui-ux-pro-max/SKILL.md
# Should show the file exists

# Check Python scripts
ls -la .claude/skills/ui-ux-pro-max/scripts/*.py
# Should show: core.py, design_system.py, search.py
```

### ✅ Python Test

```bash
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "test project saas modern" \
  --design-system \
  -p "Verification Test"
```

**Expected:** ASCII box with design system output

### ✅ Aurora Menu Test

In Claude Code:
1. Type: `aurora`
2. Check menu shows: `generate-design-system 🎨💎`
3. Try invoking it

### ✅ End-to-End Test

```
User: "Aurora, generate a design system for a fintech dashboard"
```

**Expected:**
1. Aurora asks for details (or proceeds if enough info)
2. Python script executes
3. File created: `design-system/fintech-dashboard/MASTER.md`
4. Aurora presents design system summary
5. Sidecar memory updated: `_bmad/_memory/aurora-sidecar/design-decisions.md`

---

## 🔄 How Team Sync Works Going Forward

### When Cob Generates a Design System

1. **Cob:** Generates design system via Aurora
2. **Files Created:**
   - `design-system/{project}/MASTER.md` (Git tracked)
   - `_bmad/_memory/aurora-sidecar/design-decisions.md` (Git tracked, appended)
3. **Cob:** Commits and pushes
4. **Fiona & Marky:** Pull changes
5. **Result:** Everyone has the same design systems and sidecar memory

### When Fiona Generates a Design System

1. **Fiona:** Generates design system via Aurora
2. **Files Created:**
   - `design-system/{project}/MASTER.md`
   - Aurora appends to `_bmad/_memory/aurora-sidecar/design-decisions.md`
3. **Fiona:** Commits and pushes
4. **Cob & Marky:** Pull changes
5. **Result:** Everyone shares design decisions

### Sidecar Memory = Shared Team Knowledge

**What Gets Shared:**
- ✅ All design system generations (timestamps, decisions)
- ✅ Color palette choices for each project
- ✅ Typography decisions
- ✅ Style preferences
- ✅ UI library usage

**Benefit:**
- Aurora learns from ALL team members' design decisions
- Consistency across all projects
- Design patterns are documented and reused

---

## 🛠 Troubleshooting

### Issue: "Python not found" on teammate's machine

**Solution:**
```bash
# macOS
brew install python3

# Or download from python.org
```

### Issue: ".claude/skills/ui-ux-pro-max/ not found" after git pull

**Cause:** Cob hasn't committed the skill to Git yet

**Solution:**
- **Option A:** Ask Cob to commit it (run Step 1 of Option 1)
- **Option B:** Install yourself (follow Option 2)

### Issue: Aurora menu doesn't show "generate-design-system"

**Solution:**
```bash
# Verify Aurora agent was updated
cat _bmad/orbit/agents/frontend-designer.yaml | grep "generate-design-system"

# If not found, git pull again
git pull origin main
```

### Issue: Python script runs but no MASTER.md created

**Solution:**
```bash
# Check if design-system/ folder exists
ls -la design-system/

# If not, the script should create it
# Try running with explicit path
python3 .claude/skills/ui-ux-pro-max/scripts/search.py \
  "test" \
  --design-system \
  --persist \
  -p "Test"

# Check output location
ls -la design-system/test/
```

### Issue: Merge conflicts in sidecar memory

**Cause:** Multiple teammates generated design systems simultaneously

**Solution:**
```bash
# Open the conflicted file
code _bmad/_memory/aurora-sidecar/design-decisions.md

# Manually resolve conflicts (keep both entries)
# Since it's a log file, both entries are valid

# Commit the merge
git add _bmad/_memory/aurora-sidecar/design-decisions.md
git commit -m "Merge design decisions from Fiona and Cob"
```

---

## 📊 What Each Teammate Needs

### Minimum Requirements (To Use Aurora with UI UX Pro Max)

| Requirement | Check Command | Install If Missing |
|-------------|---------------|-------------------|
| **Python 3.x** | `python3 --version` | `brew install python3` |
| **Git access** | `git status` | Already have it |
| **UI UX Pro Max skill** | `ls .claude/skills/ui-ux-pro-max/` | See Option 1 or 2 above |
| **Aurora config** | `cat _bmad/orbit/agents/frontend-designer.yaml` | `git pull` |

### Optional (For Future Skill Updates)

| Tool | Purpose | Install |
|------|---------|---------|
| **uipro CLI** | Update UI UX Pro Max skill | `npm install -g uipro-cli` |
| **Node.js/npm** | For uipro CLI | `brew install node` |

---

## ✅ Recommended Approach

**For Your Team:**

1. ✅ **Cob commits UI UX Pro Max skill to Git** (Option 1)
   - Everyone gets it automatically via `git pull`
   - Version controlled and consistent
   - No individual installation needed

2. ✅ **Each teammate verifies Python**
   - Quick check: `python3 --version`
   - Install if missing (one-time)

3. ✅ **Share sidecar memory via Git**
   - All design decisions tracked
   - Aurora learns from entire team
   - Consistent design patterns

---

## 🎯 Summary

### ✅ YES, It Will Sync!

**What syncs automatically:**
- Aurora agent configuration
- Workflow files
- Sidecar memory (design decisions)
- Documentation
- **UI UX Pro Max skill** (if Cob commits it to Git)

### ⚠️ What Requires One-Time Setup

**Each teammate needs:**
- Python 3.x installed (verify with `python3 --version`)
- If Cob doesn't commit skill: Install UI UX Pro Max via `uipro init --ai claude`

### 🚀 Best Team Workflow

1. **Cob:** Run the commands in "Option 1, Step 1" to commit everything
2. **Fiona & Marky:** Run `git pull` and verify Python
3. **Everyone:** Generate design systems, commit, and share!

---

## 📞 Questions?

If you encounter any issues:

1. Check this guide's troubleshooting section
2. Verify all files synced: `git status`
3. Test Python: `python3 --version`
4. Ask Cob if they committed the skill to Git

---

**Setup Guide Version:** 1.0.0
**Last Updated:** 2026-02-02
**Team:** Cob, Fiona, Marky
**Project:** ORBIT

---

## 🎊 After Setup

Once everyone is set up, try this together:

```
Cob: "Aurora, generate design system for our next client project"
[Creates design-system/client-project/MASTER.md]
[Commits and pushes]

Fiona: [Pulls changes]
Fiona: "Aurora, create a page override for the checkout page"
[Creates design-system/client-project/pages/checkout.md]
[Commits and pushes]

Marky: [Pulls changes]
Marky: [Builds checkout page using the design system]
```

**Result:** Consistent design across entire team! 🎨✨

---
