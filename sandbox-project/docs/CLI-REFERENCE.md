# CLI Command Reference
## Sandbox Demo Server Management

**Last Updated:** 2025-12-27  
**Version:** 1.0

---

## Overview

This document provides comprehensive reference for all CLI commands to manage your sandbox demo server. Commands can be run from your local machine (VSCode terminal) via SSH.

## Quick Reference

| Command | Purpose | Usage |
|---------|---------|-------|
| `demo-create` | Create new Lightsail instance | `./scripts/create-instance.sh` |
| `demo-setup` | Initial server configuration | `./scripts/setup-server.sh` (on server) |
| `demo-deploy` | Deploy project from GitHub | `./scripts/deploy-project.sh <project-name>` |
| `demo-start` | Start Lightsail instance | `./scripts/manage-instance.sh start` |
| `demo-stop` | Stop Lightsail instance | `./scripts/manage-instance.sh stop` |
| `demo-status` | Check instance status | `./scripts/manage-instance.sh status` |
| `demo-list` | List all deployed projects | `docker ps` (on server) |

---

## Installation & Setup Commands

### Create Instance

**Script:** `./scripts/create-instance.sh`

Creates a new AWS Lightsail instance for hosting demos.

```bash
# From local machine
cd /Users/cob/Aivax/Brain2/sandbox-project
./scripts/create-instance.sh
```

**What it does:**
- Creates Ubuntu 22.04 LTS Lightsail instance
- Configures in us-east-1 region
- Sets up 1GB RAM / 1 vCPU / 40GB SSD
- Assigns static IP
- Configures firewall rules (ports 22, 80, 443, 3000-4000)

**Output:**
- Instance ID
- Static IP address
- SSH connection command

**Cost:** $5/month while running

---

### Setup Server

**Script:** `./scripts/setup-server.sh`

Configures the Lightsail instance with all necessary software.

```bash
# SSH to server first
ssh ubuntu@<lightsail-ip>

# Download and run setup
curl -O https://raw.githubusercontent.com/yourusername/sandbox-project/main/scripts/setup-server.sh
chmod +x setup-server.sh
./setup-server.sh
```

**What it does:**
- Updates system packages
- Installs Docker & Docker Compose
- Creates `/srv/demos/` directory structure
- Configures nginx reverse proxy
- Sets up SSL (optional)
- Installs PostgreSQL container
- Creates demo user accounts

**Duration:** ~10-15 minutes

**Verification:**
```bash
docker --version
docker-compose --version
ls -la /srv/demos/
```

---

## Project Deployment Commands

### Deploy Project

**Script:** `./scripts/deploy-project.sh`

Deploys a project from GitHub to the sandbox server.

```bash
# Basic deployment
./scripts/deploy-project.sh <project-name>

# Deploy with custom port
./scripts/deploy-project.sh <project-name> --port 3005

# Re-deploy (update existing)
./scripts/deploy-project.sh <project-name> --update
```

**Parameters:**
- `<project-name>`: Name of project (creates folder at `/srv/demos/projects/<name>`)
- `--port <number>`: Custom port assignment (default: auto-assigned)
- `--update`: Update existing deployment (git pull + rebuild)
- `--branch <name>`: Deploy specific git branch (default: main)

**Prerequisites:**
- Project must have `docker-compose.yml`
- GitHub repository must be accessible
- SSH key configured for GitHub access

**What it does:**
1. Clones repository to `/srv/demos/projects/<name>/`
2. Creates project-specific `.env` from template
3. Assigns unique port (3001-3999 range)
4. Runs `docker-compose up -d`
5. Creates nginx reverse proxy entry
6. Runs health check
7. Outputs access URL

**Example:**
```bash
./scripts/deploy-project.sh dispute-tracker
# Output: ✅ Deployed at http://100.27.44.183:3001
```

**Troubleshooting:**
- If port conflict: Specify custom port with `--port`
- If build fails: Check `docker-compose logs <project-name>`
- If GitHub access denied: Verify SSH key with `ssh -T git@github.com`

---

## Instance Management Commands

### Start Instance

**Script:** `./scripts/manage-instance.sh start`

Starts a stopped Lightsail instance.

```bash
./scripts/manage-instance.sh start
```

**What it does:**
- Starts the Lightsail instance
- Waits for instance to become available
- Displays new public IP (changes on restart)
- Verifies SSH connectivity

**Duration:** ~2-3 minutes

**Note:** IP address changes each time you start (unless using static IP)

**After starting:**
- Update local SSH config with new IP
- Projects auto-start via Docker restart policies
- Database restores from volume

---

### Stop Instance

**Script:** `./scripts/manage-instance.sh stop`

Stops the Lightsail instance to save costs.

```bash
./scripts/manage-instance.sh stop
```

**What it does:**
- Gracefully stops all Docker containers
- Stops the Lightsail instance
- Data persists in Docker volumes

**Cost savings:** $0/hour while stopped (only snapshot storage if created)

**Before stopping:**
- Ensure no active demos running
- Optional: Create snapshot for backup

**Data preserved:**
- Docker volumes (database data)
- Files in `/srv/demos/`
- Project deployments

---

### Check Status

**Script:** `./scripts/manage-instance.sh status`

Checks current state of Lightsail instance.

```bash
./scripts/manage-instance.sh status
```

**Output:**
- Instance state (running/stopped/pending)
- Public IP address
- Uptime
- Resource usage (CPU, RAM, disk)
- Running containers

**Example output:**
```
Instance: sandbox-demo-server
State: running
IP: 100.27.44.183
Uptime: 5 days, 3 hours
CPU: 15%
RAM: 512MB / 1GB (51%)
Disk: 8GB / 40GB (20%)

Running containers:
- dispute-tracker-app (up 5 days)
- postgres (up 5 days)
- nginx (up 5 days)
```

---

### List Deployed Projects

**Command:** `docker ps` (on server)

Lists all currently running demo projects.

```bash
# SSH to server
ssh ubuntu@<lightsail-ip>

# List running projects
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
```

**Alternative (with details):**
```bash
# List all projects (running + stopped)
docker ps -a

# List with resource usage
docker stats --no-stream
```

**Example output:**
```
NAMES                   STATUS          PORTS
dispute-tracker-app    Up 5 days       0.0.0.0:3001->3000/tcp
project-2-app          Up 2 days       0.0.0.0:3002->3000/tcp
postgres               Up 5 days       5432/tcp
nginx                  Up 5 days       0.0.0.0:80->80/tcp
```

---

## Project Management Commands

### View Logs

```bash
# SSH to server first
ssh ubuntu@<lightsail-ip>

# View logs for specific project
docker logs dispute-tracker-app

# Follow logs in real-time
docker logs -f dispute-tracker-app

# View last 100 lines
docker logs --tail 100 dispute-tracker-app

# View logs with timestamps
docker logs -t dispute-tracker-app
```

---

### Restart Project

```bash
# Restart specific project
docker restart dispute-tracker-app

# Restart all projects
docker restart $(docker ps -q)

# Stop and start (clean restart)
docker-compose down
docker-compose up -d
```

---

### Update Project

```bash
# Re-deploy with latest code
./scripts/deploy-project.sh <project-name> --update

# Manual update
ssh ubuntu@<lightsail-ip>
cd /srv/demos/projects/<project-name>
git pull
docker-compose up -d --build
```

---

### Remove Project

```bash
# SSH to server
ssh ubuntu@<lightsail-ip>

# Stop and remove containers
cd /srv/demos/projects/<project-name>
docker-compose down

# Remove project directory
cd ..
rm -rf <project-name>

# Remove nginx config (if applicable)
sudo rm /etc/nginx/sites-enabled/<project-name>
sudo systemctl reload nginx
```

---

## Database Commands

### Access PostgreSQL

```bash
# SSH to server
ssh ubuntu@<lightsail-ip>

# Connect to PostgreSQL
docker exec -it postgres psql -U postgres

# Connect to specific database
docker exec -it postgres psql -U postgres -d dispute_tracker
```

---

### Backup Database

```bash
# Backup single database
docker exec postgres pg_dump -U postgres dispute_tracker > backup-$(date +%Y%m%d).sql

# Backup all databases
docker exec postgres pg_dumpall -U postgres > backup-all-$(date +%Y%m%d).sql

# Copy backup to local machine
scp ubuntu@<lightsail-ip>:/home/ubuntu/backup-*.sql ./backups/
```

---

### Restore Database

```bash
# Copy backup to server
scp ./backups/backup-20251227.sql ubuntu@<lightsail-ip>:/home/ubuntu/

# SSH to server
ssh ubuntu@<lightsail-ip>

# Restore database
docker exec -i postgres psql -U postgres dispute_tracker < backup-20251227.sql
```

---

## Monitoring Commands

### Resource Usage

```bash
# Real-time resource monitoring
docker stats

# Disk usage
df -h

# Memory usage
free -h

# Check running processes
top
```

---

### Health Checks

```bash
# Check if project is responding
curl http://localhost:3001/health

# Check nginx status
sudo systemctl status nginx

# Check Docker status
sudo systemctl status docker
```

---

## SSH & Connection

### SSH Setup

```bash
# Add to ~/.ssh/config
cat >> ~/.ssh/config <<EOF
Host sandbox-server
  HostName <lightsail-static-ip>
  User ubuntu
  IdentityFile ~/.ssh/lightsail-sandbox.pem
  StrictHostKeyChecking no
