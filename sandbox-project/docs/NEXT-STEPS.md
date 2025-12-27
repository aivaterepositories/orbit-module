# Next Steps - sandbox-project

**Version:** 1.0
**Created:** 2025-12-27
**Your Role:** Solo Developer / Infrastructure Manager

---

## Overview

Your sandbox demo server infrastructure is partially implemented! Based on the approved PRD and architecture, here are your prioritized next steps to complete the MVP.

## Current Status

### ✅ Already Complete

- [x] Project structure created
- [x] Basic AWS Lightsail scripts (create, manage, deploy)
- [x] Documentation library established
- [x] Git repository exists locally
- [x] **Live Deployment:** Dispute Tracker running at http://100.27.44.183:3001
- [x] Basic deployment workflow functional

### 🔧 In Progress / Needs Enhancement

- [ ] CLI commands formalized (scripts exist but need aliases/wrapper)
- [ ] Multi-remote git backup not configured
- [ ] Project metadata system (`project-info.json`) not implemented
- [ ] Comprehensive documentation integration
- [ ] Cost tracking not implemented

---

## Phase 1: Complete MVP Foundation (Week 1-2)

### Priority 1: Formalize CLI Commands

**Current State:** Scripts exist (`manage-instance.sh`, `deploy-project.sh`) but require full paths

**Goal:** Create user-friendly CLI commands callable from VSCode terminal

**Tasks:**

1. **Create CLI wrapper scripts**
   ```bash
   # Location: /Users/cob/Aivax/Brain2/sandbox-project/cli/
   - demo-start       # Wraps manage-instance.sh start
   - demo-stop        # Wraps manage-instance.sh stop
   - demo-status      # Wraps manage-instance.sh status
   - demo-list        # SSH + docker ps wrapper
   - demo-deploy      # Wraps deploy-project.sh
   ```

2. **Add to PATH or create shell aliases**
   ```bash
   # Edit ~/.zshrc or ~/.bashrc
   export PATH="/Users/cob/Aivax/Brain2/sandbox-project/cli:$PATH"

   # Or add aliases (simpler):
   alias demo-start="cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/manage-instance.sh start"
   alias demo-stop="cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/manage-instance.sh stop"
   alias demo-status="cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/manage-instance.sh status"
   alias demo-deploy="cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/deploy-project.sh"
   alias demo-list="ssh ubuntu@\$(cat ~/.sandbox-ip) 'docker ps --format \"table {{.Names}}\\\t{{.Status}}\\\t{{.Ports}}\"'"
   ```

3. **Test all commands from VSCode terminal**
   ```bash
   demo-status
   demo-list
   demo-start
   demo-deploy my-new-project
   demo-stop
   ```

**Estimated Time:** 2-3 hours

---

### Priority 2: Implement Project Metadata System

**Current State:** Projects deployed but no standardized metadata

**Goal:** Track project information consistently

**Tasks:**

1. **Create `project-info.json` template**
   ```bash
   # Location: /Users/cob/Aivax/Brain2/sandbox-project/examples/project-info.json
   ```

   ```json
   {
     "projectName": "dispute-tracker",
     "clientName": "Internal Demo",
     "deployedDate": "2025-12-26",
     "lastActivated": "2025-12-27",
     "status": "active",
     "ports": {
       "web": 3001,
       "database": 5432
     },
     "techStack": {
       "frontend": "Next.js",
       "backend": "Next.js API Routes",
       "database": "PostgreSQL"
     },
     "githubRepo": "https://github.com/yourusername/dispute-tracker",
     "description": "Employee dispute tracking system with role-based dashboards",
     "demoUrl": "http://100.27.44.183:3001",
     "healthCheckPath": "/",
     "environment": {
       "requiresEnvFile": true,
       "envTemplate": ".env.example"
     }
   }
   ```

2. **Add `project-info.json` to existing deployment**
   ```bash
   ssh ubuntu@<lightsail-ip>
   cd /srv/demos/projects/dispute-tracker
   nano project-info.json
   # Paste template with dispute-tracker details
   ```

3. **Update deploy-project.sh to create metadata**
   - Prompt for project details during deployment
   - Auto-generate `project-info.json`
   - Store in project directory

**Estimated Time:** 3-4 hours

---

### Priority 3: Setup Multi-Remote Git Backup

**Current State:** Repository exists locally, not pushed to GitHub

**Goal:** Backup to personal GitHub account

**Tasks:**

1. **Initialize git in project directory (if not done)**
   ```bash
   cd /Users/cob/Aivax/Brain2/sandbox-project
   git init
   ```

2. **Create .gitignore (already added by integration step)**
   - ✅ Already created above

3. **Create GitHub repository**
   ```bash
   # Via GitHub CLI (if installed)
   gh repo create sandbox-project --private --source=. --remote=origin

   # Or manually:
   # 1. Go to github.com
   # 2. Click "New Repository"
   # 3. Name: sandbox-project
   # 4. Private: Yes
   # 5. Create repository
   # 6. Copy SSH URL
   ```

4. **Configure remote and push**
   ```bash
   git remote add origin git@github.com:yourusername/sandbox-project.git

   # Stage all files
   git add .

   # Initial commit
   git commit -m "Initial commit: Sandbox demo server infrastructure

   - AWS Lightsail management scripts
   - Docker-based deployment system
   - CLI commands for demo activation/deactivation
   - Comprehensive documentation
   - Live deployment: Dispute Tracker

   🤖 Generated with UltraThink Project Initialization"

   # Push to GitHub
   git push -u origin main
   ```

**Estimated Time:** 1 hour

---

### Priority 4: Enhanced Documentation Integration

**Current State:** Existing docs + new UltraThink comprehensive docs

**Goal:** Link everything together seamlessly

**Tasks:**

1. **Update main README.md**
   - Add link to UltraThink documentation library
   - Reference PRD and Architecture docs
   - Add CLI-REFERENCE.md link

2. **Create documentation index**
   ```bash
   # Location: docs/INDEX.md
   ```

   List all documentation with descriptions:
   - Local docs (setup-guide, deployment-guide, aws-lightsail-guide)
   - UltraThink docs (PRD, Architecture, Tech Stack)
   - CLI reference
   - This file (NEXT-STEPS)

3. **Add cross-references**
   - Link between related documents
   - Add "See also" sections
   - Create quick navigation

**Estimated Time:** 1-2 hours

---

## Phase 2: Enhanced Features (Week 3-4)

### Feature 1: Cost Tracking

**Goal:** Monitor AWS costs per project

**Tasks:**

1. **Create cost-tracking script**
   ```bash
   # Location: scripts/track-costs.sh
   # Uses AWS CLI to get billing data
   # Estimates cost per project based on uptime
   ```

2. **Monthly cost report**
   - Generate report showing:
     - Instance running time
     - Estimated monthly cost
     - Cost per project (if multiple)
     - Savings vs always-on

3. **Budget alerts (optional)**
   - Set up AWS Budgets
   - Email alert if exceeds threshold

**Estimated Time:** 3-4 hours

---

### Feature 2: Health Monitoring

**Goal:** Automated health checks after demo activation

**Tasks:**

1. **Create health-check script**
   ```bash
   # Location: scripts/health-check.sh
   # Checks if project responds on assigned port
   # Verifies Docker container is running
   # Tests database connectivity (if applicable)
   ```

2. **Integrate with demo-start**
   - Run health check automatically after activation
   - Retry logic if not ready
   - Display "Ready for demo" when passing

3. **Pre-demo validation**
   - Check disk space
   - Verify no port conflicts
   - Confirm dependencies are up

**Estimated Time:** 4-5 hours

---

### Feature 3: Backup & Recovery

**Goal:** Automated database backups

**Tasks:**

1. **Automated backup script**
   ```bash
   # Location: scripts/auto-backup.sh
   # Runs daily via cron
   # Backs up PostgreSQL databases
   # Stores in /srv/demos/backups/
   # Retains last 7 days
   ```

2. **Snapshot management**
   - Create Lightsail snapshot before updates
   - Script to list/delete old snapshots
   - Restore procedure documented

3. **Disaster recovery guide**
   - Document in docs/disaster-recovery.md
   - Step-by-step restoration
   - RTO/RPO targets

**Estimated Time:** 3-4 hours

---

## Development Workflow

### Daily Workflow

1. **Morning:** Check demo status
   ```bash
   demo-status
   demo-list
   ```

2. **Before client demo:** Activate project
   ```bash
   demo-start
   # Wait 2-3 minutes for startup
   demo-status
   # Access URL provided
   ```

3. **After demo:** Deactivate to save costs
   ```bash
   demo-stop
   ```

### Weekly Maintenance

- Review logs for errors
- Check disk usage
- Update dependencies if needed
- Create Lightsail snapshot

### Monthly Tasks

- Review AWS bill
- Update documentation
- Archive old demos no longer needed

---

## Testing Checklist

### Before Marking MVP Complete

- [ ] All CLI commands work from VSCode terminal
- [ ] Can deploy new project from GitHub
- [ ] Can start/stop instance successfully
- [ ] Projects auto-restart after instance start
- [ ] Database data persists across restarts
- [ ] Git backup configured and working
- [ ] Documentation is complete and accurate
- [ ] At least 2 demo projects deployed successfully

---

## Client Demo Preparation

### 30 Minutes Before Demo

1. **Start instance:**
   ```bash
   demo-start
   ```

2. **Verify project is running:**
   ```bash
   demo-status
   demo-list
   ```

3. **Test access:**
   - Open URL in browser
   - Verify all features work
   - Test demo user accounts

4. **Have backup plan:**
   - Know how to restart if needed
   - Have screenshots/video if server fails

### During Demo

- Keep terminal open with logs
- Monitor for any errors
- Be ready to troubleshoot

### After Demo

1. **Stop instance:**
   ```bash
   demo-stop
   ```

2. **Document any issues** encountered

3. **Update project metadata** if needed

---

## Success Metrics (From PRD)

Track these to validate MVP:

- ✅ **Cost Reduction:** Targeting 60% savings vs always-on
  - Current: ~$5-7/month (on-demand activation)
  - Always-on equivalent: ~$15-20/month
  - **Achievement:** ~65% reduction ✅

- **Demo Activation Time:** < 5 minutes
  - Current: 2-3 minutes for instance start
  - **Status:** Meeting goal ✅

- **Deployment Success Rate:** 95%+
  - Current: 1/1 successful (Dispute Tracker)
  - **Status:** Need more deployments to validate

- **Uptime During Demos:** 99.9%
  - Current: 100% (limited testing)
  - **Status:** Monitor ongoing

---

## Troubleshooting Common Issues

### Issue: SSH Connection Refused

**Cause:** Instance stopped or IP changed

**Fix:**
```bash
./scripts/manage-instance.sh start
# Get new IP from output
# Update ~/.ssh/config with new IP
```

### Issue: Container Won't Start

**Cause:** Port conflict or missing .env

**Fix:**
```bash
ssh ubuntu@<lightsail-ip>
cd /srv/demos/projects/<project-name>
docker-compose logs
# Fix reported issue (.env, port, etc.)
docker-compose up -d
```

### Issue: Out of Disk Space

**Cause:** Docker images/logs accumulating

**Fix:**
```bash
ssh ubuntu@<lightsail-ip>
docker system prune -a
# Removes unused images, containers
```

---

## Resources

### Documentation

- **PRD:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/PRD-v1.0.md`
- **Architecture:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/ARCHITECTURE-v1.0.md`
- **Tech Stack:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/TECH-STACK.md`
- **CLI Reference:** `/Users/cob/Aivax/Brain2/sandbox-project/docs/CLI-REFERENCE.md`

### Visual Documentation

- **User Flow:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/diagrams/USER-FLOW-DIAGRAM-PROMPT.md`
- **Architecture Diagram:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/diagrams/ARCHITECTURE-DIAGRAM-PROMPT.md`
- **Data Structure:** `/Users/cob/Aivax/Brain2/ultrathink-docs/sandbox-project/diagrams/DATA-STRUCTURE-DIAGRAM-PROMPT.md`

### Existing Local Docs

- **AWS Lightsail Guide:** `docs/aws-lightsail-guide.md`
- **Deployment Guide:** `docs/deployment-guide.md`
- **Setup Guide:** `docs/setup-guide.md`

---

## Recommended First Task (This Week)

🎯 **Start Here:**

**Task:** Setup Git backup and push initial commit

**Why:** Protect your work! You've already got a working deployment - back it up to GitHub now.

**Steps:**
1. Review .gitignore (already created)
2. Create GitHub repository
3. Commit and push all files
4. Verify backup successful

**Success Criteria:**
- Repository exists on GitHub
- All scripts and docs backed up
- Can clone fresh copy if needed

**Estimated Time:** 1 hour

---

## Second Task (This Week)

**Task:** Implement project metadata for Dispute Tracker

**Why:** Formalize the tracking system before adding more projects

**Steps:**
1. Create `project-info.json` template
2. Add metadata to existing Dispute Tracker deployment
3. Document the metadata structure

**Success Criteria:**
- Template exists in `examples/`
- Dispute Tracker has `project-info.json`
- Can reference project metadata easily

**Estimated Time:** 2 hours

---

**You've got a solid foundation! Complete these priorities and you'll have a production-ready demo management system.** 🚀

**Generated by UltraThink Project Initialization** - 2025-12-27
