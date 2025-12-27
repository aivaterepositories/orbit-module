# AWS Lightsail Sandbox Setup Guide

Complete step-by-step guide to set up your $5/month sandbox environment for hosting 3 Next.js projects.

## 📋 Prerequisites

- AWS Account with root access
- AWS CLI installed on your local machine
- SSH key pair for server access
- Basic terminal/command line knowledge

## 🚀 Part 1: Create Lightsail Instance

### Option A: Using AWS Console (Recommended for first time)

1. **Go to AWS Lightsail Console**:
   - Navigate to: https://lightsail.aws.amazon.com
   - Select region: `us-east-1` (or your preferred region)

2. **Create Instance**:
   - Click **"Create instance"**
   - Platform: **Linux/Unix**
   - Blueprint: **OS Only** → **Ubuntu 22.04 LTS**

3. **Configure Instance**:
   - **SSH Key Pair**:
     - Select **"Create new"** or use existing
     - Download the key pair (e.g., `LightsailDefaultKey-us-east-1.pem`)
     - Save it securely: `~/.ssh/lightsail-sandbox.pem`
   - **Instance Plan**: **$5/month** (1GB RAM, 1 vCPU, 40GB SSD, 2TB transfer)
   - **Instance Name**: `sandbox-demo-server`

4. **Create Instance**:
   - Click **"Create instance"**
   - Wait 2-3 minutes for instance to start

5. **Configure Firewall**:
   - Click on your instance → **Networking** tab
   - Verify these ports are open:
     - SSH (22)
     - HTTP (80)
     - HTTPS (443)

6. **Get Static IP** (Recommended):
   - Go to **Networking** tab
   - Click **"Create static IP"**
   - Attach to your instance
   - Name it: `sandbox-static-ip`
   - Note: Static IPs are FREE while attached to a running instance

### Option B: Using AWS CLI

```bash
# Create instance
aws lightsail create-instances \
    --instance-names sandbox-demo-server \
    --availability-zone us-east-1a \
    --blueprint-id ubuntu_22_04 \
    --bundle-id nano_2_0 \
    --region us-east-1

# Create and attach static IP
aws lightsail allocate-static-ip \
    --static-ip-name sandbox-static-ip \
    --region us-east-1

aws lightsail attach-static-ip \
    --static-ip-name sandbox-static-ip \
    --instance-name sandbox-demo-server \
    --region us-east-1
```

## 🔧 Part 2: Initial Server Setup

### 1. Configure SSH Access

```bash
# Set correct permissions on your key file
chmod 400 ~/.ssh/lightsail-sandbox.pem

# Add to SSH config for easier access
cat >> ~/.ssh/config << EOF

Host sandbox
    HostName YOUR_LIGHTSAIL_IP
    User ubuntu
    IdentityFile ~/.ssh/lightsail-sandbox.pem
EOF

# Test SSH connection
ssh ubuntu@YOUR_LIGHTSAIL_IP
# Or using config:
ssh sandbox
```

### 2. Run Server Setup Script

**Option A: Upload and run script**:

```bash
# On your local machine, upload the setup script
scp /Users/cob/Aivax/Brain2/sandbox-project/scripts/setup-server.sh ubuntu@YOUR_LIGHTSAIL_IP:~/

# SSH into server
ssh ubuntu@YOUR_LIGHTSAIL_IP

# Run setup script
chmod +x setup-server.sh
./setup-server.sh
```

**Option B: Run directly via curl**:

```bash
# SSH into server
ssh ubuntu@YOUR_LIGHTSAIL_IP

# Download and run (if script is hosted on GitHub)
curl -fsSL https://raw.githubusercontent.com/YOUR_REPO/main/scripts/setup-server.sh | bash
```

**Manual setup** (if script doesn't work):

```bash
# Update system
sudo apt-get update && sudo apt-get upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu

# Install Docker Compose
sudo apt-get install docker-compose-plugin

# Logout and login for group changes
exit
ssh ubuntu@YOUR_LIGHTSAIL_IP

# Verify installation
docker --version
docker compose version
```

### 3. Upload Infrastructure Files

From your local machine:

```bash
# Navigate to sandbox project
cd /Users/cob/Aivax/Brain2/sandbox-project

# Upload infrastructure files
scp -r infrastructure ubuntu@YOUR_LIGHTSAIL_IP:~/sandbox-project/

# Or use rsync for faster transfer
rsync -avz --exclude 'node_modules' --exclude '.git' \
    infrastructure/ ubuntu@YOUR_LIGHTSAIL_IP:~/sandbox-project/infrastructure/
```

## 🗄️ Part 3: Database Setup

SSH into your server and configure PostgreSQL:

```bash
ssh ubuntu@YOUR_LIGHTSAIL_IP

# Navigate to infrastructure directory
cd ~/sandbox-project/infrastructure

# Create .env file from template
cp env.example .env

# Edit environment variables
nano .env
```

**Edit `.env` file**:

```bash
# Generate a secure password
POSTGRES_PASSWORD=$(openssl rand -base64 32)

# Set your Lightsail IP
BASE_URL=http://YOUR_LIGHTSAIL_IP

# Add project-specific variables
DISPUTE_TRACKER_DATABASE_URL=postgresql://postgres:YOUR_PASSWORD@postgres:5432/dispute_tracker
```

**Start PostgreSQL**:

```bash
# Start only PostgreSQL first
docker compose up -d postgres

# Wait for it to be healthy
docker compose ps

# Verify it's running
docker logs postgres

# Create databases for each project
docker exec -it postgres psql -U postgres -c "CREATE DATABASE dispute_tracker;"
docker exec -it postgres psql -U postgres -c "CREATE DATABASE project_2;"
docker exec -it postgres psql -U postgres -c "CREATE DATABASE project_3;"

# Verify databases
docker exec -it postgres psql -U postgres -c "\l"
```

## 📦 Part 4: Deploy Projects

### Prepare Dispute Tracker for Deployment

**On your local machine**:

```bash
# Navigate to dispute tracker
cd /Users/cob/DevAssist/Projects/Dispute-Tracker

# Create Dockerfile (if not exists)
cat > Dockerfile << 'EOF'
FROM node:20-alpine AS base

# Dependencies
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package*.json ./
RUN npm ci

# Builder
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED 1
RUN npm run build

# Runner
FROM base AS runner
WORKDIR /app
ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

USER nextjs
EXPOSE 3001
ENV PORT 3001
CMD ["node", "server.js"]
EOF

# Update next.config.js for standalone build
# Add this to your next.config.js:
# output: 'standalone',

# Create .dockerignore
cat > .dockerignore << 'EOF'
node_modules
.next
.git
*.log
.env.local
README.md
EOF
```

**Upload project to server**:

```bash
# From local machine
rsync -avz --exclude 'node_modules' --exclude '.next' --exclude '.git' \
    /Users/cob/DevAssist/Projects/Dispute-Tracker/ \
    ubuntu@YOUR_LIGHTSAIL_IP:~/sandbox-project/projects/dispute-tracker/
```

**Deploy on server**:

```bash
# SSH to server
ssh ubuntu@YOUR_LIGHTSAIL_IP

# Navigate to infrastructure
cd ~/sandbox-project/infrastructure

# Build and start all services
docker compose up -d

# Check status
docker compose ps

# View logs
docker compose logs -f
```

## 🌐 Part 5: Configure Nginx & Access

### Test Access

```bash
# Get your server IP
curl ifconfig.me

# Or from AWS console
aws lightsail get-instance \
    --instance-name sandbox-demo-server \
    --region us-east-1 \
    --query 'instance.publicIpAddress' \
    --output text
```

Open in browser:
- **Landing page**: `http://YOUR_LIGHTSAIL_IP/`
- **Dispute Tracker**: `http://YOUR_LIGHTSAIL_IP/dispute-tracker`

### Optional: Configure Custom Domain

If you have a domain (e.g., `sandbox.yourdomain.com`):

1. **Add DNS A Record**:
   - Point `sandbox.yourdomain.com` to your Lightsail static IP

2. **Update Nginx config**:
   ```bash
   ssh ubuntu@YOUR_LIGHTSAIL_IP
   nano ~/sandbox-project/infrastructure/nginx.conf

   # Change server_name from _ to your domain
   server_name sandbox.yourdomain.com;
   ```

3. **Install SSL Certificate** (Free with Let's Encrypt):
   ```bash
   # Install certbot
   sudo apt-get install certbot python3-certbot-nginx

   # Get certificate
   sudo certbot --nginx -d sandbox.yourdomain.com

   # Auto-renewal is configured automatically
   ```

## 🔒 Part 6: Security Hardening

### 1. Configure Firewall Rules

```bash
# Should already be done by setup script, verify:
sudo ufw status

# Should show:
# 22/tcp ALLOW
# 80/tcp ALLOW
# 443/tcp ALLOW
```

### 2. Set Up Automated Backups

```bash
# Create backup script
cat > ~/backup-databases.sh << 'EOF'
#!/bin/bash
DATE=$(date +%Y%m%d_%H%M%S)
docker exec postgres pg_dumpall -U postgres > ~/backups/backup_${DATE}.sql
# Keep only last 7 backups
find ~/backups -name "backup_*.sql" -mtime +7 -delete
EOF

chmod +x ~/backup-databases.sh

# Add to crontab (daily at 2 AM)
(crontab -l 2>/dev/null; echo "0 2 * * * ~/backup-databases.sh") | crontab -
```

### 3. Configure Monitoring

```bash
# Install monitoring tools
sudo apt-get install -y prometheus-node-exporter

# Check resource usage
docker stats
htop
df -h
```

## 💰 Part 7: Cost Management

### Stop Instance When Not Needed

```bash
# From your local machine with AWS CLI
./scripts/manage-instance.sh stop

# Or via AWS Console:
# Lightsail → Instances → ••• → Stop
```

### Create Snapshot for Long-term Storage

```bash
# Create snapshot
./scripts/manage-instance.sh snapshot

# Delete instance (keeps snapshot)
aws lightsail delete-instance \
    --instance-name sandbox-demo-server \
    --region us-east-1

# Cost: ~$0.05/month for snapshot storage
# vs $5/month for running instance
```

### Restore from Snapshot

```bash
# Create instance from snapshot
aws lightsail create-instances-from-snapshot \
    --instance-names sandbox-demo-server \
    --instance-snapshot-name YOUR_SNAPSHOT_NAME \
    --availability-zone us-east-1a \
    --bundle-id nano_2_0
```

## ✅ Verification Checklist

- [ ] Lightsail instance created and running
- [ ] Static IP attached
- [ ] SSH access configured
- [ ] Docker and Docker Compose installed
- [ ] PostgreSQL container running
- [ ] Nginx reverse proxy configured
- [ ] Dispute Tracker deployed and accessible
- [ ] Firewall configured (UFW)
- [ ] Automated backups set up
- [ ] Monitoring tools installed

## 🐛 Troubleshooting

See [`troubleshooting.md`](./troubleshooting.md) for common issues and solutions.

## 📚 Next Steps

1. Deploy additional projects (project-2, project-3)
2. Configure custom domain and SSL
3. Set up monitoring and alerts
4. Configure automated deployments (CI/CD)
5. Plan migration to production infrastructure

## 📞 Resources

- [AWS Lightsail Documentation](https://docs.aws.amazon.com/lightsail/)
- [Docker Documentation](https://docs.docker.com/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
