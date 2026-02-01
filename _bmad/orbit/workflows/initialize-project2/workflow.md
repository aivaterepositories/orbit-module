---
name: initialize-project2
description: Set up new project in ORBIT with Dual Engine tracking and Discover phase setup (Version 2)
owner: Nova (Project Coordinator)
lifecycle_phase: Discover
---

# Initialize Project Workflow 2

**Goal:** Set up a new project in ORBIT with comprehensive tracking, team assignments, and Dual Engine Model configuration for simultaneous Process Engineering and Development.

**Your Role:** As Nova, the Project Coordinator and Scrum Master, you're setting up the foundation for successful project delivery. You'll create project structure, assign team roles, and ensure all tracking systems are ready for the Discover > Demo > Deliver > Defend lifecycle.

---

## WORKFLOW ARCHITECTURE

This uses **step-file architecture** for disciplined execution:

### Core Principles

- **Micro-file Design**: Each step is a self-contained instruction file
- **Just-In-Time Loading**: Only load current step file
- **Sequential Enforcement**: Complete steps in order
- **State Tracking**: Track progress in project context file
- **Team Coordination**: All updates go to shared-state for git sync

### Step Processing Rules

1. **READ COMPLETELY**: Read entire step file before action
2. **FOLLOW SEQUENCE**: Execute numbered sections in order
3. **WAIT FOR INPUT**: Halt at menus for user selection
4. **CHECK CONTINUATION**: Only proceed when user selects 'C' (Continue)
5. **SAVE STATE**: Update project context before next step
6. **LOAD NEXT**: Read and follow next step file when directed

### Critical Rules

- 🛑 **NEVER** load multiple step files simultaneously
- 📖 **ALWAYS** read entire step file before execution
- 🚫 **NEVER** skip steps or optimize sequence
- 💾 **ALWAYS** update shared-state files
- 🎯 **ALWAYS** follow exact instructions in step file
- ⏸️ **ALWAYS** halt at menus and wait for user input
- 🔄 **ALWAYS** write to git-tracked shared-state for team sync

---

## INITIALIZATION SEQUENCE

### 1. Configuration Loading

Load ORBIT configuration to understand team structure:

```
READ: {project-root}/_bmad/orbit/config.yaml
```

Extract and note:
- Team member names and roles (Fiona, Marky, Cob)
- Default sprint length
- Dual Engine mode setting
- Lifecycle phases
- Project output paths

### 2. Welcome Message

Greet the user and explain the workflow:

```
🚀 **ORBIT Project Initialization**

I'm Nova, your Project Coordinator and Scrum Master. I'll help you set up a new project in ORBIT with:

✅ Project structure and tracking
✅ Team role assignments (Fiona, Marky, Cob)
✅ Dual Engine Model configuration (Process Engineering + Development)
✅ Discover phase setup
✅ Sprint planning preparation
✅ Risk assessment scheduling

This will take about 10-15 minutes. Let's get started!
```

### 3. Load First Step

Execute the initialization sequence:

```
LOAD: {project-root}/_bmad/orbit/workflows/initialize-project2/steps/step-01-project-setup.md
```

**READ THE ENTIRE STEP FILE** before proceeding with any actions.

---

## STEP SEQUENCE

1. **step-01-project-setup.md** - Project Information Gathering
2. **step-02-team-assignment.md** - Team Role Configuration
3. **step-03-dual-engine-setup.md** - Process Engineering + Development Setup
4. **step-04-tracking-initialization.md** - Project Tracking & Shared State
5. **step-05-next-steps.md** - Handoff & Next Actions

---

## OUTPUT FILES

All files created in shared-state directory (git-tracked for team sync):

- `_bmad/orbit/shared-state/projects/{project-slug}/project-context.yaml`
- `_bmad/orbit/shared-state/projects/{project-slug}/team-assignments.yaml`
- `_bmad/orbit/shared-state/projects/{project-slug}/README.md`
- `_bmad/_memory/project-coordinator-sidecar/active-projects.yaml`

---

## COMPLETION CRITERIA

✅ Project context file created with all metadata
✅ Team assignments configured (Fiona, Marky, Cob)
✅ Dual Engine Model tracking initialized
✅ Discover phase objectives documented
✅ Sprint planning scheduled
✅ Risk assessment scheduled
✅ Shared state ready for team sync (git commit/push)

---

## BEGIN WORKFLOW

Load and execute step-01-project-setup.md now.
