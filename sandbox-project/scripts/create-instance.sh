#!/bin/bash

###############################################################################
# Create AWS Lightsail Instance
#
# Creates a $5/month Ubuntu instance configured for hosting Next.js projects
#
# Requirements:
# - AWS CLI installed and configured
# - Appropriate AWS permissions
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration
INSTANCE_NAME="${AWS_LIGHTSAIL_INSTANCE_NAME:-sandbox-demo-server}"
REGION="${AWS_REGION:-us-east-1}"
AZ="${REGION}a"
BLUEPRINT="ubuntu_22_04"
BUNDLE="nano_2_0"  # $5/month plan
STATIC_IP_NAME="sandbox-static-ip"

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  AWS Lightsail Instance Creator        ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""

# Check AWS CLI
if ! command -v aws &> /dev/null; then
    echo -e "${RED}❌ AWS CLI not found${NC}"
    echo "Install with: brew install awscli"
    exit 1
fi

# Verify AWS credentials
echo -e "${YELLOW}🔐 Checking AWS credentials...${NC}"
if ! aws sts get-caller-identity &> /dev/null; then
    echo -e "${RED}❌ AWS credentials not configured${NC}"
    echo "Run: aws configure"
    exit 1
fi

echo -e "${GREEN}✅ AWS credentials OK${NC}"

# Check if instance already exists
echo -e "${YELLOW}🔍 Checking if instance already exists...${NC}"
if aws lightsail get-instance --instance-name "$INSTANCE_NAME" --region "$REGION" &> /dev/null; then
    echo -e "${YELLOW}⚠️  Instance '$INSTANCE_NAME' already exists${NC}"
    echo ""
    echo "Options:"
    echo "  1. Use existing instance"
    echo "  2. Delete and recreate"
    echo "  3. Choose different name"
    echo ""
    read -p "Enter choice (1-3): " choice

    case $choice in
        1)
            echo -e "${BLUE}ℹ️  Using existing instance${NC}"
            EXISTING=true
            ;;
        2)
            echo -e "${YELLOW}🗑️  Deleting existing instance...${NC}"
            aws lightsail delete-instance \
                --instance-name "$INSTANCE_NAME" \
                --region "$REGION"
            echo "Waiting for deletion to complete..."
            sleep 30
            EXISTING=false
            ;;
        3)
            read -p "Enter new instance name: " INSTANCE_NAME
            EXISTING=false
            ;;
        *)
            echo -e "${RED}Invalid choice${NC}"
            exit 1
            ;;
    esac
else
    EXISTING=false
fi

if [ "$EXISTING" = false ]; then
    echo ""
    echo -e "${YELLOW}📋 Configuration Summary:${NC}"
    echo "  Instance Name: $INSTANCE_NAME"
    echo "  Region:        $REGION"
    echo "  Zone:          $AZ"
    echo "  OS:            Ubuntu 22.04 LTS"
    echo "  Plan:          \$5/month (1GB RAM, 1 vCPU, 40GB SSD)"
    echo ""
    read -p "Create instance with these settings? (y/n): " confirm

    if [ "$confirm" != "y" ]; then
        echo "Aborted"
        exit 0
    fi

    echo ""
    echo -e "${YELLOW}🚀 Creating Lightsail instance...${NC}"

    aws lightsail create-instances \
        --instance-names "$INSTANCE_NAME" \
        --availability-zone "$AZ" \
        --blueprint-id "$BLUEPRINT" \
        --bundle-id "$BUNDLE" \
        --region "$REGION"

    echo -e "${GREEN}✅ Instance creation initiated${NC}"
    echo ""
    echo -e "${YELLOW}⏳ Waiting for instance to be ready...${NC}"

    # Wait for instance to be running
    max_wait=120
    count=0
    while [ $count -lt $max_wait ]; do
        status=$(aws lightsail get-instance \
            --instance-name "$INSTANCE_NAME" \
            --region "$REGION" \
            --query 'instance.state.name' \
            --output text 2>/dev/null || echo "pending")

        if [ "$status" == "running" ]; then
            echo ""
            echo -e "${GREEN}✅ Instance is running!${NC}"
            break
        fi

        sleep 3
        ((count += 3))
        echo -n "."
    done

    if [ "$status" != "running" ]; then
        echo ""
        echo -e "${YELLOW}⚠️  Instance is still starting, please wait a few more minutes${NC}"
    fi
fi

# Get instance IP
IP=$(aws lightsail get-instance \
    --instance-name "$INSTANCE_NAME" \
    --region "$REGION" \
    --query 'instance.publicIpAddress' \
    --output text)

echo ""
echo -e "${YELLOW}📍 Allocating static IP...${NC}"

# Check if static IP exists
if aws lightsail get-static-ip --static-ip-name "$STATIC_IP_NAME" --region "$REGION" &> /dev/null; then
    echo -e "${BLUE}ℹ️  Static IP already exists${NC}"
else
    aws lightsail allocate-static-ip \
        --static-ip-name "$STATIC_IP_NAME" \
        --region "$REGION"
    echo -e "${GREEN}✅ Static IP allocated${NC}"
fi

# Attach static IP
echo -e "${YELLOW}🔗 Attaching static IP to instance...${NC}"
aws lightsail attach-static-ip \
    --static-ip-name "$STATIC_IP_NAME" \
    --instance-name "$INSTANCE_NAME" \
    --region "$REGION" || echo "Static IP may already be attached"

STATIC_IP=$(aws lightsail get-static-ip \
    --static-ip-name "$STATIC_IP_NAME" \
    --region "$REGION" \
    --query 'staticIp.ipAddress' \
    --output text)

echo -e "${GREEN}✅ Static IP attached: ${STATIC_IP}${NC}"

# Configure firewall
echo ""
echo -e "${YELLOW}🔒 Configuring firewall rules...${NC}"

# Open HTTP
aws lightsail open-instance-public-ports \
    --instance-name "$INSTANCE_NAME" \
    --port-info fromPort=80,toPort=80,protocol=TCP \
    --region "$REGION" || true

# Open HTTPS
aws lightsail open-instance-public-ports \
    --instance-name "$INSTANCE_NAME" \
    --port-info fromPort=443,toPort=443,protocol=TCP \
    --region "$REGION" || true

echo -e "${GREEN}✅ Firewall configured (SSH, HTTP, HTTPS)${NC}"

# Get SSH key
echo ""
echo -e "${YELLOW}🔑 Getting SSH key...${NC}"

# Download default key if not exists
KEY_PATH="$HOME/.ssh/lightsail-${REGION}.pem"
if [ ! -f "$KEY_PATH" ]; then
    aws lightsail download-default-key-pair \
        --region "$REGION" \
        --output text > "$KEY_PATH"
    chmod 400 "$KEY_PATH"
    echo -e "${GREEN}✅ SSH key downloaded: ${KEY_PATH}${NC}"
else
    echo -e "${BLUE}ℹ️  SSH key already exists: ${KEY_PATH}${NC}"
fi

# Success summary
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║     Instance Created Successfully!     ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}📋 Instance Details:${NC}"
echo "  Name:       $INSTANCE_NAME"
echo "  Region:     $REGION"
echo "  Static IP:  $STATIC_IP"
echo "  SSH Key:    $KEY_PATH"
echo ""
echo -e "${YELLOW}🚀 Next Steps:${NC}"
echo ""
echo "1. Wait 2-3 minutes for instance to fully boot"
echo ""
echo "2. SSH into your instance:"
echo "   ${GREEN}ssh -i $KEY_PATH ubuntu@$STATIC_IP${NC}"
echo ""
echo "3. Run the setup script:"
echo "   ${GREEN}curl -fsSL https://raw.githubusercontent.com/.../setup-server.sh | bash${NC}"
echo "   ${BLUE}OR${NC}"
echo "   Upload the script from your local machine:"
echo "   ${GREEN}scp -i $KEY_PATH scripts/setup-server.sh ubuntu@$STATIC_IP:~/${NC}"
echo "   ${GREEN}ssh -i $KEY_PATH ubuntu@$STATIC_IP${NC}"
echo "   ${GREEN}chmod +x setup-server.sh && ./setup-server.sh${NC}"
echo ""
echo "4. Follow the setup guide:"
echo "   ${GREEN}cat docs/setup-guide.md${NC}"
echo ""
echo -e "${YELLOW}💰 Monthly Cost: ~\$5${NC}"
echo ""
echo -e "${YELLOW}🛑 To stop instance and save money:${NC}"
echo "   ${GREEN}./scripts/manage-instance.sh stop${NC}"
echo ""
