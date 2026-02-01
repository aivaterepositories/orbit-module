# ORBIT

**Operational Resource for Business Innovation & Team delivery**

ORBIT is a comprehensive development agency platform that bridges the gap between technical teams and clients by providing simultaneous process engineering and product development, ensuring timely project updates, high-quality deliverables, and client-appropriate documentation across the full technology stack.

## Overview

This module provides a complete project management and delivery system following the **Dual Engine Model** where Process Engineering and System/Product/Project Development run simultaneously for accelerated delivery.

**Core Features:**
- **Scrum Project Management** with real-time team awareness
- **Full-Stack Development** assistance (web, mobile, infrastructure)
- **Process Engineering** and continuous improvement
- **Risk Management** with industry standards
- **Quality Assurance** and production readiness validation
- **Multi-Level Documentation** (tech-savvy to non-technical)
- **Multi-Platform Integrations** (AWS, n8n, Zapier, Make, Shopify, Context7, 21st.dev)
- **Meeting Intelligence** (transcripts → action items)
- **Git-Based Team Synchronization** across MacBooks

**Journey Map:** Every project follows **Discover > Demo > Deliver > Defend** lifecycle

## Installation

Install the module using BMAD:

```bash
bmad install orbit
```

The installer will ask 18 questions to configure:
- Project and output paths
- Team member details (names, emails)
- Feature preferences (sprint length, documentation level, risk frequency)
- Dual Engine Model settings
- Integration setup (AWS region, credentials path)

### Git-Based Team Synchronization

ORBIT includes custom installation logic for team collaboration across Cob's, Marky's, and Fiona's MacBooks:

1. **Shared Project State** (git-tracked): All team members have same context
2. **Local Credentials** (git-ignored): API keys stay private per MacBook
3. **Sync Workflow**:
   ```bash
   # Fiona updates process → pushes to GitHub
   git push

   # Cob & Marky pull to sync
   ./orbit-sync.sh pull
   ```

See `TEAM-SYNC-GUIDE.md` for complete workflow.

## Components

### Agents (12)

**🔧 Engine 1: Process Engineering & Coordination**

1. **Atlas** - Process Engineer & Workflow Optimizer
   - Brainstorm improvements, optimize processes, continuous improvement
   - Triggers: `QA` (Quick Analysis), `BI` (Brainstorm Improvements)

2. **Nova** - Project Coordinator & Scrum Master
   - Sprint planning, task assignment, team coordination, real-time status
   - Triggers: `SC` (Status Check), `QA` (Quick Assign)
   - **Has Memory**: Tracks project patterns across sprints

3. **Sentinel** - Risk Manager & Compliance Specialist
   - Risk assessment, mitigation strategies, compliance tracking
   - Triggers: `QR` (Quick Risk Scan), `CC` (Compliance Check)

4. **Echo** - Meeting Orchestrator & Action Item Specialist
   - Transcript interpretation, action items, meeting notes (internal/external)
   - Triggers: `QE` (Quick Extract), `ND` (Note Draft)

**💻 Engine 2: Development & Technical Delivery**

5. **Titan** - Full-Stack Developer & Web Application Specialist
   - Web apps, CRM, dashboards, CRUD operations, DRY/KISS principles
   - Triggers: `AR` (Architecture Review), `CS` (CRUD Scaffold)

6. **Phoenix** - Mobile Developer & Cross-Platform Specialist
   - Android/iOS development using Electron library
   - Triggers: `PA` (Platform Assessment), `MA` (Mobile Architecture)

7. **Atlas-Prime** - Infrastructure Architect & AWS Solutions Expert
   - AWS infrastructure, solutions architecture, LMS structure creation
   - Triggers: `AQ` (AWS Quickstart), `LS` (LMS Structure)

8. **Nexus** - Integration Specialist & Multi-Platform Expert
   - n8n, Zapier, Make.com, Shopify, SOAP/REST APIs, Context7
   - Triggers: `IP` (Integration Plan), `AD` (API Documentation)

9. **Aurora** - Frontend Designer & UI/UX Specialist
   - Premium UI/UX with 21st.dev components, design systems
   - Triggers: `UR` (UI Review), `CR` (Component Recommendations)

**✅ Quality & Documentation Layer**

10. **Guardian** - QA Engineer & Quality Assurance Specialist
    - Pre-production review, testing, production readiness (Defend phase)
    - Triggers: `QC` (Quick Quality Check), `TP` (Test Plan)

11. **Scribe** - Technical Writer & Documentation Specialist
    - Technical docs, playbooks, PRDs, onboarding/offboarding
    - Triggers: `DO` (Doc Outline), `QP` (Quick Playbook)

12. **Clarity** - Documentation Translator & Multi-Level Adapter
    - Translate docs for tech-savvy, semi-technical, non-technical audiences
    - Triggers: `QT` (Quick Translate), `LA` (Level Assessment)

### Workflows (24)

**Project Management & Coordination (5)**
- Initialize Project
- Sprint Planning
- Generate Status Report
- Process Meeting Transcript
- Assign Tasks

**Development (8)**
- Develop Web Application
- Build Mobile App
- Create Dashboard
- Build Automation Workflow
- Develop Shopify Integration
- Configure AWS Infrastructure
- Build LMS Structure
- Design Frontend

**Quality & Review (3)**
- Review & Audit
- Test & Validate
- Production Readiness Check

**Documentation (7)**
- Create Technical Documentation
- Generate Training Playbook
- Create Onboarding Documentation
- Create Offboarding Documentation
- Translate Documentation
- Create Process Diagram
- Generate PRD

**Integration (1)**
- Configure Multi-Platform Integration

### Tasks (6)

- Quick Status Check
- Risk Assessment Scanner
- Send Task Reminder
- Validate Deliverable
- Export Project Report
- CRUD Generator

## Quick Start

### 1. Load the Project Coordinator

```
agent nova
```

Nova is your Scrum Master and primary orchestrator.

### 2. Initialize a New Project

```
initialize-project
```

This sets up project structure, team assignments, and Discover phase tracking.

### 3. Plan Your First Sprint

```
sprint-planning
```

Nova will guide you through backlog prioritization and task assignments to Fiona, Marky, and Cob.

### 4. Check Project Status Anytime

```
SC
```

Get real-time status with team assignments, blockers, and next actions.

### 5. Development Workflow Example

For web application development:

```
agent titan
develop-web-app
```

Titan provides full-stack assistance following DRY and KISS principles.

## Module Structure

```
orbit/
├── agents/                    # 12 agent definitions (.yaml)
│   ├── process-engineer.yaml
│   ├── project-coordinator.yaml
│   ├── risk-manager.yaml
│   ├── meeting-orchestrator.yaml
│   ├── full-stack-developer.yaml
│   ├── mobile-developer.yaml
│   ├── infrastructure-architect.yaml
│   ├── integration-specialist.yaml
│   ├── frontend-designer.yaml
│   ├── qa-engineer.yaml
│   ├── technical-writer.yaml
│   └── documentation-translator.yaml
├── workflows/                 # 24 workflow folders
│   ├── initialize-project/
│   ├── sprint-planning/
│   ├── develop-web-application/
│   └── ... (21 more)
├── tasks/                     # 6 task utilities
├── templates/                 # Shared templates
├── data/                      # Module data
├── _module-installer/         # Installation logic
│   ├── installer.js           # Git-sync custom logic
│   └── assets/
├── module.yaml                # Install configuration
├── README.md                  # This file
└── TEAM-SYNC-GUIDE.md         # Git collaboration workflow
```

## Configuration

The module is configured in `_bmad/orbit/config.yaml` after installation.

**Key Settings:**

- **project_output_path**: Where ORBIT saves project data
- **team_member_1/2/3_name/email**: Team configuration for Fiona, Marky, Cob
- **email_notifications_enabled**: Task reminder emails
- **default_sprint_length**: 1-4 weeks (default: 2 weeks)
- **default_documentation_level**: tech-savvy, semi-tech, non-technical
- **risk_assessment_frequency**: daily, weekly, bi-weekly, monthly
- **dual_engine_mode**: simultaneous or sequential
- **process_review_frequency**: continuous, per-sprint, per-phase
- **aws_region**: Default AWS region for infrastructure
- **integration_credentials_path**: Secure credentials storage

## Team Collaboration

ORBIT is designed for git-based team synchronization:

**Shared Across MacBooks (git-tracked):**
- Project contexts and status
- Sprint planning and tracking
- Meeting notes and action items
- Process improvements
- Team task assignments

**Local Only (git-ignored):**
- API keys and credentials
- Personal settings

**Daily Workflow:**

```bash
# Morning: Get latest updates
./orbit-sync.sh pull

# Work with ORBIT agents
# They automatically read/write to shared state

# End of day: Share updates
./orbit-sync.sh push "Daily update: completed tasks X, Y, Z"
```

## Examples

### Example 1: Starting a New Project

```bash
# 1. Load Project Coordinator
agent nova

# 2. Initialize project
initialize-project
# Provide: project name, client info, initial requirements

# 3. Conduct risk assessment
agent sentinel
risk-assessment

# 4. Plan first sprint
agent nova
sprint-planning
# Review backlog, set sprint goal, assign tasks
```

### Example 2: Processing a Meeting

```bash
# 1. Load Meeting Orchestrator
agent echo

# 2. Process transcript
process-transcript
# Provide: meeting transcript or discussion

# Output: Action items with owners and due dates
#         Meeting notes (internal and external formats)
```

### Example 3: Developing a Web Application

```bash
# 1. Load Full-Stack Developer
agent titan

# 2. Start development workflow
develop-web-app
# Provide: requirements, tech stack preferences

# 3. Get UI/UX design
agent aurora
design-frontend

# 4. Quality check before production
agent guardian
production-readiness-check
```

## Development Status

**Phase 1 (MVP) - Current:**
- [x] Module structure created
- [x] Installer configured with git-sync
- [x] 12 agents created with proper YAML structure
- [x] 24 workflow folders with placeholder plans
- [x] Team synchronization setup
- [ ] Workflow implementations (use `/bmad:bmb:workflows:create-workflow`)
- [ ] Full integration testing

**Phase 2 (Enhancement) - Planned:**
- [ ] Expand all workflow implementations
- [ ] Add 6 utility tasks
- [ ] Integration credential management UI
- [ ] Advanced reporting dashboards
- [ ] Mobile app examples

**Note:** Workflow folders exist with README plans. Implement each workflow using:
```bash
/bmad:bmb:workflows:create-workflow
```

## Contributing

To extend ORBIT:

1. **Add Agents**: Use `/bmad:bmb:workflows:create-agent`
2. **Add Workflows**: Use `/bmad:bmb:workflows:create-workflow`
3. **Update Configuration**: Modify `module.yaml` for new settings
4. **Test Git Sync**: Ensure shared-state updates sync properly
5. **Document Changes**: Update this README

## Requirements

- **BMAD Method**: Version 6.0.0 or higher
- **Git**: For team synchronization
- **GitHub**: Repository for team collaboration
- **Node.js**: For custom installer.js execution
- **Team**: Configured for Fiona (PM/Process Engineer), Marky (Developer), Cob (Developer)

## Author

Created by **Cob** on 2026-02-01

**Team:**
- Fiona: PM/Process Engineer (client-facing translator)
- Marky: Developer (platform builder)
- Cob: Developer (platform builder)

## License

Internal use - Development agency platform for team collaboration

---

## Module Details

**Module Code:** orbit
**Category:** Business Operations + Technical Development (Hybrid Platform)
**Type:** Complex Module (12 agents, 24 workflows, 6 tasks)
**Version:** 1.0.0

**Last Updated:** 2026-02-01

---

## Support

- **Git Sync Issues**: See `TEAM-SYNC-GUIDE.md`
- **Configuration**: Check `_bmad/orbit/config.yaml`
- **Workflows**: Each workflow folder has README.md with implementation plan
- **Team Coordination**: Contact Fiona for process engineering updates
