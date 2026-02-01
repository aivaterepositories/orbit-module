# ORBIT Team Synchronization Guide

## Team MacBooks Setup

**Team Members:**
- **Fiona** (PM/Process Engineer) - fiona@example.com
- **Marky** (Developer) - marky@example.com
- **Cob** (Developer) - cob@example.com

## How It Works

ORBIT uses git-based synchronization so all team members have the same project context regardless of which MacBook they're using.

### What Gets Synchronized (Git-Tracked)

✅ **Shared across all MacBooks:**
- Project contexts and status (_bmad/orbit/shared-state/projects/)
- Sprint planning and tracking (_bmad/orbit/shared-state/sprints/)
- Meeting notes and action items (_bmad/orbit/shared-state/meeting-notes/)
- Process improvements (_bmad/orbit/shared-state/process-improvements/)
- Team task assignments (_bmad/orbit/shared-state/team-assignments/)
- Project Coordinator patterns (_bmad/_memory/project-coordinator-sidecar/)

### What Stays Local (Git-Ignored)

🔒 **Each MacBook keeps privately:**
- API keys and credentials (.orbit-credentials/)
- Personal settings and preferences
- Local temporary files

## Workflows

### Fiona (PM/Process Engineer)

When you process engineer or add client implementations:

```bash
# 1. Make your updates using ORBIT agents
# 2. Commit and push
git add _bmad/orbit/shared-state/
git add _bmad/_memory/project-coordinator-sidecar/
git commit -m "Process update: [description]"
git push origin main

# 3. Notify team (optional)
# Cob and Marky will pull to get your updates
```

### Cob & Marky (Developers)

When Fiona pushes updates, sync your MacBook:

```bash
# Quick sync (recommended)
./orbit-sync.sh pull

# Or manually
git pull origin main

# Now you have Fiona's latest process engineering and context!
```

### Any Team Member

When you update project status or complete tasks:

```bash
# Commit your work
git add _bmad/orbit/shared-state/
git commit -m "Update: sprint status"
git push

# Others pull to see your updates
```

## Daily Workflow

**Morning:**
```bash
./orbit-sync.sh pull   # Get latest team updates
```

**During Work:**
- Use ORBIT agents normally
- They read/write to shared-state/ automatically
- Context is always team-aware

**End of Day:**
```bash
git add _bmad/orbit/shared-state/
git commit -m "Daily update: [summary]"
git push                # Share your work with team
```

## Initial Setup (Each MacBook)

### 1. Clone Repository

```bash
# First-time setup on new MacBook
git clone <your-github-repo-url>
cd <project-directory>

# Install ORBIT module
bmad install orbit
```

### 2. Configure Credentials Locally

Each team member sets up their own credentials:

```bash
# Copy template
cp .orbit-credentials/credentials-template.yaml .orbit-credentials/credentials.yaml

# Edit with your API keys
# These stay local (git-ignored)
```

### 3. Start Working

You're ready! All ORBIT agents now have:
- ✅ Shared project context from git
- ✅ Your local credentials
- ✅ Team awareness across MacBooks

## Troubleshooting

**Merge Conflicts:**
- Rare, but can happen if multiple people update same file
- Git will highlight conflicts
- Resolve and commit

**Missing Context:**
- Run: `./orbit-sync.sh pull`
- Ensures you have latest team updates

**Credential Issues:**
- Check: .orbit-credentials/credentials.yaml exists locally
- This file is NOT in git (intentionally)
- Each MacBook needs its own

## Benefits

✅ **Context Awareness**: All team members have same project state
✅ **Real-Time Sync**: Push/pull keeps everyone aligned
✅ **Device Independent**: Work from any team MacBook
✅ **Secure**: Credentials stay local, project data shared
✅ **Audit Trail**: Git history shows who updated what

## Questions?

Contact: fiona@example.com (Fiona)
