# Step 02: Team Role Configuration

**Objective:** Assign team members (Fiona, Marky, Cob) to project roles and responsibilities.

---

## 1. Team Member Overview

Load team configuration from ORBIT config:

```
Team Members (from _bmad/orbit/config.yaml):
- Fiona: PM/Process Engineer (client-facing translator)
- Marky: Developer (platform builder)
- Cob: Developer (platform builder)
```

---

## 2. Project Role Assignment

Ask the user to assign roles for this specific project:

### Fiona (PM/Process Engineer)
**Primary Responsibilities:**
- [ ] Project management and coordination
- [ ] Client communication and translation
- [ ] Process engineering and optimization
- [ ] Documentation management
- [ ] Meeting orchestration

**For this project, Fiona will:**
- [Ask user to specify Fiona's focus areas for this project]

### Marky (Developer)
**Primary Responsibilities:**
- [ ] Development work
- [ ] Technical implementation
- [ ] Code reviews
- [ ] Testing and QA

**For this project, Marky will:**
- [Ask user to specify Marky's focus areas - e.g., frontend, backend, specific features]

### Cob (Developer)
**Primary Responsibilities:**
- [ ] Development work
- [ ] Technical implementation
- [ ] Infrastructure and DevOps
- [ ] Integration work

**For this project, Cob will:**
- [Ask user to specify Cob's focus areas - e.g., backend, infrastructure, integrations]

---

## 3. Capacity Planning

Ask about team availability:

**1. Sprint Length** (default from config: {default_sprint_length})
- Use default 2-week sprints?
- Or customize for this project?

**2. Team Availability**
- Is everyone full-time on this project?
- Any known time constraints or vacations?
- Estimated capacity per team member (hours per sprint)

**3. Project Priority**
- Is this the only active project?
- How does this rank among other priorities?

---

## 4. Document Team Assignments

Create team assignment structure:

```yaml
team_assignments:
  fiona:
    role: "PM/Process Engineer"
    email: [from config]
    focus_areas:
      - [Focus area 1]
      - [Focus area 2]
    capacity: [hours per sprint]
    availability_notes: [any constraints]

  marky:
    role: "Developer"
    email: [from config]
    focus_areas:
      - [Focus area 1]
      - [Focus area 2]
    capacity: [hours per sprint]
    availability_notes: [any constraints]

  cob:
    role: "Developer"
    email: [from config]
    focus_areas:
      - [Focus area 1]
      - [Focus area 2]
    capacity: [hours per sprint]
    availability_notes: [any constraints]

sprint_configuration:
  sprint_length: [1-week/2-weeks/3-weeks/4-weeks]
  sprint_length_days: [7/14/21/28]
  capacity_per_sprint:
    fiona: [hours]
    marky: [hours]
    cob: [hours]
  total_capacity: [sum of hours]

project_priority: [High/Medium/Low]
dedicated_team: [Yes/No]
other_active_projects: [List or None]
```

---

## 5. Continue to Next Step

Present continuation menu:

```
✅ Team assignments configured!

Team:
- Fiona: [Focus areas]
- Marky: [Focus areas]
- Cob: [Focus areas]

Sprint Length: [X weeks]
Total Capacity: [X hours per sprint]

[C] Continue to Dual Engine Setup
[E] Edit Team Assignments
```

**Actions:**
- **C (Continue)**: Load step-03-dual-engine-setup.md
- **E (Edit)**: Re-run this step with corrections

**HALT and wait for user selection.**
