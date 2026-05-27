# GHL Pipeline Walkthrough — Dos Gringos Construction LLC

**Documented:** May 27, 2026 (FPEC #1)
**CRM Platform:** GoHighLevel
**Note:** Pipelines are actively being restructured by Walker's team and Roar (marketing agency). This document reflects the current state as of May 27, 2026. A re-documentation session will be scheduled once changes settle.

---

## Pipeline Overview

Dos Gringos operates **two pipelines** in GoHighLevel:

| Pipeline | Lead Source | Priority | State |
|----------|-----------|----------|-------|
| **PPC Leads** | Paid digital ads (form submissions) | #1 — Always primary (highest cost per lead) | Cleaner, automations function well |
| **Outbound Lead Pipeline** | Cold calling via Speed Dial | #2 | Cluttered with stale leads, automations being reworked |

---

## Pipeline 1: PPC Leads

### How Leads Enter
- Seller fills out a two-step submission form on the PPC landing page
- Lead is created automatically in GHL

### Automation on Entry
- **Immediate auto-text** is sent the moment the form is submitted (runs 24/7 — e.g., "Thanks for contacting us" sent even at 3:30 AM)
- Speed-to-lead = human follow-up call as soon as possible during business hours

### Pipeline Stages
PPC pipeline follows the same stage structure as the Outbound pipeline (see below). The key difference is that PPC automations have a "pretty natural flow" and are better optimized for inbound leads.

### Notes
- Fewer leads in this pipeline (lower volume, higher quality)
- Walker has been personally working many PPC leads end-to-end
- Documentation (notes on contact cards) has been inconsistent for PPC leads

---

## Pipeline 2: Outbound Lead Pipeline

### How Leads Enter
- Cold calling outsourced to **Speed Dial**
- Speed Dial callers tell homeowners that someone will contact them within 24–48 hours
- Lead is created in GHL after the cold call

### Pipeline Stages

| # | Stage | Definition | VA Action |
|---|-------|-----------|-----------|
| 1 | **New Lead** | Fresh lead. Nobody has spoken to them yet. | **Utmost priority.** Call immediately (speed-to-lead). The cold caller promised contact within 24–48 hours. |
| 2 | **Not Engaged, Follow Up** | Called but didn't get through. No engagement yet. | Automations handle drip follow-up texts. Monitor for responses. When a lead responds, automation turns off and VA is notified for manual follow-up. |
| 3 | **Engaged** | Answered or showed initial interest. Some interaction has occurred — texts, brief conversation. "Fish on the hook." | All drip automations are removed. Human interaction only from this point. VA continues conversation and works toward triage. |
| 4 | **Triaged** | The script has been presented. Lead received a phone call, consultation, or in-person meeting. A cash or creative offer has been extended. | Assess response. Determine if lead is warm, hot, or needs more time. |
| 5 | **Warm** | Good opportunity identified. Lead has expressed interest but not yet fully committed. | Continue engagement. Push toward closing. |
| 6 | **Perfect Presentation** | Very warm. Ready to go. Highest confidence level. | Highest priority for active follow-up. Move toward contract. Hand off to acquisitions if applicable. |
| 7 | **Under Contract** | Deal closed. Contract signed. | Update GHL. Document outcome. |
| 8 | **Long-Term Follow-Up** | Lead wants to sell but timeline is 6+ months. | Park in this stage. Follow-up based on defined cadence (TBD). |
| 9 | **Dead / Lost / Undesirable** | Lead explicitly stated they don't want to be contacted. | No further action. Archive. |

### VA Work Priority (Within Outbound Pipeline)

When starting a shift, work leads in this order:

1. **New Leads** — always first, speed-to-lead is the primary KPI
2. **Perfect Presentation** — leads closest to closing
3. **Warm** — strong opportunities
4. **Triaged** — script presented, awaiting assessment
5. **Engaged** — active conversations to advance
6. **Not Engaged, Follow Up** — monitor for automation responses, follow up manually when triggered

**Walker's directive:** "I don't want the VA to be another cold caller. I want them speaking to leads that are ready to go right now."

---

## Automations & Workflows

### PPC Pipeline Automations
- **On form submission:** Immediate auto-text sent to lead
- **If moved to Not Engaged:** Drip follow-up text sequence activates
- **If moved to Engaged:** All follow-up tags removed, automation stops

### Outbound Pipeline Automations
- **On entry to Not Engaged:** Series of follow-up texts sent (e.g., "Did I do something wrong? I haven't heard back from you...")
- **On lead response (any response):** Automation turns off. Team is notified for manual follow-up.
- **On move to Engaged:** All drip follow-up tags removed. Human interaction only.

### Known Issue (Fixed)
- Previously, automations continued texting even after a lead responded — made the company look like a bot
- **Fix applied:** Automation now detects any response and shuts off, triggering a notification for manual follow-up

### Walker's Note on Automations
- The outbound pipeline automations were originally built for PPC-style leads and don't fit cold calling workflows well
- Rework is in progress — messaging needs to align with company values and cold calling approach
- Roar (marketing agency) will also have input on follow-up automation design

---

## GHL Features — VA Must Use

### 1. Task Management

**Location:** Contacts → Tasks section

**Purpose:** Organize the VA's daily workload — who to call, what was promised, what's overdue.

**How to create tasks:**

**Method A — From Tasks Section:**
1. Go to Contacts → Tasks
2. Click "Add Task"
3. Fill in task details
4. Assign to yourself (or another team member)
5. Link to a specific contact

**Method B — From Conversations:**
1. Go to Conversations tab (left panel)
2. Select the contact you're working with
3. Click the Tasks button on the right-side panel
4. Add task — automatically linked to that contact

**Filtering:** Filter tasks by assignee to see only your tasks for the day.

**Current state:** 702 existing tasks created by Lane Anderson (acquisitions). Many overdue and poorly managed. VA should focus on their own new tasks.

### 2. Notes / Documentation

**Location:** Contact card → Notes section

**Purpose:** Document every interaction with a lead. Keeps the entire team informed — especially important for handoff to acquisitions.

**What to document:**
- Call outcomes (answered, voicemail, no answer)
- Key information shared by the lead
- Motivation indicators
- Next steps promised
- Any relevant details for acquisitions handoff

**Rule:** Every lead interaction gets a note. No exceptions.

### 3. Call Recording

- All calls made through GHL are automatically recorded
- Recordings are accessible from the contact card (press play)
- VA calls will also be recorded — useful for QA, training, and dispute resolution

---

## Pipeline Hygiene — Pending

Walker has asked his team to clean up stale leads in the outbound pipeline before the VA starts. Items to be addressed:
- Dead leads sitting in active stages
- Leads in wrong pipelines (outbound mixed into PPC)
- Overdue tasks from Lane Anderson

---

## What's NOT in GHL (Yet)

| Feature | Status | Notes |
|---------|--------|-------|
| Calendar/booking setup | Not discussed | TBD — may be needed for appointment setting |
| Tags system | Not shown | Walker didn't walk through tags — to be revisited |
| Custom fields | Not shown | To be revisited in a future session |
| Reporting/dashboards | Not discussed | May be useful for VA performance tracking |

---

*Documented by Nova on behalf of Fiona | May 27, 2026*
