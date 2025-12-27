# Quick Deployment Guide

Fast-track guide for deploying projects to your AWS Lightsail sandbox.

## 🎯 Prerequisites

- Lightsail instance running and configured
- SSH access to server
- Docker & Docker Compose installed on server
- Project code ready locally

## 🚀 Deploy New Project (5 Minutes)

### 1. Prepare Project Locally

```bash
# Navigate to your project
cd /path/to/your/project

# Create Dockerfile
cat > Dockerfile << 'EOF'
FROM node:20-alpine AS base

FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED 1

# For Next.js 13+, add to next.config.js: output: 'standalone'
RUN npm run build

FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

USER nextjs
EXPOSE 3001
ENV PORT=3001
CMD ["node", "server.js"]
EOF

# Create .dockerignore
cat > .dockerignore << 'EOF'
node_modules
.next
.git
*.log
.env.local
EOF
```

### 2. Upload to Server

```bash
# Get your server IP
LIGHTSAIL_IP="YOUR_IP_HERE"

# Upload project (choose one method)

# Method A: SCP (simple)
scp -r . ubuntu@$LIGHTSAIL_IP:~/sandbox-project/projects/my-project/

# Method B: Rsync (faster, recommended)
rsync -avz --exclude 'node_modules' --exclude '.next' --exclude '.git' \
    . ubuntu@$LIGHTSAIL_IP:~/sandbox-project/projects/my-project/

# Method C: Git (if project is in repo)
ssh ubuntu@$LIGHTSAIL_IP
cd ~/sandbox-project/projects
git clone https://github.com/yourname/my-project.git
```

### 3. Add to Docker Compose

SSH to server and edit docker-compose.yml:

```bash
ssh ubuntu@$LIGHTSAIL_IP
cd ~/sandbox-project/infrastructure
nano docker-compose.yml
```

Add your project service (uncomment and modify template):

```yaml
  my-project:
    build:
      context: ../projects/my-project
      dockerfile: Dockerfile
    container_name: my-project
    restart: unless-stopped
    environment:
      NODE_ENV: production
      PORT: 3002
      DATABASE_URL: postgresql://postgres:${POSTGRES_PASSWORD}@postgres:5432/my_project
      NEXT_PUBLIC_API_URL: ${BASE_URL}/my-project
    depends_on:
      postgres:
        condition: service_healthy
    networks:
      - sandbox_network
```

### 4. Update Nginx Configuration

```bash
nano nginx.conf
```

Add location block for your project:

```nginx
# My Project - Project 2
location /my-project {
    limit_req zone=general burst=20 nodelay;

    rewrite ^/my-project(/.*)$ $1 break;
    rewrite ^/my-project$ / break;

    proxy_pass http://my_project:3002;  # Match your service name:port
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_cache_bypass $http_upgrade;
    proxy_buffering off;
    proxy_redirect off;
}

# Static assets for my-project
location ~* ^/my-project/(_next/static|favicon\.ico|images) {
    proxy_pass http://my_project:3002;
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```

Don't forget to add upstream at the top:

```nginx
upstream my_project {
    server my-project:3002;
    keepalive 32;
}
```

### 5. Create Database

```bash
# Create database for your project
docker exec -it postgres psql -U postgres -c "CREATE DATABASE my_project;"

# Verify
docker exec -it postgres psql -U postgres -c "\l"
```

### 6. Build and Deploy

```bash
cd ~/sandbox-project/infrastructure

# Build your project
docker compose build my-project

# Start the service
docker compose up -d my-project

# Restart nginx to apply config changes
docker compose restart nginx

# Check status
docker compose ps

# View logs
docker compose logs -f my-project
```

### 7. Test Access

Open in browser:
- `http://YOUR_LIGHTSAIL_IP/my-project`

Check logs if not working:
```bash
docker logs my-project
docker logs nginx
```

## 🔄 Update Existing Project

### Quick Update (Code Changes Only)

```bash
# 1. Upload new code
rsync -avz --exclude 'node_modules' --exclude '.next' \
    /local/path/to/project/ \
    ubuntu@$LIGHTSAIL_IP:~/sandbox-project/projects/my-project/

# 2. SSH to server
ssh ubuntu@$LIGHTSAIL_IP
cd ~/sandbox-project/infrastructure

# 3. Rebuild and restart
docker compose build my-project
docker compose up -d my-project

# 4. Check logs
docker compose logs -f my-project
```

### Full Rebuild (Dependencies Changed)

```bash
ssh ubuntu@$LIGHTSAIL_IP
cd ~/sandbox-project/infrastructure

# Stop and remove container
docker compose down my-project

# Rebuild with no cache
docker compose build --no-cache my-project

# Start fresh
docker compose up -d my-project
```

## 📊 Monitor Deployment

### Check Container Status

```bash
# List all containers
docker compose ps

# Detailed stats (CPU, Memory)
docker stats

# Resource usage
df -h          # Disk space
free -h        # Memory
top            # CPU
```

### View Logs

```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f my-project

# Last 100 lines
docker compose logs --tail 100 my-project

# Since last 5 minutes
docker compose logs --since 5m my-project
```

### Test Endpoints

```bash
# Test from server
curl http://localhost/my-project

# Test specific routes
curl http://localhost/my-project/api/health

# Check response headers
curl -I http://localhost/my-project
```

## 🐛 Common Issues

### Container Won't Start

```bash
# Check logs for errors
docker logs my-project

# Common issues:
# - Port already in use: Change PORT in docker-compose.yml
# - Database connection: Verify DATABASE_URL
# - Missing dependencies: Rebuild with --no-cache
```

### 404 Not Found

```bash
# Verify nginx config
docker exec -it nginx nginx -t

# Check upstream is defined
docker exec -it nginx cat /etc/nginx/nginx.conf | grep my_project

# Restart nginx
docker compose restart nginx
```

### Database Connection Errors

```bash
# Check postgres is running
docker compose ps postgres

# Test connection from container
docker exec -it my-project sh
# Inside container:
apk add postgresql-client
psql postgresql://postgres:PASSWORD@postgres:5432/my_project
```

### Out of Memory

```bash
# Check memory usage
free -h
docker stats

# Solutions:
# 1. Restart services to free memory
docker compose restart

# 2. Reduce number of running projects
docker compose stop unused-project

# 3. Upgrade Lightsail plan ($5 → $10 for 2GB RAM)
```

## 🎨 Customize Deployment

### Environment Variables

Edit `.env` file:

```bash
nano ~/sandbox-project/infrastructure/.env
```

Add project-specific variables:

```bash
MY_PROJECT_API_KEY=your_key_here
MY_PROJECT_SECRET=your_secret_here
```

Reference in docker-compose.yml:

```yaml
environment:
  API_KEY: ${MY_PROJECT_API_KEY}
  SECRET: ${MY_PROJECT_SECRET}
```

### Custom Build Args

```yaml
my-project:
  build:
    context: ../projects/my-project
    dockerfile: Dockerfile
    args:
      - NODE_ENV=production
      - BUILD_VERSION=1.0.0
```

### Health Checks

Add health check to your service:

```yaml
my-project:
  # ... other config
  healthcheck:
    test: ["CMD", "wget", "--spider", "-q", "http://localhost:3002/api/health"]
    interval: 30s
    timeout: 10s
    retries: 3
    start_period: 40s
```

## 📈 Performance Optimization

### 1. Enable Caching

Nginx already configured with:
- Static asset caching (1 year)
- Gzip compression
- Keepalive connections

### 2. Reduce Build Time

```bash
# Use build cache
docker compose build

# Parallel builds (multiple projects)
docker compose build --parallel
```

### 3. Optimize Docker Images

```dockerfile
# Use specific Node version (smaller)
FROM node:20-alpine

# Remove dev dependencies after build
RUN npm ci --production

# Use multi-stage builds (already in template)
```

## 🔐 Security Checklist

- [ ] Environment variables in `.env` (not hardcoded)
- [ ] PostgreSQL not exposed publicly (127.0.0.1 only)
- [ ] Nginx rate limiting enabled
- [ ] Firewall configured (UFW)
- [ ] SSH key-based auth only
- [ ] Regular security updates (`sudo apt-get update && upgrade`)

## 🚀 Next Steps

1. **Set up CI/CD**: Automate deployments with GitHub Actions
2. **Add monitoring**: Install Prometheus + Grafana
3. **Configure alerts**: Get notified when services go down
4. **Backup automation**: Scheduled database backups to S3
5. **SSL/HTTPS**: Install Let's Encrypt certificates

## 📚 Related Guides

- [Setup Guide](./setup-guide.md) - Initial server setup
- [Troubleshooting](./troubleshooting.md) - Common problems
- [Main README](../README.md) - Project overview
