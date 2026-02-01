# ORBIT Shared Project State

This directory is **GIT-TRACKED** and synchronized across all team members' MacBooks.

## Purpose

When Fiona (PM/Process Engineer) updates process engineering or adds client implementations:
1. She commits changes to this directory
2. Pushes to GitHub
3. Cob and Marky pull the repository
4. Everyone has the same project context instantly

## Directories

- **projects/**: Active project contexts and status
- **sprints/**: Sprint planning and tracking data
- **meeting-notes/**: Action items, decisions, meeting records
- **process-improvements/**: Workflow optimizations and changes
- **team-assignments/**: Who's working on what

## Team Members

- **Fiona**: PM/Process Engineer
- **Marky**: Developer
- **Cob**: Developer

## Workflow

```bash
# Push your updates (Fiona after process engineering)
git add _bmad/orbit/shared-state/
git commit -m "Update: [description]"
git push

# Pull updates (Cob & Marky to sync)
./orbit-sync.sh pull
```

All ORBIT agents automatically reference this shared state for context awareness.
