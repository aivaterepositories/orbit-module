# Step 05: Next Steps & Completion

**Objective:** Provide handoff instructions and schedule next actions for project kickoff.

---

## 1. Project Initialization Summary

Present a comprehensive summary:

```
🎉 Project Successfully Initialized in ORBIT!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROJECT: [Project Name]
CLIENT: [Client Name]
SLUG: [project-slug]

PHASE: Discover (Sprint 0)
STATUS: 🟢 Active
DUAL ENGINE: [Simultaneous/Sequential]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TEAM ASSIGNMENTS:

👤 Fiona (PM/Process Engineer)
   Focus: [Focus areas]
   Capacity: [X hours per sprint]

👨‍💻 Marky (Developer)
   Focus: [Focus areas]
   Capacity: [X hours per sprint]

👨‍💻 Cob (Developer)
   Focus: [Focus areas]
   Capacity: [X hours per sprint]

Total Sprint Capacity: [X hours]
Sprint Length: [X weeks]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 2. Project Files Location

Show where everything is stored:

```
📁 PROJECT FILES (GIT-TRACKED):

_bmad/orbit/shared-state/projects/{project-slug}/
├── project-context.yaml       # Full project configuration
├── team-assignments.yaml      # Current assignments & tasks
└── README.md                  # Project overview

_bmad/_memory/project-coordinator-sidecar/
└── active-projects.yaml       # Registry of all projects

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 TEAM SYNCHRONIZATION:

These files are git-tracked. Share with team:
  git add _bmad/orbit/shared-state/
  git commit -m "Initialize project: [Project Name]"
  git push

Team members sync with:
  ./orbit-sync.sh pull
```

---

## 3. Immediate Next Actions

Provide prioritized action items:

```
⚡ IMMEDIATE NEXT ACTIONS (High Priority):

1️⃣ SCHEDULE SPRINT PLANNING
   Owner: Fiona
   Action: Run 'sprint-planning' workflow
   Purpose: Plan Sprint 1 and create initial backlog
   Timeline: Within 2-3 days

2️⃣ CONDUCT RISK ASSESSMENT
   Owner: Fiona
   Action: Load agent Sentinel, trigger risk assessment
   Purpose: Identify and document project risks
   Timeline: Before Sprint 1 starts

3️⃣ SET UP INFRASTRUCTURE
   Owner: Cob
   Action: Create repository, set up environments
   Purpose: Technical foundation ready for development
   Timeline: During Discover phase

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📋 DISCOVER PHASE OBJECTIVES:

[List objectives from step-03]

SUCCESS CRITERIA:
[List criteria from step-03]

Estimated Duration: [X weeks/sprints]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 4. Quick Reference Commands

Provide helpful commands for the team:

```
🚀 ORBIT QUICK COMMANDS:

# Check project status anytime
agent nova
SC

# Start sprint planning (when ready)
agent nova
sprint-planning

# Conduct risk assessment
agent sentinel
risk-assessment

# Process meeting notes
agent echo
process-transcript

# Start development work
agent titan
develop-web-app

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 5. Documentation References

Point to key documentation:

```
📚 DOCUMENTATION:

Project Files:
  _bmad/orbit/shared-state/projects/{project-slug}/README.md

ORBIT Guides:
  _bmad/orbit/README.md              # Full ORBIT documentation
  _bmad/orbit/TEAM-SYNC-GUIDE.md     # Git sync workflow
  _bmad/orbit/TODO.md                # Development roadmap

Lifecycle:
  Discover → Demo → Deliver → Defend
  Current Phase: Discover ✅

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 6. Team Communication

Suggest team communication:

```
💬 RECOMMENDED TEAM COMMUNICATION:

Email/Slack notification to team:

Subject: New Project Initialized - [Project Name]

Team,

We've initialized a new ORBIT project:

📋 Project: [Project Name]
👤 Client: [Client Name]
🎯 Phase: Discover
📅 Target: [Target completion or TBD]

Your assignments:
• Fiona: [Focus areas]
• Marky: [Focus areas]
• Cob: [Focus areas]

Next Steps:
1. Pull latest from git: ./orbit-sync.sh pull
2. Review project README in shared-state/projects/{project-slug}/
3. Sprint planning meeting: [TBD - schedule within 2-3 days]

Project files: _bmad/orbit/shared-state/projects/{project-slug}/

Let's deliver excellence! 🚀

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 7. Record Pattern (Optional)

Ask if user wants to save any learnings:

```
💡 SAVE PROJECT PATTERN (OPTIONAL):

Did you learn anything during this initialization that would be
helpful for future projects?

[Y] Yes - Save pattern
[N] No - Skip

If Yes, I'll help you document it in Nova's memory for future reference.
```

If user selects Y, prompt for pattern description and save to:
`_bmad/_memory/project-coordinator-sidecar/project-patterns.md`

---

## 8. Final Confirmation

```
✅ PROJECT INITIALIZATION COMPLETE!

[Project Name] is ready to go!

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

What would you like to do next?

[SP] Start Sprint Planning
[RA] Conduct Risk Assessment
[SC] Check Project Status
[DU] Done - Return to Main Menu

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Actions:**
- **SP**: Load `sprint-planning` workflow
- **RA**: Load agent Sentinel for risk assessment
- **SC**: Show project status using Nova's status-check prompt
- **DU**: Complete workflow and return to main menu

**HALT and wait for user selection.**

---

## 9. Workflow Completion

Once user makes final selection or chooses Done:

```
🎯 Project [Project Name] initialized successfully!

All files saved and ready for team sync.

Remember to commit and push:
  git add _bmad/orbit/shared-state/
  git commit -m "Initialize project: [Project Name]"
  git push

ORBIT is ready to help you deliver! 🚀
```

**END OF WORKFLOW**
