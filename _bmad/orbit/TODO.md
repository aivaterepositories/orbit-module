# ORBIT Development Roadmap

## Current Status

✅ **Complete:**
- Module structure and directories
- Installer configuration (module.yaml + installer.js)
- 12 agents with YAML definitions
- 24 workflow folder structure
- Comprehensive README.md
- Git-based team synchronization setup

📋 **In Progress:**
- Workflow implementations

## Phase 1: Core Workflows (MVP)

Priority: Implement essential workflows for basic project management and development.

### Project Management Workflows (High Priority)

- [ ] **initialize-project**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: `workflows/initialize-project/README.md`
  - Agent: Nova (Project Coordinator)
  - Purpose: Set up new projects with Dual Engine tracking
  - Priority: **CRITICAL** (foundation for all other work)

- [ ] **sprint-planning**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: `workflows/sprint-planning/README.md`
  - Agent: Nova (Project Coordinator)
  - Purpose: Scrum sprint planning with team assignments
  - Priority: **HIGH**

- [ ] **generate-status-report**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: Create README plan then implement
  - Agent: Nova (Project Coordinator)
  - Purpose: Real-time context-aware reporting
  - Priority: **HIGH**

- [ ] **assign-tasks**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: Create README plan then implement
  - Agent: Nova (Project Coordinator)
  - Purpose: Task distribution with email reminders
  - Priority: **MEDIUM**

- [ ] **process-meeting-transcript**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: Create README plan then implement
  - Agent: Echo (Meeting Orchestrator)
  - Purpose: Transcripts → action items, notes
  - Priority: **MEDIUM**

### Development Workflows (High Priority)

- [ ] **develop-web-application**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: `workflows/develop-web-application/README.md`
  - Agent: Titan (Full-Stack Developer)
  - Purpose: Full-stack web app development
  - Priority: **HIGH**

- [ ] **design-frontend**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: Create README plan then implement
  - Agent: Aurora (Frontend Designer)
  - Purpose: UI/UX design with 21st.dev components
  - Priority: **MEDIUM**

### Quality Workflows (High Priority)

- [ ] **production-readiness-check**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: `workflows/production-readiness-check/README.md`
  - Agent: Guardian (QA Engineer)
  - Purpose: Final quality gate (Defend phase)
  - Priority: **HIGH**

- [ ] **review-and-audit**
  - Command: `/bmad:bmb:workflows:create-workflow`
  - Reference: Create README plan then implement
  - Agent: Guardian (QA Engineer)
  - Purpose: Pre-production comprehensive review
  - Priority: **MEDIUM**

### Integration & Testing

- [ ] Test agent-workflow integration
  - Verify all agent menu items route correctly
  - Test workflow triggers work as expected

- [ ] Test installer with fresh project
  - Run: `bmad install orbit`
  - Answer all 18 configuration questions
  - Verify git-sync setup works
  - Test `./orbit-sync.sh pull` and `push`

- [ ] Validate configuration fields
  - Ensure all 24 config fields load correctly
  - Test team member email notifications
  - Verify Dual Engine settings apply

## Phase 2: Enhanced Workflows

Priority: Expand capabilities across all areas.

### Additional Development Workflows

- [ ] **build-mobile-app**
  - Agent: Phoenix (Mobile Developer)
  - Priority: **MEDIUM**

- [ ] **configure-aws-infrastructure**
  - Agent: Atlas-Prime (Infrastructure Architect)
  - Priority: **MEDIUM**

- [ ] **build-lms-structure**
  - Agent: Atlas-Prime (Infrastructure Architect)
  - Priority: **LOW**

- [ ] **create-dashboard**
  - Agent: Titan (Full-Stack Developer)
  - Priority: **MEDIUM**

- [ ] **build-automation-workflow**
  - Agent: Nexus (Integration Specialist)
  - Priority: **MEDIUM**

- [ ] **develop-shopify-integration**
  - Agent: Nexus (Integration Specialist)
  - Priority: **LOW**

- [ ] **configure-multi-platform-integration**
  - Agent: Nexus (Integration Specialist)
  - Priority: **MEDIUM**

### Documentation Workflows

- [ ] **create-technical-documentation**
  - Agent: Scribe (Technical Writer)
  - Priority: **MEDIUM**

- [ ] **generate-training-playbook**
  - Agent: Scribe (Technical Writer)
  - Priority: **MEDIUM**

- [ ] **create-onboarding-documentation**
  - Agent: Scribe (Technical Writer)
  - Priority: **MEDIUM**

- [ ] **create-offboarding-documentation**
  - Agent: Scribe (Technical Writer)
  - Priority: **LOW**

- [ ] **translate-documentation**
  - Agent: Clarity (Documentation Translator)
  - Priority: **MEDIUM**

- [ ] **create-process-diagram**
  - Agent: Atlas (Process Engineer)
  - Priority: **LOW**

- [ ] **generate-prd**
  - Agent: Scribe (Technical Writer)
  - Priority: **MEDIUM**

### Quality & Risk Workflows

- [ ] **test-and-validate**
  - Agent: Guardian (QA Engineer)
  - Priority: **MEDIUM**

- [ ] **conduct-risk-assessment**
  - Agent: Sentinel (Risk Manager)
  - Priority: **MEDIUM**

### Process Engineering

- [ ] **optimize-workflow**
  - Agent: Atlas (Process Engineer)
  - Priority: **LOW**

## Phase 3: Tasks & Polish

### Utility Tasks (6 tasks)

- [ ] **quick-status-check**
  - Fast project status lookup
  - Priority: **MEDIUM**

- [ ] **risk-assessment-scanner**
  - Quick risk evaluation
  - Priority: **MEDIUM**

- [ ] **send-task-reminder**
  - Email reminders for pending items
  - Priority: **MEDIUM**

- [ ] **validate-deliverable**
  - Quick quality/standards check
  - Priority: **MEDIUM**

- [ ] **export-project-report**
  - Generate snapshot report
  - Priority: **LOW**

- [ ] **crud-generator**
  - Quick CRUD scaffolding
  - Priority: **LOW**

### Testing

- [ ] Unit test all agents
  - Verify each agent loads correctly
  - Test embedded prompts work
  - Validate sidecar memory (Nova)

- [ ] Integration test workflows
  - Test workflow dependencies
  - Verify data flows correctly
  - Test Dual Engine Model coordination

- [ ] Test with sample project data
  - Create mock project
  - Run through full lifecycle (Discover > Demo > Deliver > Defend)
  - Verify team assignments work

- [ ] Test git synchronization
  - Simulate Fiona push → Cob/Marky pull
  - Verify shared-state updates
  - Test credentials stay local

### Documentation Enhancements

- [ ] Add API documentation
  - Document integration APIs
  - Context7 examples
  - SOAP/REST patterns

- [ ] Create video tutorials
  - "Getting Started with ORBIT"
  - "Team Synchronization Workflow"
  - "Full Project Lifecycle Demo"

- [ ] Write troubleshooting guide
  - Common git-sync issues
  - Installer problems
  - Configuration errors

- [ ] Add FAQ section
  - How do I add a new team member?
  - What if git conflicts occur?
  - How do I configure integrations?

### Release Preparation

- [ ] Version management
  - Update version to 1.0.0 in module.yaml
  - Tag release in git
  - Create CHANGELOG.md

- [ ] Create release notes
  - Feature highlights
  - Known limitations
  - Upgrade instructions

- [ ] Final validation
  - Clean install test
  - All workflows functional
  - Documentation complete

## Immediate Next Steps (Start Here)

**Recommended Order:**

1. **initialize-project** workflow
   - Foundation for all project work
   - Sets up Discover phase tracking
   - Critical for team to start using ORBIT

2. **sprint-planning** workflow
   - Core Scrum functionality
   - Enables task assignment to Fiona, Marky, Cob
   - Essential for team coordination

3. **develop-web-application** workflow
   - Primary development capability
   - Full-stack assistance
   - Demonstrates ORBIT's value

4. **production-readiness-check** workflow
   - Quality gate for Defend phase
   - Ensures high-quality deliverables
   - Completes the 4D lifecycle

5. **Test installer and git-sync**
   - Verify team collaboration works
   - Test on Marky's and Fiona's MacBooks
   - Ensure shared-state synchronization

## Quick Commands Reference

### Create New Workflow

```bash
/bmad:bmb:workflows:create-workflow
```

Then select the workflow folder (e.g., `initialize-project`)

### Test Module Installation

```bash
bmad install orbit
```

Answer 18 configuration questions

### Load an Agent

```bash
agent nova          # Project Coordinator
agent atlas         # Process Engineer
agent titan         # Full-Stack Developer
agent guardian      # QA Engineer
```

### Team Sync Commands

```bash
# Pull latest updates
./orbit-sync.sh pull

# Push your updates
./orbit-sync.sh push "Message describing changes"

# Check sync status
./orbit-sync.sh status
```

## Development Notes

### Important Considerations

**Git-Based Collaboration:**
- Shared-state directory is git-tracked
- When Fiona adds process engineering changes, she pushes to GitHub
- Cob & Marky pull to get updates
- All agents automatically reference shared-state for context

**Workflow Implementation Pattern:**
1. Create README.md plan in workflow folder (if not exists)
2. Run `/bmad:bmb:workflows:create-workflow`
3. Define steps following BMAD workflow architecture
4. Test with sample data
5. Update agent menu items if needed

**Dual Engine Model:**
- Process Engineering (Engine 1) and Development (Engine 2) run simultaneously
- Configure execution mode in config.yaml
- Atlas (Process Engineer) can run continuous or per-sprint reviews

**Team Roles:**
- **Fiona**: PM/Process Engineer - client-facing, coordinates, process improvements
- **Marky**: Developer - builds platforms using agentic approach
- **Cob**: Developer - builds platforms using agentic approach

### Dependencies

- **BMAD Method**: Version 6.0.0 or higher
- **Git**: For team synchronization
- **GitHub**: Repository for collaboration
- **Node.js**: For custom installer.js
- **Integration APIs** (Optional):
  - AWS credentials
  - n8n/Zapier/Make API keys
  - Shopify store access
  - Context7 API key
  - 21st.dev access token

### Module Structure Reference

```
orbit/
├── agents/                    # ✅ 12 agents created
│   └── *.yaml
├── workflows/                 # ✅ 24 folders created
│   └── */                    # 📋 README plans (4 complete, 20 pending)
├── tasks/                     # ✅ Created, empty (6 planned)
├── templates/                 # ✅ Created, empty
├── data/                      # ✅ Created, empty
├── _module-installer/         # ✅ installer.js with git-sync logic
├── module.yaml                # ✅ 24 configuration fields
├── README.md                  # ✅ Comprehensive documentation
└── TEAM-SYNC-GUIDE.md         # ✅ Generated during installation
```

## Completion Criteria

The module is complete when:

- [ ] All Phase 1 workflows are implemented and tested
- [ ] Installation works smoothly on fresh project
- [ ] Git synchronization tested across team MacBooks
- [ ] Documentation covers all implemented features
- [ ] Sample project demonstrates full lifecycle (Discover > Demo > Deliver > Defend)
- [ ] Team can collaborate using git push/pull workflow
- [ ] All 12 agents have functional workflows
- [ ] Quality gates work (production-readiness-check)

---

**Created:** 2026-02-01
**Last Updated:** 2026-02-01
**Module Version:** 1.0.0 (in development)
**Team:** Cob, Marky, Fiona
