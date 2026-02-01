# Step 03: Dual Engine Model Setup

**Objective:** Configure simultaneous Process Engineering and Development tracking for accelerated delivery.

---

## 1. Dual Engine Model Overview

Explain ORBIT's Dual Engine approach:

```
🔧 ORBIT Dual Engine Model

Engine 1: Process Engineering
- Continuous workflow optimization
- Standards development
- Process improvements
- Documentation refinement

Engine 2: System/Product/Project Development
- Active development work
- Feature implementation
- Technical delivery
- Quality assurance

Both engines run SIMULTANEOUSLY for rapid iteration.
```

---

## 2. Engine Configuration

Load default from config: {dual_engine_mode}

Ask the user:

**1. Dual Engine Mode for this project:**
- [ ] **Simultaneous** (Recommended) - Process engineering happens during development
- [ ] **Sequential** - Process first, then development

**2. Process Review Frequency:**
(Default from config: {process_review_frequency})
- [ ] **Continuous** - Ongoing during development
- [ ] **Per Sprint** - Sprint retrospective (Recommended)
- [ ] **Per Phase** - At Discover/Demo/Deliver/Defend transitions

**3. Process Engineering Focus:**
What should Fiona focus on for process engineering?
- [ ] Workflow documentation
- [ ] Client communication templates
- [ ] Quality standards
- [ ] Risk management procedures
- [ ] Team collaboration processes
- [ ] Other: [specify]

---

## 3. Lifecycle Phase Planning

Map the project to ORBIT's 4D lifecycle:

### Discover Phase (Current)
**Objectives:**
- [ ] Requirements gathering and validation
- [ ] Research and analysis
- [ ] Initial planning
- [ ] Risk identification
- [ ] Team alignment

**Success Criteria:**
- Clear understanding of project requirements
- Documented risks and mitigation strategies
- Team aligned on approach
- Initial architecture decisions made

**Estimated Duration:** [Ask user: X weeks/sprints]

### Demo Phase
**Objectives:**
- [ ] Proof of concept development
- [ ] Prototyping
- [ ] Stakeholder validation
- [ ] Technical feasibility confirmation

**Estimated Duration:** [Ask user: X weeks/sprints or TBD]

### Deliver Phase
**Objectives:**
- [ ] Full implementation
- [ ] Testing and quality assurance
- [ ] Documentation completion
- [ ] Deployment preparation

**Estimated Duration:** [Ask user: X weeks/sprints or TBD]

### Defend Phase
**Objectives:**
- [ ] Pre-production review
- [ ] Security validation
- [ ] Production readiness check
- [ ] Final audit and handoff

**Estimated Duration:** [Ask user: X weeks/sprints or TBD]

---

## 4. Document Dual Engine Configuration

Create dual engine tracking structure:

```yaml
dual_engine_model:
  mode: [simultaneous/sequential]
  process_review_frequency: [continuous/per-sprint/per-phase]

  engine_1_process_engineering:
    lead: "Fiona"
    focus_areas:
      - [Focus area 1]
      - [Focus area 2]
      - [Focus area 3]
    deliverables:
      - [Expected process deliverable 1]
      - [Expected process deliverable 2]

  engine_2_development:
    leads:
      - "Marky"
      - "Cob"
    focus_areas:
      - [Development focus 1]
      - [Development focus 2]
    deliverables:
      - [Expected technical deliverable 1]
      - [Expected technical deliverable 2]

lifecycle:
  current_phase: "Discover"

  discover:
    objectives:
      - [Objective 1]
      - [Objective 2]
    success_criteria:
      - [Criterion 1]
      - [Criterion 2]
    estimated_duration: [X weeks/sprints]
    status: "active"

  demo:
    objectives:
      - [Objective 1]
      - [Objective 2]
    estimated_duration: [X weeks/sprints or TBD]
    status: "pending"

  deliver:
    objectives:
      - [Objective 1]
      - [Objective 2]
    estimated_duration: [X weeks/sprints or TBD]
    status: "pending"

  defend:
    objectives:
      - [Objective 1]
      - [Objective 2]
    estimated_duration: [X weeks/sprints or TBD]
    status: "pending"
```

---

## 5. Continue to Next Step

Present continuation menu:

```
✅ Dual Engine Model configured!

Mode: [Simultaneous/Sequential]
Current Phase: Discover
Process Reviews: [Frequency]

Discover Phase:
- Duration: [X weeks]
- Objectives: [Count] objectives defined

[C] Continue to Tracking Initialization
[E] Edit Dual Engine Setup
```

**Actions:**
- **C (Continue)**: Load step-04-tracking-initialization.md
- **E (Edit)**: Re-run this step with corrections

**HALT and wait for user selection.**
