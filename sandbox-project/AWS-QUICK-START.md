# AWS Lightsail Demo Server - Quick Start

**Server IP:** `100.27.44.183` (changes after restart!)
**Instance:** `sandbox-demo-server`
**SSH Key:** `~/.ssh/lightsail-us-east-1.pem`

---

## ⚡ Quick Commands

### Connect to Server
```bash
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183
```

### Get Current IP Address
```bash
aws lightsail get-instance --instance-name sandbox-demo-server \
  --query 'instance.publicIpAddress' --output text
```

### Stop/Start Server
```bash
# Stop (saves money when not in use)
aws lightsail stop-instance --instance-name sandbox-demo-server

# Start
aws lightsail start-instance --instance-name sandbox-demo-server
```

---

## 🚀 Deploy New Project (5 Steps)

### 1. Build on Mac M1
```bash
cd /path/to/your/project
docker buildx build --platform linux/amd64 -t projectname:latest --load .
```

### 2. Save & Compress
```bash
docker save projectname:latest | gzip > /tmp/projectname.tar.gz
```

### 3. Upload to Server
```bash
scp -i ~/.ssh/lightsail-us-east-1.pem /tmp/projectname.tar.gz ubuntu@100.27.44.183:~/
```

### 4. Load on Server (via SSH)
```bash
ssh -i ~/.ssh/lightsail-us-east-1.pem ubuntu@100.27.44.183
cd ~/projectname
gunzip -c ~/projectname.tar.gz | docker load
```

### 5. Run with Docker Compose
```bash
# Create docker-compose.yml first, then:
docker compose up -d
```

### 6. Open Port (if needed)
```bash
# From local machine
aws lightsail open-instance-public-ports \
  --instance-name sandbox-demo-server \
  --port-info fromPort=3001,toPort=3001,protocol=TCP
```

---

## 🔄 Switch Between Demos

### Stop Current Demo
```bash
cd ~/current-project
docker compose down
```

### Start Different Demo
```bash
cd ~/other-project
docker compose up -d
```

---

## 📊 Check Status

### Running Containers
```bash
docker ps
```

### Container Logs
```bash
docker logs -f container-name
```

### Resource Usage
```bash
# Disk space
df -h

# Memory
free -h

# Docker usage
docker system df
```

---

## 🧹 Clean Up

### Remove Stopped Containers
```bash
docker container prune -f
```

### Remove Unused Images
```bash
docker image prune -a -f
```

### Full Clean Up
```bash
docker system prune -a --volumes -f
```

---

## 📱 VS Code Remote SSH

### Update IP in Config
```bash
# Edit ~/.ssh/config
Host sandbox-demo
    HostName 100.27.44.183  # ← Update this after restart
    User ubuntu
    IdentityFile ~/.ssh/lightsail-us-east-1.pem
```

### Connect
1. `Cmd+Shift+P`
2. "Remote-SSH: Connect to Host..."
3. Select `sandbox-demo`

---

## 🎯 Currently Deployed

### Dispute Tracker
- **URL:** http://100.27.44.183:3001
- **Container:** `dispute-tracker-app`
- **Directory:** `~/dispute-tracker/`

**Demo Accounts:**
| Email | Access | Password |
|-------|--------|----------|
| guest@demo.com | Submit only | Demo123! |
| manager@demo.com | Manager dashboard | Demo123! |
| payroll@demo.com | Payroll dashboard | Demo123! |
| admin@demo.com | Full access | Demo123! |

---

## ⚠️ Important Notes

1. **IP changes after every restart** - Always check current IP
2. **Build locally, not on server** - Server is too slow
3. **Run only 1-2 apps simultaneously** - 1GB RAM limit
4. **Stop server when not in use** - Saves money

---

## 🆘 Troubleshooting

### Server Not Responding?
```bash
# Restart it
aws lightsail stop-instance --instance-name sandbox-demo-server
# Wait 60 seconds
aws lightsail start-instance --instance-name sandbox-demo-server
```

### Can't Access App in Browser?
1. Check container running: `docker ps`
2. Check port open:
```bash
aws lightsail get-instance-port-states --instance-name sandbox-demo-server
```
3. Test locally on server: `curl http://localhost:3001`

### Out of Space?
```bash
docker system prune -a --volumes -f
rm ~/*/*.tar.gz  # Remove uploaded tar files
```

---

## 📚 Full Documentation

See: `/Users/cob/Aivax/Brain2/sandbox-project/docs/aws-lightsail-guide.md`

---

**Last Updated:** December 27, 2025
