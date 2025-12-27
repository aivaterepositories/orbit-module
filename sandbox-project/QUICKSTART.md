# 🚀 Quick Start Guide

Get your sandbox server up and running in 15 minutes!

## ⚡ Super Fast Setup (3 Commands)

If you have AWS CLI configured:

```bash
# 1. Create Lightsail instance ($5/month)
cd /Users/cob/Aivax/Brain2/sandbox-project
./scripts/create-instance.sh

# 2. SSH to server (wait 2 min for boot)
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP

# 3. Setup server (run on server)
bash <(curl -fsSL https://raw.githubusercontent.com/.../setup-server.sh)
# OR upload and run local script:
# ./setup-server.sh
```

## 📋 Step-by-Step (First Time)

### 1️⃣ Install AWS CLI (if not installed)

**macOS**:
```bash
brew install awscli
```

**Linux**:
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

**Verify**:
```bash
aws --version
```

### 2️⃣ Configure AWS Credentials

```bash
aws configure
```

Enter:
- **AWS Access Key ID**: (from IAM console)
- **AWS Secret Access Key**: (from IAM console)
- **Default region**: `us-east-1`
- **Default output format**: `json`

### 3️⃣ Create Lightsail Instance

```bash
cd /Users/cob/Aivax/Brain2/sandbox-project

# Run creation script
./scripts/create-instance.sh

# Note the Static IP shown at the end!
# Example: 54.123.45.67
```

### 4️⃣ Setup Server

**Wait 2-3 minutes** for instance to boot, then:

```bash
# SSH to server (replace IP)
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP

# Upload setup script (from local machine)
scp -i ~/.ssh/lightsail-us-east-1.pem \
    scripts/setup-server.sh \
    ubuntu@YOUR_STATIC_IP:~/

# Run setup (on server)
chmod +x setup-server.sh
./setup-server.sh

# Logout and login again for Docker group
exit
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP
```

### 5️⃣ Deploy Infrastructure

**Upload infrastructure files** (from local machine):

```bash
cd /Users/cob/Aivax/Brain2/sandbox-project

rsync -avz -e "ssh -i ~/.ssh/lightsail-us-east-1.pem" \
    infrastructure/ \
    ubuntu@YOUR_STATIC_IP:~/sandbox-project/infrastructure/
```

**Configure environment** (on server):

```bash
cd ~/sandbox-project/infrastructure

# Create .env from template
cp env.example .env

# Edit configuration
nano .env

# Required changes:
# 1. Set POSTGRES_PASSWORD (use: openssl rand -base64 32)
# 2. Set BASE_URL=http://YOUR_STATIC_IP
```

**Start services**:

```bash
# Start PostgreSQL and Nginx
docker compose up -d postgres nginx

# Check status
docker compose ps

# View logs
docker compose logs -f
```

### 6️⃣ Deploy Dispute Tracker

**Prepare project** (on local machine):

```bash
cd /Users/cob/DevAssist/Projects/Dispute-Tracker

# Add to next.config.js:
# output: 'standalone',

# Build to verify
npm run build
```

**Upload to server**:

```bash
rsync -avz -e "ssh -i ~/.ssh/lightsail-us-east-1.pem" \
    --exclude 'node_modules' \
    --exclude '.next' \
    --exclude '.git' \
    /Users/cob/DevAssist/Projects/Dispute-Tracker/ \
    ubuntu@YOUR_STATIC_IP:~/sandbox-project/projects/dispute-tracker/
```

**Deploy** (on server):

```bash
cd ~/sandbox-project/infrastructure

# Create database
docker exec -it postgres psql -U postgres -c "CREATE DATABASE dispute_tracker;"

# Build and start
docker compose build dispute-tracker
docker compose up -d dispute-tracker

# Check logs
docker compose logs -f dispute-tracker
```

### 7️⃣ Access Your App! 🎉

Open in browser:
```
http://YOUR_STATIC_IP/dispute-tracker
```

## 🎯 What You Get

- ✅ PostgreSQL database (shared by all projects)
- ✅ Nginx reverse proxy (handles routing)
- ✅ Dispute Tracker deployed and accessible
- ✅ Ready to add 2 more projects
- ✅ Automatic SSL support (add domain later)
- ✅ Costs ~$5/month when running

## 🛠️ Common Tasks

### View All Services

```bash
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP
docker compose ps
```

### Check Logs

```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f dispute-tracker
docker compose logs -f nginx
docker compose logs -f postgres
```

### Restart a Service

```bash
docker compose restart dispute-tracker
docker compose restart nginx
```

### Stop Everything (Save Money)

**From local machine**:

```bash
cd /Users/cob/Aivax/Brain2/sandbox-project
./scripts/manage-instance.sh stop

# Cost when stopped: $0/hour
# Only pay for snapshot storage: ~$0.05/month
```

### Start Again

```bash
./scripts/manage-instance.sh start

# Wait 2-3 minutes, then access your apps
```

## 📊 Monitoring

```bash
# SSH to server
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP

# Resource usage
docker stats              # Real-time container stats
htop                      # CPU/Memory overview
df -h                     # Disk space
free -h                   # Memory usage
```

## 🚨 Troubleshooting

### Can't Connect to Server

```bash
# Check instance status
./scripts/manage-instance.sh status

# Instance should be "running"
# Wait 2-3 minutes after starting
```

### Website Not Loading

```bash
# SSH to server
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP

# Check containers are running
docker compose ps

# Check nginx logs
docker compose logs nginx

# Check project logs
docker compose logs dispute-tracker

# Verify ports are open
sudo ufw status
```

### Docker Permission Denied

```bash
# Make sure you logged out and back in after setup
exit
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_STATIC_IP

# Or add yourself to docker group again
sudo usermod -aG docker ubuntu
exit
ssh ...
```

### Database Connection Error

```bash
# Check postgres is running
docker compose ps postgres

# Check .env file has correct password
cat ~/sandbox-project/infrastructure/.env | grep POSTGRES_PASSWORD

# Test connection
docker exec -it postgres psql -U postgres
```

## 📚 Full Documentation

Detailed guides available:

- **[Setup Guide](docs/setup-guide.md)** - Complete server setup
- **[Deployment Guide](docs/deployment-guide.md)** - Deploy projects
- **[Troubleshooting](docs/troubleshooting.md)** - Common issues
- **[Main README](README.md)** - Architecture & overview

## 💰 Cost Calculator

| Component | Cost |
|-----------|------|
| Lightsail $5/month plan | $5.00/month |
| Static IP (while running) | $0.00 |
| Data transfer (2TB included) | $0.00 |
| **Total (running)** | **$5.00/month** |
| **Total (stopped w/ snapshot)** | **~$0.05/month** |

## 🎉 Next Steps

Once your sandbox is running:

1. ✅ **Test Dispute Tracker** - Create disputes, test workflow
2. 📱 **Add Project 2** - Follow [deployment guide](docs/deployment-guide.md)
3. 📱 **Add Project 3** - Same process
4. 🌐 **Add Custom Domain** - Point DNS to static IP
5. 🔒 **Enable HTTPS** - Free SSL with Let's Encrypt
6. 📊 **Set Up Monitoring** - Track uptime and performance
7. 🔄 **Automate Deployments** - GitHub Actions CI/CD

## 🆘 Need Help?

- **Quick issues**: Check [troubleshooting guide](docs/troubleshooting.md)
- **AWS Lightsail**: https://lightsail.aws.amazon.com/ls/docs
- **Docker help**: https://docs.docker.com

## ✨ Pro Tips

1. **Save the SSH config** to `~/.ssh/config`:
   ```
   Host sandbox
       HostName YOUR_STATIC_IP
       User ubuntu
       IdentityFile ~/.ssh/lightsail-us-east-1.pem
   ```
   Then just: `ssh sandbox`

2. **Create aliases** in `~/.zshrc` or `~/.bashrc`:
   ```bash
   alias sandbox-ssh='ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@YOUR_IP'
   alias sandbox-start='cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/manage-instance.sh start'
   alias sandbox-stop='cd /Users/cob/Aivax/Brain2/sandbox-project && ./scripts/manage-instance.sh stop'
   ```

3. **Regular backups**: Set up daily snapshots
   ```bash
   ./scripts/manage-instance.sh snapshot
   ```

4. **Monitor costs**: Check AWS Billing Dashboard monthly

Happy deploying! 🚀
