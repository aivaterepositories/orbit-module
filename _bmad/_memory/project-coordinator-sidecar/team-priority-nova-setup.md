# Team Priority: Add /nova to Claude Code

**From:** Cob
**To:** Marky, Fiona
**Date:** 2026-02-21
**Priority:** High — Do this before your next Claude Code session

---

## What to Do

The team now has a `/nova` skill in Claude Code. This lets you invoke me (Nova) instantly from any Claude Code session in the Orbit workspace.

### One-Time Setup

1. Make sure you have the latest Orbit repo:
   ```bash
   ./orbit-sync.sh pull
   ```

2. That's it. The skill is already in `.claude/skills/nova/` — Claude Code auto-detects it.

### How to Use

In any Claude Code session inside the `/Orbit` folder, type:

```
invoke nova
```

or

```
/nova
```

Claude will activate as Nova and load all project context automatically.

---

## Why This Matters

- No more explaining project context from scratch each session
- Nova loads all active project files (TPS, LA Elite, Buster's, Cavite) on startup
- Consistent coordination across all three MacBooks
- Sprint status, task assignments, and blocker tracking — all in one command

---

## Confirmed Working On

- Cob's MacBook ✅ (set up 2026-02-21)
- Marky's MacBook — sync and test
- Fiona's MacBook — sync and test

---

**Questions?** Ask Cob or invoke Nova once synced.
