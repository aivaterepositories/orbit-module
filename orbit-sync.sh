#!/bin/bash
# ORBIT Team Synchronization Helper
# Quick pull/push for team coordination

ACTION=${1:-pull}

case $ACTION in
  pull)
    echo "🔄 Pulling latest ORBIT updates from team..."
    git pull origin main
    echo "✅ Synced! You now have latest team context."
    ;;
  push)
    echo "📤 Pushing your ORBIT updates to team..."
    git add _bmad/orbit/shared-state/
    git add _bmad/_memory/project-coordinator-sidecar/

    if [ -z "$2" ]; then
      echo "❌ Please provide commit message:"
      echo "   ./orbit-sync.sh push \"Your message here\""
      exit 1
    fi

    git commit -m "$2"
    git push origin main
    echo "✅ Pushed! Team can now pull your updates."
    ;;
  status)
    echo "📊 ORBIT Sync Status:"
    git status _bmad/orbit/shared-state/
    ;;
  *)
    echo "ORBIT Team Sync Helper"
    echo ""
    echo "Usage:"
    echo "  ./orbit-sync.sh pull              # Get latest team updates"
    echo "  ./orbit-sync.sh push \"message\"    # Share your updates"
    echo "  ./orbit-sync.sh status            # Check sync status"
    ;;
esac
