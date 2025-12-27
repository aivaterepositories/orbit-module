#!/bin/bash

###############################################################################
# AWS Lightsail Server Setup Script
#
# This script sets up a fresh Ubuntu 22.04 instance with:
# - Docker & Docker Compose
# - PostgreSQL (containerized)
# - Nginx reverse proxy
# - Firewall configuration
# - Basic security hardening
#
# Usage: Run this on your Lightsail instance after first SSH
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  AWS Lightsail Sandbox Server Setup   ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if running as root
if [ "$EUID" -eq 0 ]; then
  echo -e "${RED}❌ Please run as ubuntu user, not root${NC}"
  exit 1
fi

echo -e "${YELLOW}📦 Step 1: Updating system packages...${NC}"
sudo apt-get update
sudo apt-get upgrade -y

echo ""
echo -e "${YELLOW}🐳 Step 2: Installing Docker...${NC}"

# Remove old Docker versions if any
sudo apt-get remove -y docker docker-engine docker.io containerd runc || true

# Install dependencies
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

echo -e "${GREEN}✅ Docker installed successfully${NC}"

echo ""
echo -e "${YELLOW}🔧 Step 3: Installing Docker Compose...${NC}"

# Docker Compose should be installed as plugin, verify
docker compose version

echo -e "${GREEN}✅ Docker Compose installed${NC}"

echo ""
echo -e "${YELLOW}📁 Step 4: Creating project directories...${NC}"

mkdir -p ~/sandbox-project/{infrastructure,projects,backups,logs}

echo -e "${GREEN}✅ Directories created${NC}"

echo ""
echo -e "${YELLOW}🔒 Step 5: Configuring firewall (UFW)...${NC}"

sudo ufw --force enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp    # SSH
sudo ufw allow 80/tcp    # HTTP
sudo ufw allow 443/tcp   # HTTPS
sudo ufw status

echo -e "${GREEN}✅ Firewall configured${NC}"

echo ""
echo -e "${YELLOW}🛡️  Step 6: Basic security hardening...${NC}"

# Disable password authentication for SSH (key-based only)
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Install fail2ban
sudo apt-get install -y fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo -e "${GREEN}✅ Security hardening applied${NC}"

echo ""
echo -e "${YELLOW}📊 Step 7: Installing monitoring tools...${NC}"

sudo apt-get install -y htop iotop ncdu

echo -e "${GREEN}✅ Monitoring tools installed${NC}"

echo ""
echo -e "${YELLOW}🔄 Step 8: Configuring automatic updates...${NC}"

sudo apt-get install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades

echo -e "${GREEN}✅ Automatic updates configured${NC}"

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║      Setup Complete! 🎉                ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Next Steps:${NC}"
echo "1. Log out and log back in for Docker group changes to take effect:"
echo "   ${GREEN}exit${NC}"
echo "   ${GREEN}ssh ubuntu@<your-ip>${NC}"
echo ""
echo "2. Upload your infrastructure files to ~/sandbox-project/infrastructure/"
echo ""
echo "3. Create .env file from env.example:"
echo "   ${GREEN}cd ~/sandbox-project/infrastructure${NC}"
echo "   ${GREEN}cp env.example .env${NC}"
echo "   ${GREEN}nano .env${NC}  # Edit with your values"
echo ""
echo "4. Start the services:"
echo "   ${GREEN}docker compose up -d${NC}"
echo ""
echo "5. Check status:"
echo "   ${GREEN}docker ps${NC}"
echo ""
echo -e "${YELLOW}Useful Commands:${NC}"
echo "  View logs:        ${GREEN}docker compose logs -f${NC}"
echo "  Restart services: ${GREEN}docker compose restart${NC}"
echo "  Stop services:    ${GREEN}docker compose down${NC}"
echo "  Resource usage:   ${GREEN}docker stats${NC}"
echo ""
