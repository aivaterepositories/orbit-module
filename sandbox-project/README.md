# AWS Sandbox Project

Cost-efficient AWS Lightsail sandbox environment for hosting multiple demo projects.

## 🎯 New to This Project?

**Start here:** [`AWS-QUICK-START.md`](./AWS-QUICK-START.md) - Essential commands and quick reference

**Full guide:** [`docs/aws-lightsail-guide.md`](./docs/aws-lightsail-guide.md) - Complete deployment and management guide

---

## 💰 Cost Breakdown

- **AWS Lightsail**: $5/month (1GB RAM, 1 vCPU, 40GB SSD, 2TB transfer)
- **Total Monthly Cost**: ~$5-7/month
- **Cost When Off**: $0 (can snapshot and delete instance)

## 🏗️ Architecture

```
┌─────────────────────────────────────────────┐
│   AWS Lightsail Instance ($5/month)         │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  Nginx Reverse Proxy                │   │
│  │  (Port 80/443)                      │   │
│  └──────┬──────────┬──────────┬────────┘   │
│         │          │          │            │
│  ┌──────▼───┐ ┌───▼────┐ ┌───▼──────┐     │
│  │ Project 1│ │Project │ │ Project  │     │
│  │ :3001    │ │2:3002  │ │ 3:3003   │     │
│  └──────────┘ └────────┘ └──────────┘     │
│                                             │
│  ┌─────────────────────────────────────┐   │
│  │  PostgreSQL (Docker)                │   │
│  │  Port: 5432                         │   │
│  │  Storage: /var/lib/postgresql/data  │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

## 📁 Directory Structure

```
sandbox-project/
├── README.md                    # This file
├── AWS-QUICK-START.md          # ⚡ Quick reference for AWS operations
├── docs/                        # Documentation
│   ├── aws-lightsail-guide.md # 📘 Complete AWS Lightsail guide
│   ├── setup-guide.md          # Complete setup instructions
│   ├── deployment-guide.md     # How to deploy projects
│   └── troubleshooting.md      # Common issues
├── infrastructure/              # Infrastructure files
│   ├── docker-compose.yml      # PostgreSQL + services
│   ├── nginx.conf              # Nginx configuration
│   └── env.example             # Environment template
├── scripts/                     # Automation scripts
│   ├── setup-server.sh         # Initial server setup
│   ├── deploy-project.sh       # Deploy a project
│   ├── backup-db.sh            # Database backup
│   └── manage-instance.sh      # Start/Stop Lightsail
└── projects/                    # Project-specific configs
    ├── dispute-tracker/
    ├── project-2/
    └── project-3/
```

## 🚀 Quick Start

### 1. Create AWS Lightsail Instance

```bash
# Run the setup script (creates instance via AWS CLI)
./scripts/setup-lightsail.sh

# Or manually in AWS Console:
# - Go to Lightsail Console
# - Create Instance → OS Only → Ubuntu 22.04
# - Plan: $5/month (1 GB RAM, 1 vCPU, 40 GB SSD)
# - Name: sandbox-demo-server
```

### 2. Setup Server

```bash
# SSH into the instance
ssh ubuntu@<your-lightsail-ip>

# Download and run setup script
curl -O https://raw.githubusercontent.com/.../setup-server.sh
chmod +x setup-server.sh
./setup-server.sh
```

### 3. Deploy Projects

```bash
# Deploy dispute-tracker
./scripts/deploy-project.sh dispute-tracker

# Deploy other projects
./scripts/deploy-project.sh project-2
./scripts/deploy-project.sh project-3
```

### 4. Access Projects

- **Project 1**: http://sandbox-demo.yourdomain.com/dispute-tracker
- **Project 2**: http://sandbox-demo.yourdomain.com/project-2
- **Project 3**: http://sandbox-demo.yourdomain.com/project-3

## 🛠️ Management Commands

### Start/Stop Instance (Save Costs)

```bash
# Stop instance when not needed (no hourly charges)
./scripts/manage-instance.sh stop

# Start instance for demos
./scripts/manage-instance.sh start

# Check status
./scripts/manage-instance.sh status
```

### Database Management

```bash
# Backup database
./scripts/backup-db.sh

# Restore from backup
./scripts/restore-db.sh backup-2025-01-15.sql

# Access PostgreSQL
docker exec -it postgres psql -U postgres
```

### Project Management

```bash
# View logs
docker logs dispute-tracker
docker logs project-2

# Restart a project
docker restart dispute-tracker

# Update a project
./scripts/deploy-project.sh dispute-tracker --update
```

## 📊 Monitoring

```bash
# Check resource usage
docker stats

# Check disk space
df -h

# Check running containers
docker ps

# View all logs
docker-compose logs -f
```

## 💡 Cost Optimization Tips

1. **Stop When Not in Use**: Stop the instance outside demo hours ($0/hour when stopped)
2. **Snapshot Before Stopping**: Create snapshot, delete instance, restore when needed
3. **Monitor Transfer**: Lightsail includes 2TB/month transfer (plenty for demos)
4. **Use Static IP**: Free while instance is running (prevents IP changes)

## 🔐 Security

- SSH key-based authentication only (no passwords)
- Firewall configured (ports 80, 443, 22 only)
- PostgreSQL not exposed to public (internal Docker network)
- Nginx rate limiting enabled
- SSL/TLS via Let's Encrypt (optional)

## 📈 Scaling Path

When ready for production:

1. **Database**: Migrate to RDS PostgreSQL (managed, automated backups)
2. **Server**: Move to EC2 t4g.small or larger (more RAM/CPU)
3. **Load Balancer**: Add ALB for better traffic management
4. **CDN**: Add CloudFront for static assets
5. **Monitoring**: Add CloudWatch alarms and logging

## 🐛 Troubleshooting

See `docs/troubleshooting.md` for common issues and solutions.

## 📞 Support

- **AWS Lightsail Docs**: https://lightsail.aws.amazon.com/ls/docs
- **Docker Docs**: https://docs.docker.com
- **Nginx Docs**: https://nginx.org/en/docs

## 🎉 Currently Deployed

### Dispute Tracker
- **Status:** ✅ Live
- **URL:** http://100.27.44.183:3001
- **Server IP:** 100.27.44.183 (changes after restart)
- **Container:** dispute-tracker-app
- **Port:** 3001

**Demo Accounts:**
| Email | Access Level | Password |
|-------|-------------|----------|
| guest@demo.com | Submit only | Demo123! |
| manager@demo.com | Manager dashboard | Demo123! |
| payroll@demo.com | Payroll dashboard | Demo123! |
| admin@demo.com | Full access | Demo123! |

## 📝 Next Steps

1. Read [`AWS-QUICK-START.md`](./AWS-QUICK-START.md) for quick reference
2. Read [`docs/aws-lightsail-guide.md`](./docs/aws-lightsail-guide.md) for complete guide
3. Deploy additional projects following the same process
4. Set up VS Code Remote SSH for easier management
