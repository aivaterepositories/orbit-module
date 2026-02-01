/**
 * ORBIT Module Custom Installer
 *
 * Handles git-based team synchronization for Cob, Marky, and Fiona
 * Ensures context awareness across MacBooks through GitHub repository
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

module.exports = {
  /**
   * Custom installation logic for ORBIT
   * @param {Object} config - User configuration from module.yaml prompts
   * @param {String} projectRoot - Project root directory
   */
  async install(config, projectRoot) {
    console.log('\n🚀 ORBIT Custom Installation - Git-Based Team Sync\n');

    // 1. Create .gitignore for sensitive data
    await this.createGitIgnore(projectRoot);

    // 2. Initialize git repository if not exists
    await this.initializeGitRepo(projectRoot);

    // 3. Create shared project state directory (git-tracked)
    await this.createSharedProjectState(projectRoot, config);

    // 4. Create local credentials directory (git-ignored)
    await this.createLocalCredentials(projectRoot, config);

    // 5. Setup team synchronization guide
    await this.createSyncGuide(projectRoot, config);

    // 6. Create orbit-sync helper script
    await this.createSyncScript(projectRoot);

    console.log('\n✅ ORBIT installation complete!');
    console.log('\n📚 Team Synchronization Setup:');
    console.log('   - Shared project state: _bmad/orbit/shared-state/ (git-tracked)');
    console.log('   - Local credentials: .orbit-credentials/ (git-ignored)');
    console.log('   - Sync script: orbit-sync.sh (pull/push helper)');
    console.log('\n🔄 Workflow:');
    console.log('   1. Fiona updates process/adds implementations → git push');
    console.log('   2. Cob & Marky pull → ./orbit-sync.sh pull');
    console.log('   3. All team members have same context across devices');
    console.log('\n📖 See: _bmad/orbit/TEAM-SYNC-GUIDE.md for details\n');
  },

  /**
   * Create .gitignore to protect sensitive data
   */
  async createGitIgnore(projectRoot) {
    const gitignorePath = path.join(projectRoot, '.gitignore');
    const orbitIgnoreRules = `
# ORBIT - Sensitive Data (DO NOT COMMIT)
.orbit-credentials/
**/api-keys.yaml
**/secrets.yaml
**/*-credentials.json

# ORBIT - Local-only files
**/local-settings.yaml
**/temp-notes/
`;

    if (fs.existsSync(gitignorePath)) {
      // Append to existing .gitignore
      const existing = fs.readFileSync(gitignorePath, 'utf8');
      if (!existing.includes('# ORBIT - Sensitive Data')) {
        fs.appendFileSync(gitignorePath, orbitIgnoreRules);
        console.log('✅ Added ORBIT rules to existing .gitignore');
      }
    } else {
      // Create new .gitignore
      fs.writeFileSync(gitignorePath, orbitIgnoreRules);
      console.log('✅ Created .gitignore with ORBIT rules');
    }
  },

  /**
   * Initialize git repository if needed
   */
  async initializeGitRepo(projectRoot) {
    try {
      execSync('git rev-parse --git-dir', { cwd: projectRoot, stdio: 'ignore' });
      console.log('✅ Git repository detected');
    } catch (error) {
      console.log('⚠️  No git repository found');
      console.log('   Run: git init && git remote add origin <your-github-repo>');
      console.log('   This enables team synchronization across MacBooks');
    }
  },

  /**
   * Create shared project state directory (git-tracked)
   */
  async createSharedProjectState(projectRoot, config) {
    const sharedStatePath = path.join(projectRoot, '_bmad/orbit/shared-state');

    if (!fs.existsSync(sharedStatePath)) {
      fs.mkdirSync(sharedStatePath, { recursive: true });
    }

    // Create subdirectories for shared context
    const subdirs = [
      'projects',           // Active project contexts
      'sprints',            // Sprint tracking data
      'meeting-notes',      // Shared meeting notes
      'process-improvements', // Process engineering updates
      'team-assignments'    // Task assignments and status
    ];

    subdirs.forEach(dir => {
      const dirPath = path.join(sharedStatePath, dir);
      if (!fs.existsSync(dirPath)) {
        fs.mkdirSync(dirPath, { recursive: true });
      }
    });

    // Create README explaining shared state
    const readmePath = path.join(sharedStatePath, 'README.md');
    fs.writeFileSync(readmePath, `# ORBIT Shared Project State

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

- **${config.team_member_1_name}**: ${config.team_member_1_role}
- **${config.team_member_2_name}**: ${config.team_member_2_role}
- **${config.team_member_3_name}**: ${config.team_member_3_role}

## Workflow

\`\`\`bash
# Push your updates (Fiona after process engineering)
git add _bmad/orbit/shared-state/
git commit -m "Update: [description]"
git push

# Pull updates (Cob & Marky to sync)
./orbit-sync.sh pull
\`\`\`

All ORBIT agents automatically reference this shared state for context awareness.
`);

    console.log('✅ Created shared project state directory (git-tracked)');
  },

  /**
   * Create local credentials directory (git-ignored)
   */
  async createLocalCredentials(projectRoot, config) {
    const credPath = config.integration_credentials_path.replace('{project-root}', projectRoot);

    if (!fs.existsSync(credPath)) {
      fs.mkdirSync(credPath, { recursive: true });
    }

    // Create template for credentials
    const templatePath = path.join(credPath, 'credentials-template.yaml');
    fs.writeFileSync(templatePath, `# ORBIT Integration Credentials
# This file is GIT-IGNORED - keep your API keys safe!
# Each team member maintains their own credentials locally

aws:
  access_key_id: ""
  secret_access_key: ""
  region: "${config.aws_region}"

n8n:
  api_key: ""
  instance_url: ""

zapier:
  api_key: ""

make:
  api_key: ""
  team_id: ""

shopify:
  api_key: ""
  api_secret: ""
  store_url: ""

context7:
  api_key: ""

dev21:
  access_token: ""

# Add your credentials above
# DO NOT commit this file to git
`);

    console.log('✅ Created local credentials directory (git-ignored)');
  },

  /**
   * Create team synchronization guide
   */
  async createSyncGuide(projectRoot, config) {
    const guidePath = path.join(projectRoot, '_bmad/orbit/TEAM-SYNC-GUIDE.md');
    fs.writeFileSync(guidePath, `# ORBIT Team Synchronization Guide

## Team MacBooks Setup

**Team Members:**
- **${config.team_member_1_name}** (${config.team_member_1_role}) - ${config.team_member_1_email}
- **${config.team_member_2_name}** (${config.team_member_2_role}) - ${config.team_member_2_email}
- **${config.team_member_3_name}** (${config.team_member_3_role}) - ${config.team_member_3_email}

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

\`\`\`bash
# 1. Make your updates using ORBIT agents
# 2. Commit and push
git add _bmad/orbit/shared-state/
git add _bmad/_memory/project-coordinator-sidecar/
git commit -m "Process update: [description]"
git push origin main

# 3. Notify team (optional)
# Cob and Marky will pull to get your updates
\`\`\`

### Cob & Marky (Developers)

When Fiona pushes updates, sync your MacBook:

\`\`\`bash
# Quick sync (recommended)
./orbit-sync.sh pull

# Or manually
git pull origin main

# Now you have Fiona's latest process engineering and context!
\`\`\`

### Any Team Member

When you update project status or complete tasks:

\`\`\`bash
# Commit your work
git add _bmad/orbit/shared-state/
git commit -m "Update: sprint status"
git push

# Others pull to see your updates
\`\`\`

## Daily Workflow

**Morning:**
\`\`\`bash
./orbit-sync.sh pull   # Get latest team updates
\`\`\`

**During Work:**
- Use ORBIT agents normally
- They read/write to shared-state/ automatically
- Context is always team-aware

**End of Day:**
\`\`\`bash
git add _bmad/orbit/shared-state/
git commit -m "Daily update: [summary]"
git push                # Share your work with team
\`\`\`

## Initial Setup (Each MacBook)

### 1. Clone Repository

\`\`\`bash
# First-time setup on new MacBook
git clone <your-github-repo-url>
cd <project-directory>

# Install ORBIT module
bmad install orbit
\`\`\`

### 2. Configure Credentials Locally

Each team member sets up their own credentials:

\`\`\`bash
# Copy template
cp .orbit-credentials/credentials-template.yaml .orbit-credentials/credentials.yaml

# Edit with your API keys
# These stay local (git-ignored)
\`\`\`

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
- Run: \`./orbit-sync.sh pull\`
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

Contact: ${config.team_member_1_email} (${config.team_member_1_name})
`);

    console.log('✅ Created team synchronization guide');
  },

  /**
   * Create orbit-sync helper script
   */
  async createSyncScript(projectRoot) {
    const scriptPath = path.join(projectRoot, 'orbit-sync.sh');
    fs.writeFileSync(scriptPath, `#!/bin/bash
# ORBIT Team Synchronization Helper
# Quick pull/push for team coordination

ACTION=\${1:-pull}

case $ACTION in
  pull)
    echo "🔄 Pulling latest ORBIT updates from team..."
    git pull origin main
    echo "✅ Synced! You now have latest team context."
    ;;
  push)
    echo "📤 Pushing your ORBIT updates to team..."
    git add _bmad/orbit/shared-state/
    git add _bmad/_memory/project-coordinator-sidecar/

    if [ -z "$2" ]; then
      echo "❌ Please provide commit message:"
      echo "   ./orbit-sync.sh push \"Your message here\""
      exit 1
    fi

    git commit -m "$2"
    git push origin main
    echo "✅ Pushed! Team can now pull your updates."
    ;;
  status)
    echo "📊 ORBIT Sync Status:"
    git status _bmad/orbit/shared-state/
    ;;
  *)
    echo "ORBIT Team Sync Helper"
    echo ""
    echo "Usage:"
    echo "  ./orbit-sync.sh pull              # Get latest team updates"
    echo "  ./orbit-sync.sh push \"message\"    # Share your updates"
    echo "  ./orbit-sync.sh status            # Check sync status"
    ;;
esac
`);

    // Make script executable
    fs.chmodSync(scriptPath, '755');
    console.log('✅ Created orbit-sync.sh helper script');
  }
};
