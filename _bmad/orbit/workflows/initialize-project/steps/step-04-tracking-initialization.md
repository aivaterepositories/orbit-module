# Step 04: Project Tracking & Shared State Initialization

**Objective:** Create project tracking files in shared-state directory for git-based team synchronization.

---

## 1. Create Project Directory Structure

Create the following directories and files:

### Project Directory
```
_bmad/orbit/shared-state/projects/{project-slug}/
```

Create this directory now using the project-slug from step-01.

---

## 2. Create Project Context File

Write the complete project context file:

**File:** `_bmad/orbit/shared-state/projects/{project-slug}/project-context.yaml`

```yaml
---
# ORBIT Project Context
# This file is GIT-TRACKED for team synchronization
# Created: [current date]
# Last Updated: [current date]
---

project:
  name: [from step-01]
  slug: [from step-01]
  description: |
    [from step-01]

  client:
    name: [from step-01]
    contact: [from step-01]
    technical_level: [from step-01]

  type: [from step-01]

  timeline:
    created_date: [current date]
    target_completion: [from step-01]
    hard_deadlines: [from step-01]

  tech_stack:
    frontend: [from step-01]
    backend: [from step-01]
    database: [from step-01]
    hosting: [from step-01]

  requirements: |
    [from step-01]

  problem_statement: |
    [from step-01]

  expected_outcome: |
    [from step-01]

# Team Assignments (from step-02)
team:
  fiona:
    role: "PM/Process Engineer"
    email: [from config]
    focus_areas: [from step-02]
    capacity: [from step-02]
    availability_notes: [from step-02]

  marky:
    role: "Developer"
    email: [from config]
    focus_areas: [from step-02]
    capacity: [from step-02]
    availability_notes: [from step-02]

  cob:
    role: "Developer"
    email: [from config]
    focus_areas: [from step-02]
    capacity: [from step-02]
    availability_notes: [from step-02]

sprint_configuration: [from step-02]

# Dual Engine Model (from step-03)
dual_engine_model: [from step-03]

# Lifecycle Tracking (from step-03)
lifecycle: [from step-03]

# Project Status
status:
  current_phase: "Discover"
  overall_health: "Green"
  active: true
  sprint_number: 0
  blockers: []

# Next Actions
next_actions:
  - action: "Schedule initial sprint planning"
    owner: "Fiona"
    due_date: "TBD"
    priority: "High"

  - action: "Conduct risk assessment"
    owner: "Fiona"
    due_date: "TBD"
    priority: "High"

  - action: "Set up project repository/infrastructure"
    owner: "Cob"
    due_date: "TBD"
    priority: "Medium"

# Tracking History
history:
  - date: [current date]
    event: "Project initialized in ORBIT"
    user: [current user]
    phase: "Discover"
```

---

## 3. Create Team Assignments File

**File:** `_bmad/orbit/shared-state/projects/{project-slug}/team-assignments.yaml`

```yaml
---
# Team Assignments for [Project Name]
# GIT-TRACKED for team synchronization
---

current_sprint: 0
sprint_start_date: null
sprint_end_date: null

team_members:
  fiona:
    name: "Fiona"
    role: "PM/Process Engineer"
    email: [from config]
    current_assignments: []
    completed_tasks: []
    focus_this_sprint: [from step-02]

  marky:
    name: "Marky"
    role: "Developer"
    email: [from config]
    current_assignments: []
    completed_tasks: []
    focus_this_sprint: [from step-02]

  cob:
    name: "Cob"
    role: "Developer"
    email: [from config]
    current_assignments: []
    completed_tasks: []
    focus_this_sprint: [from step-02]

pending_assignments:
  - task: "Initial sprint planning"
    assigned_to: "Fiona"
    priority: "High"
    status: "pending"

  - task: "Risk assessment"
    assigned_to: "Fiona"
    priority: "High"
    status: "pending"

  - task: "Repository setup"
    assigned_to: "Cob"
    priority: "Medium"
    status: "pending"
```

---

## 4. Create Project README

**File:** `_bmad/orbit/shared-state/projects/{project-slug}/README.md`

```markdown
# [Project Name]

**Client:** [Client Name]
**Status:** 🟢 Active - Discover Phase
**Team:** Fiona, Marky, Cob

## Overview

[Project Description from step-01]

## Problem Statement

[Problem statement from step-01]

## Expected Outcome

[Expected outcome from step-01]

## Team Assignments

### Fiona (PM/Process Engineer)
- [Focus areas from step-02]

### Marky (Developer)
- [Focus areas from step-02]

### Cob (Developer)
- [Focus areas from step-02]

## Project Lifecycle

### Current Phase: Discover ✅

**Objectives:**
[List objectives from step-03]

**Success Criteria:**
[List criteria from step-03]

**Estimated Duration:** [Duration from step-03]

### Upcoming Phases

- **Demo:** [Duration or TBD]
- **Deliver:** [Duration or TBD]
- **Defend:** [Duration or TBD]

## Dual Engine Model

**Mode:** [Simultaneous/Sequential]

**Engine 1 - Process Engineering (Fiona):**
[Focus areas from step-03]

**Engine 2 - Development (Marky, Cob):**
[Focus areas from step-03]

## Next Actions

1. ⚡ Schedule initial sprint planning (Fiona) - High Priority
2. ⚡ Conduct risk assessment (Fiona) - High Priority
3. 🔧 Set up project repository/infrastructure (Cob) - Medium Priority

## Timeline

- **Created:** [Current date]
- **Target Completion:** [Target from step-01]
- **Hard Deadlines:** [Deadlines from step-01]

## Technology Stack

- **Frontend:** [From step-01]
- **Backend:** [From step-01]
- **Database:** [From step-01]
- **Hosting:** [From step-01]

## Documentation

All project files are in `_bmad/orbit/shared-state/projects/{project-slug}/`

Team synchronization via git:
```bash
./orbit-sync.sh pull   # Get latest updates
./orbit-sync.sh push "message"  # Share your updates
```

---

**Last Updated:** [Current date] by [Current user]
```

---

## 5. Update Active Projects Registry

Update Nova's memory with this project:

**File:** `_bmad/_memory/project-coordinator-sidecar/active-projects.yaml`

If file doesn't exist, create it. Otherwise, append to existing projects:

```yaml
active_projects:
  - slug: [project-slug]
    name: [Project Name]
    client: [Client Name]
    phase: "Discover"
    status: "active"
    created: [current date]
    last_updated: [current date]
    team:
      - Fiona
      - Marky
      - Cob
    priority: [from step-02]
```

---

## 6. Confirm Files Created

Verify all files were created:

```
✅ Created project directory structure
✅ Created project-context.yaml
✅ Created team-assignments.yaml
✅ Created project README.md
✅ Updated active-projects.yaml

All files saved to: _bmad/orbit/shared-state/projects/{project-slug}/
```

---

## 7. Continue to Next Step

Present continuation menu:

```
✅ Project tracking initialized!

Files created:
- project-context.yaml
- team-assignments.yaml
- README.md
- active-projects.yaml (updated)

Location: _bmad/orbit/shared-state/projects/{project-slug}/

[C] Continue to Next Steps & Completion
```

**Actions:**
- **C (Continue)**: Load step-05-next-steps.md

**HALT and wait for user selection.**
