# AWS Lightsail Deployment Guide

Complete guide for deploying and managing multiple demo projects on AWS Lightsail using Docker.

---

## Table of Contents

1. [Overview](#overview)
2. [Current Server Information](#current-server-information)
3. [Initial Setup](#initial-setup)
4. [Deploying Your First Project](#deploying-your-first-project)
5. [Managing Multiple Demo Projects](#managing-multiple-demo-projects)
6. [VS Code Remote SSH Setup](#vs-code-remote-ssh-setup)
7. [Common Operations](#common-operations)
8. [Troubleshooting](#troubleshooting)
9. [Cost Optimization](#cost-optimization)

---

## Overview

**Purpose:** Host multiple demo projects on a single AWS Lightsail server for client demonstrations and team testing.

**Strategy:**
- Store all demo projects on the server
- Run only 1-2 projects simultaneously
- Switch between projects as needed for different demos
- Manage via VS Code Remote SSH or command line

**Cost:** $5/month (1GB RAM, 1 vCPU, 40GB SSD)

---

## Current Server Information

**Instance Name:** `sandbox-demo-server`
**Current IP Address:** `100.27.44.183`
**Region:** us-east-1 (US East, N. Virginia)
**SSH Key:** `~/.ssh/lightsail-us-east-1.pem`
**SSH User:** `ubuntu`

**⚠️ Important:** The IP address changes every time you stop/start the instance. Always check the current IP after restart:
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.{State:state.name,PublicIP:publicIpAddress}' \
  --output table
```

**Open Ports:**
- 22 (SSH)
- 80 (HTTP)
- 443 (HTTPS)
- 3001 (Dispute Tracker App)

---

## Initial Setup

### Prerequisites

1. **AWS CLI** installed and configured
2. **SSH key** downloaded from AWS Lightsail
3. **Docker Desktop** installed on your Mac M1
4. **VS Code** with Remote-SSH extension

### SSH Key Setup

The SSH key is located at `~/.ssh/lightsail-us-east-1.pem`. Set correct permissions:

```bash
chmod 400 ~/.ssh/lightsail-us-east-1.pem
```

### First-Time Server Access

```bash
# Test SSH connection
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183

# Once connected, verify Docker is installed
docker --version
docker compose version
```

---

## Deploying Your First Project

### Example: Dispute Tracker Deployment

This section uses the dispute-tracker project as an example. Follow the same process for other projects.

### Step 1: Build Docker Image Locally

**Why build locally?** The $5/month Lightsail instance has limited resources (1GB RAM, 1 vCPU) and struggles to build Docker images. Building on your Mac M1 is much faster.

```bash
# Navigate to your project directory
cd /Users/cob/DevAssist/Projects/Dispute-Tracker

# Build for linux/amd64 platform (important for M1 Macs)
docker buildx build --platform linux/amd64 \
  -t cobdocker12/dispute-tracker:latest \
  --build-arg NEXT_PUBLIC_SUPABASE_URL="your-supabase-url" \
  --build-arg NEXT_PUBLIC_SUPABASE_ANON_KEY="your-supabase-key" \
  --load .
```

**Build time:** ~2 minutes on Mac M1 vs 15+ minutes on AWS

### Step 2: Save and Compress Image

```bash
# Save Docker image to compressed tar file
docker save cobdocker12/dispute-tracker:latest | gzip > /tmp/dispute-tracker.tar.gz

# Check file size
ls -lh /tmp/dispute-tracker.tar.gz
# Expected: 50-100MB compressed
```

### Step 3: Upload to AWS Server

```bash
# Upload compressed image
scp -i ~/.ssh/lightsail-us-east-1.pem \
  /tmp/dispute-tracker.tar.gz \
  ubuntu@100.27.44.183:~/dispute-tracker/
```

### Step 4: Load Image on Server

```bash
# SSH into server
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183

# Navigate to project directory
cd ~/dispute-tracker

# Load Docker image
gunzip -c dispute-tracker.tar.gz | docker load

# Verify image is loaded
docker images | grep dispute-tracker
```

### Step 5: Create docker-compose.yml

Create a `docker-compose.yml` file on the server:

```yaml
version: '3.8'

services:
  app:
    image: cobdocker12/dispute-tracker:latest
    container_name: dispute-tracker-app
    restart: unless-stopped
    ports:
      - "3001:3001"
    environment:
      NODE_ENV: production
      PORT: 3001
      # Add other environment variables as needed
```

### Step 6: Start the Application

```bash
# Start container
docker compose up -d app

# Check logs
docker compose logs -f app

# Verify it's running
docker ps
curl http://localhost:3001
```

### Step 7: Open Firewall Port

```bash
# From your local machine (not SSH session)
aws lightsail open-instance-public-ports \
  --instance-name sandbox-demo-server \
  --port-info fromPort=3001,toPort=3001,protocol=TCP
```

### Step 8: Test Access

Open in browser: `http://100.27.44.183:3001`

---

## Managing Multiple Demo Projects

### Project Storage Structure

Recommended directory structure on the server:

```
/home/ubuntu/
├── dispute-tracker/
│   ├── docker-compose.yml
│   ├── dispute-tracker.tar.gz
│   └── .env.local
├── project-2/
│   ├── docker-compose.yml
│   ├── project-2.tar.gz
│   └── .env
└── project-3/
    ├── docker-compose.yml
    ├── project-3.tar.gz
    └── .env
```

### Switching Between Projects

**Stop Current Project:**
```bash
cd ~/dispute-tracker
docker compose down
```

**Start Different Project:**
```bash
cd ~/project-2
docker compose up -d
```

**Check Which Projects Are Running:**
```bash
docker ps
```

### Resource Considerations

**1GB RAM limits:**
- Each Next.js app uses ~200-500MB RAM
- Can comfortably run 1-2 apps simultaneously
- Store 10+ projects, but only run 1-2 at a time

**Storage (40GB):**
- Each project: 50-500MB
- Can store 10-20+ demo projects easily

---

## VS Code Remote SSH Setup

### Step 1: Install Extension

1. Open VS Code
2. Install "Remote - SSH" extension by Microsoft
3. Restart VS Code if needed

### Step 2: Configure SSH

1. Press `Cmd+Shift+P`
2. Type: "Remote-SSH: Open SSH Configuration File..."
3. Select `~/.ssh/config`
4. Add this configuration:

```ssh-config
Host sandbox-demo
    HostName 100.27.44.183
    User ubuntu
    IdentityFile ~/.ssh/lightsail-us-east-1.pem
```

5. Save the file

### Step 3: Connect to Server

1. Press `Cmd+Shift+P`
2. Type: "Remote-SSH: Connect to Host..."
3. Select `sandbox-demo`
4. Select "Linux" when prompted
5. Wait for connection (30-60 seconds first time)

### Step 4: Install Docker Extension on Remote

1. Once connected, open Extensions panel
2. Search for "Docker" by Microsoft
3. Click "Install in SSH: sandbox-demo"
4. Reload VS Code window

### Step 5: Managing Docker via VS Code

**Docker Sidebar:**
- View all containers
- Start/stop containers with clicks
- View logs in real-time
- Access container shell
- Inspect container details

**Terminal Access:**
- Terminal opens directly on server
- No need to SSH manually
- Run docker commands directly

### Updating IP After Server Restart

When you restart the server, the IP changes. Update your SSH config:

1. Get new IP:
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.publicIpAddress' --output text
```

2. Update `~/.ssh/config`:
```ssh-config
Host sandbox-demo
    HostName [NEW_IP_HERE]
    User ubuntu
    IdentityFile ~/.ssh/lightsail-us-east-1.pem
```

3. Remove old host key:
```bash
ssh-keygen -R [OLD_IP]
```

---

## Common Operations

### Starting/Stopping the Server

**Stop Instance (to save costs when not in use):**
```bash
aws lightsail stop-instance --instance-name sandbox-demo-server
```

**Start Instance:**
```bash
aws lightsail start-instance --instance-name sandbox-demo-server
```

**Check Status:**
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.{State:state.name,IP:publicIpAddress}' \
  --output table
```

### Managing Docker Containers

**List Running Containers:**
```bash
docker ps
```

**List All Containers (including stopped):**
```bash
docker ps -a
```

**View Container Logs:**
```bash
docker logs -f dispute-tracker-app
```

**Stop All Containers:**
```bash
docker stop $(docker ps -q)
```

**Remove Stopped Containers:**
```bash
docker container prune -f
```

**Remove Unused Images:**
```bash
docker image prune -a -f
```

### Monitoring Resources

**Check Disk Usage:**
```bash
df -h
```

**Check Memory Usage:**
```bash
free -h
```

**Check Docker Disk Usage:**
```bash
docker system df
```

**Clean Up Docker:**
```bash
docker system prune -a --volumes -f
```

### Opening Additional Ports

```bash
# Open a new port (e.g., 3002 for another app)
aws lightsail open-instance-public-ports \
  --instance-name sandbox-demo-server \
  --port-info fromPort=3002,toPort=3002,protocol=TCP
```

**List Open Ports:**
```bash
aws lightsail get-instance-port-states \
  --instance-name sandbox-demo-server
```

---

## Troubleshooting

### Server Not Responding

**Symptom:** SSH connection times out or hangs

**Solution:**
1. Check server status:
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.state.name' --output text
```

2. If stuck, restart:
```bash
aws lightsail stop-instance --instance-name sandbox-demo-server
# Wait 30-60 seconds
aws lightsail start-instance --instance-name sandbox-demo-server
```

3. Note new IP address after restart

### Docker Build Hangs

**Symptom:** Docker build freezes server or takes 15+ minutes

**Solution:**
- **Never build on the server** with the $5/month plan
- Always build locally on your Mac M1
- Upload pre-built images as compressed tar files

### App Not Accessible from Browser

**Checklist:**
1. Container is running: `docker ps`
2. App is listening: `curl http://localhost:PORT`
3. Port is open in firewall:
```bash
aws lightsail get-instance-port-states \
  --instance-name sandbox-demo-server
```
4. Using correct IP (check if it changed)

### Out of Memory

**Symptom:** Apps crash or server becomes unresponsive

**Solution:**
1. Check running containers: `docker ps`
2. Stop unused containers: `docker stop CONTAINER_NAME`
3. Only run 1-2 apps at a time
4. Consider upgrading to $10/month plan (2GB RAM)

### Out of Disk Space

**Check Usage:**
```bash
df -h
docker system df
```

**Clean Up:**
```bash
# Remove unused Docker resources
docker system prune -a --volumes -f

# Remove old tar files
rm ~/*/*.tar.gz
```

### IP Address Changed

**After every stop/start, the IP changes.**

**Update workflow:**
1. Get new IP:
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.publicIpAddress' --output text
```

2. Update `~/.ssh/config`
3. Update any bookmarks/links
4. Remove old host key: `ssh-keygen -R [OLD_IP]`

**Alternative:** Set up Elastic IP ($0.005/hr when not attached, free when attached)

---

## Cost Optimization

### Current Plan: $5/month

**Good for:**
- 10+ stored projects
- 1-2 running simultaneously
- Occasional demos
- Development/testing

**Limitations:**
- Can't build Docker images on server
- Limited to 1-2 concurrent apps
- IP changes on restart

### When to Upgrade

**Upgrade to $10/month (2GB RAM, 1 vCPU) if:**
- Need to run 3-4 projects simultaneously
- Apps frequently run out of memory
- Want to occasionally build small images on server

**Upgrade to $20/month (4GB RAM, 2 vCPUs) if:**
- Need to run 5-8 projects simultaneously
- Have multiple team members testing concurrently
- Want faster performance for demos

### Saving Costs

**Stop When Not in Use:**
```bash
# Billing stops when instance is stopped
aws lightsail stop-instance --instance-name sandbox-demo-server
```

**Note:** You still pay for storage (minimal) when stopped, but no compute charges.

---

## Quick Reference Commands

### Server Management
```bash
# Get current server IP
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.publicIpAddress' --output text

# SSH into server
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183

# Stop server
aws lightsail stop-instance --instance-name sandbox-demo-server

# Start server
aws lightsail start-instance --instance-name sandbox-demo-server
```

### Docker Operations
```bash
# List running containers
docker ps

# Stop a container
docker stop CONTAINER_NAME

# Start a container
docker start CONTAINER_NAME

# View logs
docker logs -f CONTAINER_NAME

# Clean up
docker system prune -a --volumes -f
```

### Project Deployment
```bash
# 1. Build locally (on Mac)
docker buildx build --platform linux/amd64 -t IMAGE_NAME:latest --load .

# 2. Save and compress
docker save IMAGE_NAME:latest | gzip > /tmp/image.tar.gz

# 3. Upload to server
scp -i ~/.ssh/lightsail-us-east-1.pem /tmp/image.tar.gz ubuntu@IP:~/project/

# 4. Load on server (via SSH)
gunzip -c ~/project/image.tar.gz | docker load

# 5. Run
cd ~/project && docker compose up -d
```

### Port Management
```bash
# Open port
aws lightsail open-instance-public-ports \
  --instance-name sandbox-demo-server \
  --port-info fromPort=PORT,toPort=PORT,protocol=TCP

# List open ports
aws lightsail get-instance-port-states \
  --instance-name sandbox-demo-server
```

---

## Demo Workflow Example

**Scenario:** Manager wants to see Project A demo, then later needs Project B demo.

### Show Project A (Dispute Tracker)
```bash
# SSH into server
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183

# Start Project A
cd ~/dispute-tracker
docker compose up -d

# Share link with manager
# http://100.27.44.183:3001
```

### Switch to Project B
```bash
# Stop Project A
cd ~/dispute-tracker
docker compose down

# Start Project B
cd ~/project-b
docker compose up -d

# Share new link
# http://100.27.44.183:3002
```

**Total switch time:** ~10-15 seconds

---

## Currently Deployed Projects

### 1. Dispute Tracker
- **URL:** http://100.27.44.183:3001
- **Port:** 3001
- **Container:** `dispute-tracker-app`
- **Directory:** `~/dispute-tracker/`
- **Demo Accounts:**
  - guest@demo.com - Submit only
  - manager@demo.com - Manager dashboard
  - payroll@demo.com - Payroll dashboard
  - admin@demo.com - Full access
  - Password (all): Demo123!

---

## Support & Resources

**AWS Lightsail Documentation:**
- https://lightsail.aws.amazon.com/ls/docs/

**VS Code Remote SSH:**
- https://code.visualstudio.com/docs/remote/ssh

**Docker Documentation:**
- https://docs.docker.com/

**AWS CLI Reference:**
- https://docs.aws.amazon.com/cli/latest/reference/lightsail/

---

**Last Updated:** December 27, 2025
**Current Server IP:** 100.27.44.183
**Instance Name:** sandbox-demo-server
