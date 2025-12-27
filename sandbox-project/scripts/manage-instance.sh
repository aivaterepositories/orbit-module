#!/bin/bash

###############################################################################
# AWS Lightsail Instance Management Script
#
# Start, stop, or check status of your Lightsail instance
# Requires AWS CLI configured with appropriate credentials
#
# Usage: ./manage-instance.sh [start|stop|status|snapshot]
###############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Configuration (edit these or set in .env)
INSTANCE_NAME="${AWS_LIGHTSAIL_INSTANCE_NAME:-sandbox-demo-server}"
AWS_REGION="${AWS_REGION:-us-east-1}"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo -e "${RED}❌ AWS CLI not found${NC}"
    echo "Install with: brew install awscli"
    echo "Then configure: aws configure"
    exit 1
fi

# Function to get instance status
get_status() {
    aws lightsail get-instance \
        --instance-name "$INSTANCE_NAME" \
        --region "$AWS_REGION" \
        --query 'instance.state.name' \
        --output text 2>/dev/null || echo "NOT_FOUND"
}

# Function to get instance IP
get_ip() {
    aws lightsail get-instance \
        --instance-name "$INSTANCE_NAME" \
        --region "$AWS_REGION" \
        --query 'instance.publicIpAddress' \
        --output text 2>/dev/null || echo "N/A"
}

# Function to start instance
start_instance() {
    echo -e "${YELLOW}🚀 Starting instance: ${INSTANCE_NAME}...${NC}"

    aws lightsail start-instance \
        --instance-name "$INSTANCE_NAME" \
        --region "$AWS_REGION"

    echo -e "${GREEN}✅ Start command sent${NC}"
    echo -e "${YELLOW}⏳ Waiting for instance to be running...${NC}"

    # Wait for instance to be running
    local max_wait=60
    local count=0
    while [ $count -lt $max_wait ]; do
        local status=$(get_status)
        if [ "$status" == "running" ]; then
            local ip=$(get_ip)
            echo -e "${GREEN}✅ Instance is running!${NC}"
            echo ""
            echo -e "${BLUE}📍 Public IP: ${ip}${NC}"
            echo -e "${BLUE}🌐 Access: http://${ip}${NC}"
            echo ""
            echo -e "${YELLOW}To SSH:${NC}"
            echo "  ssh ubuntu@${ip}"
            return 0
        fi
        sleep 2
        ((count++))
        echo -n "."
    done

    echo ""
    echo -e "${YELLOW}⚠️  Instance is starting but not yet running${NC}"
    echo "Check status with: ./manage-instance.sh status"
}

# Function to stop instance
stop_instance() {
    echo -e "${YELLOW}🛑 Stopping instance: ${INSTANCE_NAME}...${NC}"

    aws lightsail stop-instance \
        --instance-name "$INSTANCE_NAME" \
        --region "$AWS_REGION"

    echo -e "${GREEN}✅ Stop command sent${NC}"
    echo -e "${YELLOW}⏳ Waiting for instance to stop...${NC}"

    # Wait for instance to stop
    local max_wait=60
    local count=0
    while [ $count -lt $max_wait ]; do
        local status=$(get_status)
        if [ "$status" == "stopped" ]; then
            echo ""
            echo -e "${GREEN}✅ Instance stopped successfully${NC}"
            echo ""
            echo -e "${BLUE}💰 Cost Savings:${NC}"
            echo "  Instance charges: \$0/hour (stopped)"
            echo "  Storage charges: ~\$0.05/day (20GB)"
            echo ""
            echo -e "${YELLOW}To start again:${NC}"
            echo "  ./manage-instance.sh start"
            return 0
        fi
        sleep 2
        ((count++))
        echo -n "."
    done

    echo ""
    echo -e "${YELLOW}⚠️  Instance is stopping but not yet stopped${NC}"
    echo "Check status with: ./manage-instance.sh status"
}

# Function to show status
show_status() {
    local status=$(get_status)
    local ip=$(get_ip)

    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║     Lightsail Instance Status          ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}Instance Name:${NC} $INSTANCE_NAME"
    echo -e "${YELLOW}Region:${NC}        $AWS_REGION"
    echo -e "${YELLOW}Status:${NC}        $status"
    echo -e "${YELLOW}Public IP:${NC}     $ip"
    echo ""

    if [ "$status" == "running" ]; then
        echo -e "${GREEN}✅ Instance is RUNNING${NC}"
        echo ""
        echo -e "${YELLOW}Access points:${NC}"
        echo "  SSH:  ssh ubuntu@${ip}"
        echo "  Web:  http://${ip}"
        echo ""
        echo -e "${YELLOW}Monthly cost: ~\$5${NC}"
    elif [ "$status" == "stopped" ]; then
        echo -e "${YELLOW}⏸️  Instance is STOPPED${NC}"
        echo ""
        echo -e "${YELLOW}Storage cost: ~\$1.50/month${NC}"
        echo ""
        echo "To start: ./manage-instance.sh start"
    elif [ "$status" == "NOT_FOUND" ]; then
        echo -e "${RED}❌ Instance not found${NC}"
        echo ""
        echo "Create instance with: ./create-instance.sh"
    else
        echo -e "${YELLOW}⏳ Instance is in state: ${status}${NC}"
    fi
}

# Function to create snapshot
create_snapshot() {
    local snapshot_name="${INSTANCE_NAME}-snapshot-$(date +%Y%m%d-%H%M%S)"

    echo -e "${YELLOW}📸 Creating snapshot: ${snapshot_name}...${NC}"

    aws lightsail create-instance-snapshot \
        --instance-name "$INSTANCE_NAME" \
        --instance-snapshot-name "$snapshot_name" \
        --region "$AWS_REGION"

    echo -e "${GREEN}✅ Snapshot creation started${NC}"
    echo ""
    echo -e "${YELLOW}Snapshot name:${NC} ${snapshot_name}"
    echo ""
    echo "List snapshots with:"
    echo "  aws lightsail get-instance-snapshots --region $AWS_REGION"
}

# Main logic
case "${1:-}" in
    start)
        start_instance
        ;;
    stop)
        stop_instance
        ;;
    status)
        show_status
        ;;
    snapshot)
        create_snapshot
        ;;
    *)
        echo "Usage: $0 [start|stop|status|snapshot]"
        echo ""
        echo "Commands:"
        echo "  start    - Start the Lightsail instance"
        echo "  stop     - Stop the instance (saves money)"
        echo "  status   - Show current instance status"
        echo "  snapshot - Create a backup snapshot"
        echo ""
        exit 1
        ;;
esac
