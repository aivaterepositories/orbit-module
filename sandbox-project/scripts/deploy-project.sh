#!/bin/bash

###############################################################################
# Project Deployment Script
#
# Deploys a Next.js project to the sandbox server
#
# Usage: ./deploy-project.sh <project-name> [--update]
# Example: ./deploy-project.sh dispute-tracker
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check arguments
if [ -z "$1" ]; then
    echo -e "${RED}❌ Error: Project name required${NC}"
    echo "Usage: ./deploy-project.sh <project-name> [--update]"
    echo "Example: ./deploy-project.sh dispute-tracker"
    exit 1
fi

PROJECT_NAME=$1
UPDATE_FLAG=$2

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  Deploying: ${PROJECT_NAME}              ${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""

# Navigate to infrastructure directory
cd ~/sandbox-project/infrastructure

# Check if docker-compose.yml exists
if [ ! -f "docker-compose.yml" ]; then
    echo -e "${RED}❌ docker-compose.yml not found${NC}"
    exit 1
fi

# Check if .env exists
if [ ! -f ".env" ]; then
    echo -e "${RED}❌ .env file not found${NC}"
    echo "Create .env from env.example first:"
    echo "  cp env.example .env"
    echo "  nano .env"
    exit 1
fi

# Check if project directory exists
if [ ! -d "../projects/${PROJECT_NAME}" ]; then
    echo -e "${RED}❌ Project directory not found: ../projects/${PROJECT_NAME}${NC}"
    exit 1
fi

# Check if Dockerfile exists in project
if [ ! -f "../projects/${PROJECT_NAME}/Dockerfile" ]; then
    echo -e "${YELLOW}⚠️  Dockerfile not found in project directory${NC}"
    echo "Creating default Next.js Dockerfile..."

    cat > ../projects/${PROJECT_NAME}/Dockerfile << 'EOF'
# Multi-stage build for Next.js
FROM node:20-alpine AS base

# Install dependencies only when needed
FROM base AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copy package files
COPY package*.json ./
RUN npm ci

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Build Next.js
ENV NEXT_TELEMETRY_DISABLED 1
RUN npm run build

# Production image
FROM base AS runner
WORKDIR /app

ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy built files
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

ENV PORT 3000
ENV HOSTNAME "0.0.0.0"

CMD ["node", "server.js"]
EOF

    echo -e "${GREEN}✅ Dockerfile created${NC}"
fi

echo -e "${YELLOW}🔨 Building Docker image...${NC}"
docker compose build ${PROJECT_NAME}

if [ "$UPDATE_FLAG" == "--update" ]; then
    echo -e "${YELLOW}🔄 Stopping old container...${NC}"
    docker compose stop ${PROJECT_NAME} || true
    docker compose rm -f ${PROJECT_NAME} || true
fi

echo -e "${YELLOW}🚀 Starting container...${NC}"
docker compose up -d ${PROJECT_NAME}

echo ""
echo -e "${YELLOW}⏳ Waiting for container to be healthy...${NC}"
sleep 5

# Check if container is running
if docker ps | grep -q ${PROJECT_NAME}; then
    echo -e "${GREEN}✅ Container is running${NC}"

    # Show logs
    echo ""
    echo -e "${YELLOW}📋 Recent logs:${NC}"
    docker logs --tail 20 ${PROJECT_NAME}

    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  Deployment Successful! 🎉             ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Access your project at:${NC}"
    echo "  http://$(curl -s ifconfig.me)/${PROJECT_NAME}"
    echo ""
    echo -e "${YELLOW}Useful commands:${NC}"
    echo "  View logs:    ${GREEN}docker logs -f ${PROJECT_NAME}${NC}"
    echo "  Restart:      ${GREEN}docker restart ${PROJECT_NAME}${NC}"
    echo "  Stop:         ${GREEN}docker stop ${PROJECT_NAME}${NC}"
    echo "  Shell access: ${GREEN}docker exec -it ${PROJECT_NAME} sh${NC}"
else
    echo -e "${RED}❌ Container failed to start${NC}"
    echo ""
    echo "Check logs with:"
    echo "  docker logs ${PROJECT_NAME}"
    exit 1
fi
