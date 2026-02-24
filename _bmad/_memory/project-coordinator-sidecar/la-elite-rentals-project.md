# LA Elite Rentals - GoHighLevel Optimization

**Status:** ACTIVE — DEAL CLOSED (Option 2: Retainer)
**Priority:** High
**Company:** LA Elite Rentals
**Client Contact:** Kel King (Owner)
**Project Lead:** Fiona (PM / Process Engineer — Aivate)
**Lead Developer:** Marky (GoHighLevel)
**Support:** Jacob (GoHighLevel)

---

## Project Overview

### Client Profile
| Field | Details |
|-------|---------|
| **Company** | LA Elite Rentals |
| **Contact** | Kel (Owner) |
| **Business** | Car Rental |
| **Location** | Los Angeles, CA |
| **Internal Team** | <5 people (daily ops + lead gen/management) |
| **Current Systems** | GoHighLevel (CRM), HQ Rental (booking management) |
| **Payment Methods** | Zelle, Cash, Apple Pay, others |

### Problem Statement
- **GoHighLevel underutilized** — automations and workflows not being used
- **Manual processes** — drip campaigns, follow-up cadences done manually
- **Lead nurturing** — requires manual intervention instead of automation
- **Opportunity** — automate inside GHL instead of manual follow-ups

---

## Source & Context

### How This Client Came In
- Fiona was process engineering this client through **Scale Virtually** (another company Fiona works for)
- During process engineering calls, discovered GHL automation gaps
- Created a lead management playbook for the client
- Opportunity to pitch Aivate services for GHL optimization

### Existing Work (Scale Virtually)
Fiona has already created for this client:
- [x] SOPs (documented)
- [x] Scripts (documented)
- [x] Templates (documented)
- [x] Lead management playbook

**Materials received:** 2026-02-07
- Fleet & Services Overview Guide
- Call Scripts (New Inbound, Maintenance, Scenarios 1-9)
- Security Deposit Policy
- FAQ Handling Guide
- Payment Reminders & Pickup Confirmation Templates
- Overheating & Coolant Handling SOP
- Rental Application Denial Procedures
- Renter Repossession Handling SOP
- Fleet Maintenance Scheduling Process
- Lead and Rental Booking Management Process

### Deliverables Created

| Document | File | Status |
|----------|------|--------|
| **Pitch Deck Outline** | `la-elite-rentals-pitch-deck-outline.md` | Ready for pitch |
| **Marky's Build Scope** | `la-elite-rentals-marky-scope.md` | Ready for build |

**Automations Identified:** 30 opportunities across 4 phases
**Workflows Scoped for Build:** 17 (with full specs, triggers, and copy)

---

## Technical Context

### Current Systems

| System | Purpose | Notes |
|--------|---------|-------|
| **GoHighLevel** | Main CRM | Lead gen, lead management, automations |
| **HQ Rental** | Booking management | Rental organization |
| **Payment** | Zelle, Cash, Apple Pay | Multiple payment methods |

### Current State (GHL)
- Several automations in place but need upgrading
- Drip campaigns — currently manual
- Follow-up cadences — currently manual
- Workflows — not being utilized
- Lead nurturing — manual process

### Opportunity Areas
1. **Automate drip campaigns** inside GHL
2. **Automate follow-up cadences** — no manual follow-ups needed
3. **Lead nurturing workflows** — automated sequences
4. **Upgrade existing automations** — improve what's already there

---

## Proposed Team

| Role | Person | Responsibilities |
|------|--------|------------------|
| **Project Manager** | Fiona | Client comms, process engineering, coordination |
| **Lead GHL Engineer** | Marky | GHL automations, workflows, setup |
| **GHL Support** | Jacob | GHL implementation support |

### Marky's Relevant Experience
- First-hand experience fixing GoHighLevel automations
- Has set up GHL for other clients
- Will be lead engineer/developer for systems

---

## Deal — Closed (February 19, 2026)

### Option Selected: Option 2 — Retainer + Monthly

| Item | Amount |
|------|--------|
| **Upfront Payment** | $1,150 |
| **Monthly Retainer** | $350/month |
| **First Month Total** | $1,500 ($1,250 + $350) |
| **Commitment** | 12 months (through February 2027) |
| **Payment Method** | WISE |
| **Total Project Value** | $5,000 ($1,150 + $350 x 11 months) |

### What's Included (Option 2)
- All 4 phases of GHL automation build (27+ workflows)
- Twice-monthly check-in calls to identify new automation opportunities
- Any additional automation needs within existing platforms covered under retainer
- Does NOT include: AI voice agents, new platform builds, or robocalling (separate scope)

### Additional Scope Added (from Feb 19 call)
- **Registration automations** — added to Phase 4
- **Off-grid/border alerts** — driver goes outside borders → alert triggered; added to Phase 4

### Future Opportunities (Separate Scope, Not Included in Retainer)
- **AI Voice Agent / Robocalling** — Kel interested in AI handling inbound lead questions (rates, pickup location, how it works). Rough estimate shared: $2,000+. Needs scoping by Marky/Jacob for platform requirements and costing.
- **AI Website Chat Agent** — Agentic AI on website to answer inquiries without calling. Kel interested.
- **Payment Email Parsing** — Automate reading Zelle/Chase payment notification emails and marking payments in GHL or HQ Rental. Kel sees this as a game changer. Fiona confirmed it's doable (email parsing → system integration).
- **JV Payment Process** — Kel mentioned JV payments; needs to define the process first before automation can be scoped.
- **White Label Services** — Kel has other clients he's showing his GHL setup to. Open to discussion about white-labeling Aivate's services under his brand. Fiona introduced the concept and pricing framework (markup to $5,000+).
- **Stripe + Cash App Integration** — Kel's friend does Stripe → Cash App → GHL integration. Kel concerned about transaction fees. Alternative: AI email parsing approach avoids fees.

---

## Implementation Plan

### Phase 1: Speed to Lead + Payments + Welcome (Week 1)
- Instant text when new leads come in (speed-to-lead drip)
- Missed call text-back
- Payment due reminders (24hr + day-of + overdue)
- Post-pickup welcome kit auto-send

### Phase 2: Lead Nurturing (Week 2)
- 3-day urgency follow-up sequence
- Intake form reminder (24hr chase)
- Nurturing drip for "not ready" leads
- Waitlist reactivation when vehicle type available

### Phase 3: Retention (Week 3)
- Late payment escalation sequence
- Weekly renter check-in
- Referral request (after 30 days)
- Renewal/extension reminder

### Phase 4: Internal Efficiency (Week 4)
- Auto-task creation on stage change
- Stale lead alerts
- Denial reason auto-response
- Pipeline stage automation
- **Registration renewal notifications** *(added Feb 19, confirmed Feb 24)* — Auto-alert when vehicle registration is approaching expiry. Data source: [LA Elite Rentals 2.0 Google Sheet](https://docs.google.com/spreadsheets/d/19YtXpZoymtNFaxKLucoz5TUWh-vaTu5dHHcAm59WUSs/edit?usp=sharing)
- **Off-grid/border alerts** *(added Feb 19)* — Bouncie geofence integration
- **Maintenance alerts (Bouncie integration)** *(added Feb 24)* — Bouncie webhook triggers → GHL tasks + renter notifications for vehicle alerts (check engine, overheating, mileage, etc.). Scope broadly; refine after Marky audits Bouncie dashboard.

---

## Sprint Plan — Week of Feb 24, 2026

### Focus: Phase 1 — Quick Wins (4 Workflows)

**GHL Access:** Fiona has access. Credentials to be shared with Marky via secure channel (NOT in repo).

| # | Workflow | Key Deliverables | Owner | Status |
|---|----------|-----------------|-------|--------|
| 1 | **Speed-to-Lead Auto-Response** | Instant SMS on new lead (Facebook/Web Form), auto-tag, VA task creation | Marky | Not Started |
| 2 | **Missed Call Text-Back** | Auto-SMS on missed call, tag + task creation | Marky | Not Started |
| 3 | **Payment Due Reminder Sequence** | 3-stage sequence: Day before → Due date → Overdue (12:30 PM) | Marky | Not Started |
| 4 | **Post-Pickup Welcome Kit** | Auto-send welcome message + Bluetooth setup + payment schedule on stage change to "Became Renter" | Marky | Not Started |

### Pre-Build Checklist (Before Marky Starts)
- [ ] Share GHL credentials with Marky (secure channel)
- [ ] Audit existing workflows in Kel's GHL (note what's already built)
- [ ] Confirm pipeline stages match scope (New Lead → Contacted → Waiting for Paperwork → Nurturing Lead → Denied → Became Renter)
- [ ] Confirm/create custom fields: `Pickup Date`, `Payment Due Date`, `Vehicle Type`, `Denial Reason`, `Security Deposit Received`
- [ ] Confirm/create tags: `Speed-to-Lead Sent`, `Missed Call - Texted`, `Payment Reminder Sent`, `Welcome Kit Sent`
- [ ] Confirm GHL timezone = Pacific Time

### What We Need From Kel This Week
1. **Confirm pipeline stages** — Do the stages in GHL match what we scoped?
2. **Confirm payment amount** — Scope says $420/week; verify this is current and standard across renters
3. **Confirm Zelle address** — infolaeliterentals@gmail.com (per scope)
4. **Confirm pickup location** — 6102 W Sunset Blvd (per scope)
5. **Bouncie access** — Not urgent (Phase 4), but if he can share dashboard access now, Marky can start auditing available webhooks early

### Collaboration Plan
| Who | This Week's Responsibilities |
|-----|------|
| **Fiona** | Share GHL access with Marky, send Kel the confirmation questions above, review/approve workflows before going live |
| **Marky** | Pre-build checklist → Build workflows 1-4 in order → Test with test contact |
| **Kel** | Answer confirmation questions, flag any changes to payment amounts/processes |

### Upcoming Sprints
| Week | Phase | Focus |
|------|-------|-------|
| **Week 1 (Feb 24)** | Phase 1: Quick Wins | Speed-to-Lead, Missed Call, Payment Reminders, Welcome Kit |
| **Week 2 (Mar 3)** | Phase 2: Lead Nurturing | 3-Day Urgency, Intake Reminder, Nurturing Drip, FB Lead Warm-Up |
| **Week 3 (Mar 10)** | Phase 3: Retention | Late Payment Escalation, Weekly Check-In, Referral Request, Renewal Reminder |
| **Week 4 (Mar 17)** | Phase 4: Internal Efficiency | Auto-Tasks, Stale Alerts, Denial Response, Registration Renewal, Bouncie Maintenance Alerts, Off-Grid Alerts |

---

## Previous Next Steps (Post-Close — Feb 19)

1. ~~**Send WISE payment link to Kel**~~ — ✅ Payment received
2. **GHL access** — ✅ Fiona has access; share with Marky via secure channel
3. **Schedule Phase 1 kickoff call** — In progress
4. **Brief Marky & Jacob** — Share scope, timeline, and GHL access details
5. **Fiona to test processes** — Fiona mentioned she may conduct calls herself to test the process firsthand as PM

---

## Progress Log

**2026-02-24:** Payment received. Sprint planning completed for all 4 phases (Week 1-4). Phase 1 sprint starts this week: Speed-to-Lead, Missed Call Text-Back, Payment Reminders, Post-Pickup Welcome Kit. Fiona has GHL access; sharing with Marky via secure channel. New scope additions confirmed: Maintenance alerts via Bouncie webhooks (Phase 4, scope broadly then refine). Registration renewal notifications confirmed — data tracked in Google Sheet ([LA Elite Rentals 2.0](https://docs.google.com/spreadsheets/d/19YtXpZoymtNFaxKLucoz5TUWh-vaTu5dHHcAm59WUSs/edit?usp=sharing)). Total active workflows: 19 across 4 phases.

**2026-02-19:** Automation follow-up call held. Kel chose **Option 2 (Retainer): $1,250 upfront + $350/month for 12 months.** First month total: $1,500. Additional scope: Registration automations and off-grid/border alerts added to Phase 4. Kel expressed strong interest in AI voice agents, website chat AI, and payment email parsing (all future/separate scope). White label discussion introduced. Fiona to send WISE payment link and GHL access instructions. Phase 1 kickoff to be scheduled. See transcript: https://fathom.video/share/DVwJ6NbzMBf4mU-sCrafQgQLVpdN7auk

**2026-02-18:** Kel confirmed via email he wants to proceed with automation/system build out. Fiona attempted phone contact at 773-807-7147 (voicemail) and sent text. Nova sent follow-up email (CC: solutions@aivate.net) clarifying Aivate vs. Scale Virtually scope distinction and Fiona's availability (after 2 PM PT). See `la-elite-rentals-feb18-email-to-kel.md`. **Note:** Dos Espina is no longer with LA Elite Rentals — removed from all future communications and deliverables.

**2026-02-12:** Introduction call held with Dos and Kel (Kel had technical issues, partial attendance). Pitch deck presented. Follow-up email sent with deck link and meeting summary. Proposed follow-up call: Feb 12, 2:30 PM California time. See `la-elite-rentals-feb11-meeting-notes.md` for full notes.

**2026-02-07:** Project resumed. Fiona provided full documentation (SOPs, scripts, templates, processes). Nova compiled 30 automation opportunities and created pitch deck outline. Ready to schedule pitch with Kel.

**2026-02-04:** Project created, paused to prioritize Buster's Industrial demo (Feb 11-12).

---

## Notes

- Scale Virtually is a separate company Fiona works for as a process engineer
- This project originated from Scale Virtually engagement
- Aivate opportunity: Offer GHL automation services
- Kel's team is small (<5 people) — automation would significantly reduce manual work
- **Dos Espina is no longer part of LA Elite Rentals (as of 2026-02-18).** Remove from all future communications, deliverables, and collaterals. Do NOT include in emails or meeting invites.

---

**Created:** 2026-02-04
**Last Updated:** 2026-02-24
**Status:** ACTIVE — PHASE 1 IN PROGRESS
**Current Sprint:** Phase 1: Quick Wins (Feb 24 - Feb 28)
**Next Step:** Share GHL credentials with Marky, send Kel confirmation questions, begin Phase 1 build
**Project Coordinator:** Nova
