# TPS CRM — Training Session Plan & Walkthrough Guide

**Prepared for:** Fiona (Trainer)
**Reference Materials:** Jacob's Pilot Guides (Admin, Manager, Crew) — [Google Drive: TPS Pilot Guides](https://drive.google.com/drive/folders/1iPIvEd040-ElpMYTU-HghOAk0idE_0j5)
**CRM URL:** https://temp-power-system.vercel.app
**Created:** 2026-04-23

---

## Training Overview

Four sessions, each tailored to a specific audience. Every session starts with login and general orientation, then narrows to the sections relevant to that role.

| Session | Audience | Focus | Est. Duration |
|---------|----------|-------|---------------|
| **1** | Everyone (all internal TPS staff) | General CRM navigation — what's available, how to move around | 45–60 min |
| **2** | Chris Yates (+ JB if desired) | Admin/executive sections — dashboard, SOV, change orders, billing, user management | 45–60 min |
| **3** | 7 Managers (Wayne + team) | Manager-level features — jobs, work order scheduling, calendar, crew assignment | 45–60 min |
| **4** | Crew Members | Mobile-first field guide — login, work orders, clock in/out, task completion, photos | 30–45 min |

---

## SESSION 1: General Orientation (Everyone)

**Goal:** Get the entire TPS team comfortable with the CRM. Show them the big picture — what the system does, how to get in, and what they'll see based on their role.

### Walkthrough Flow

#### 1. Welcome & Context (5 min)
- What is this CRM and why it was built
- How it connects to Salesforce (jobs sync automatically from Closed Won opportunities)
- Three access tiers: Admin, Manager, Crew — everyone sees what's relevant to their role
- This is a pilot — feedback is welcome and expected

#### 2. Logging In (5 min)
- **URL:** https://temp-power-system.vercel.app
- **Admin/Manager login:** Email + password (provided by Aivate)
- **Crew login:** Tap "Crew Login" → Employee ID as both username and password (e.g., JORGEAB1)
- Demo: Show both login flows on screen

#### 3. Dashboard Tour (10 min)
- **What it shows:**
  - Jobs by stage (Lead → Quote → Won → Scheduled → In Progress → Complete)
  - Active work orders
  - Pending change orders
  - Today's crew assignments
- **Stage filters:** How to narrow the view
- **Key metrics:** Schedule of Values, remaining to bill, retention pending, reconciliation status
- Point out: Dashboard excludes archived jobs — numbers are always current

#### 4. Jobs Section (10 min)
- All jobs synced from Salesforce appear here
- Click any job to open the detail view
- Inside a job card:
  - SOV (Schedule of Values)
  - Tasks
  - Work orders
  - Attachments & notes
  - Job stages and progression
- Explain: Jobs move through stages as work progresses in the field

#### 5. Work Orders Overview (10 min)
- What a work order is (a specific piece of work under a job)
- How they're created (from the job detail page)
- Key fields: scheduled dates, crew assignment, status, materials
- Work Order Calendar: week/month view, color-coded by status
- Note: "Pending" work orders show on calendar but NOT in crew portal until status changes

#### 6. Crew Portal Preview (5 min)
- Show the mobile view (what crew members will see)
- Today's assignments → tap to open → scope, materials, crew list
- Clock in / clock out flow
- Quick preview only — full training in Session 4

#### 7. Access Tiers Summary (5 min)
- **Admin (Chris):** Full access — dashboard, all jobs, change orders, billing, user management
- **Manager (Wayne + managers):** Jobs, work order scheduling, calendar — no billing/CO approval
- **Crew:** Mobile portal only — assigned work orders, clock in/out, task completion
- Emphasize: Everyone sees what's relevant to their work, nothing more

#### 8. Q&A + Pilot Expectations (5 min)
- During the pilot: Flag anything that's confusing, slow, or missing
- Support channel: Message Cob directly for bugs or questions
- This system is built to improve — their feedback shapes the final product

---

## SESSION 2: Admin/Executive Deep Dive (Chris + JB?)

**Goal:** Walk Chris through every section he has access to as an admin. This is the power-user session — dashboard analysis, job oversight, change order approvals, billing handoff, and user management.

### Walkthrough Flow

#### 1. Dashboard — Reading the Numbers (10 min)
- Live pipeline metrics — what each number means
- Jobs by stage: How to interpret the pipeline at a glance
- Active work orders vs. pending change orders
- Today's crew assignments — real-time field visibility
- Stage filters: Narrowing to specific stages for focused review
- Key distinction: SOV total vs. remaining to bill vs. retention pending

#### 2. Jobs — Full Visibility (10 min)
- Navigating the jobs list
- Filtering by stage, owner, status
- Opening a job card: Full detail view
  - **SOV section:** Line items, phase totals, contract amount validation
  - **Tasks:** Auto-generated and manually created tasks
  - **Work Orders:** All WOs under this job
  - **Attachments:** Documents, permits, contracts
  - **Notes:** Communication trail
- Job stage progression: How jobs move through the pipeline

#### 3. Schedule of Values (SOV) — Deep Dive (10 min)
- How SOV is structured (phases that must total the contract amount)
- Auto-balancing system (the "moneymaker" per Chris's words from the Feb 5 demo)
- Revenue type flags: Billable vs. zero-dollar work orders
- Billing schedule view: List/report format with date grouping, filters (Today / This Week / This Month / Custom)

#### 4. Change Orders (10 min)
- How change orders appear on a job card
- Reviewing a CO: Estimated amount, description, scope
- Approval flow: Click "Approve" → system pushes to Salesforce automatically via n8n
- Parent/child relationship: COs live under the parent job (not as separate jobs like in Salesforce)
- Impact on SOV: How approved COs adjust the contract total

#### 5. Work Order Management (5 min)
- Creating a work order from a job
- Setting scheduled dates
- Assigning a crew (Crew Assignment builder → add by employee ID → set crew lead)
- Work order statuses and what they mean
- Billing handoff: Setting a WO to "Ready" → Finance notified

#### 6. Billing Handoff (5 min)
- When a work order is complete → set billing handoff status to "Ready"
- What happens downstream (Finance notification)
- How this connects to the SOV and reconciliation metrics on the dashboard

#### 7. User Management (5 min)
- How users are created (Aivate handles this during pilot)
- Three tiers: Admin / Manager / Crew
- Credentials: Admin/Manager get email + password; Crew gets Employee ID
- Future state: TPS will be onboarded to create users internally

#### 8. Q&A (5 min)

---

## SESSION 3: Manager Training (7 Managers)

**Goal:** Train the managers on the sections they'll use daily — monitoring jobs, scheduling work orders, managing the calendar, and assigning crews. Narrower scope than admin — no billing, no CO approval.

### Walkthrough Flow

#### 1. Login & Landing (5 min)
- URL + credentials (email/password provided by admin)
- Landing page: Jobs view (not dashboard — manager access)
- Quick orientation: What you can see vs. what's admin-only

#### 2. Jobs View (10 min)
- All jobs synced from Salesforce
- Filtering: By stage, owner, status
- Clicking into a job: What's visible
  - SOV (read-only visibility)
  - Tasks assigned to you or your crew
  - Work orders under this job
  - Notes and attachments
  - Job stage progression
- What to pay attention to: Scheduled work, crew assignments, pending tasks

#### 3. Job Detail — What Managers Can Do (10 min)
- Review SOV, tasks, crew, and schedule
- Read notes and attachments
- Follow jobs through their stages
- Key limitation: Managers can review but not approve change orders or manage billing

#### 4. Scheduling Work Orders (10 min)
- Creating a work order from the job detail page
- Setting scheduled start and end dates (required fields)
- Saving: System auto-assigns a WO number
- Status flow: Pending → Ready for Field Execution → In Progress → Complete
- Pending WOs: Visible on calendar, hidden from crew portal until status changes
- Practical tip: Wayne creates WOs 2-3 weeks ahead — "Pending" status is designed for this workflow

#### 5. Work Order Calendar (10 min)
- Week and month views
- Color-coded by status
- Drag-and-drop to reschedule
- How to spot conflicts: Overlapping crew assignments, double-bookings
- Materials visibility: What materials/equipment are needed per WO

#### 6. What to Flag During the Pilot (5 min)
- Missing jobs (should have synced from Salesforce but didn't)
- Scheduling conflicts the calendar doesn't catch
- Numbers that look off in SOV or WO details
- Anything slow, confusing, or that requires too many clicks
- Support: Message Cob directly

#### 7. Q&A (5 min)

---

## SESSION 4: Crew Training (Crew Members)

**Goal:** Get crew members comfortable with the mobile app. This is the simplest session — login, find your work orders, clock in, do the work, clock out. Mobile-first, field-friendly.

### Walkthrough Flow

#### 1. What This App Is (3 min)
- Your daily work orders, on your phone
- Replaces paper work orders and text message coordination
- You'll see exactly what you need to do, where, and with what materials

#### 2. Login (5 min)
- **URL:** https://temp-power-system.vercel.app
- Tap "Crew Login"
- **Username:** Your Employee ID (e.g., JORGEAB1)
- **Password:** Same as your Employee ID
- Tap "Sign In"
- **Live demo:** Walk through this on a phone, not just a screen share
- Common issue: If the app doesn't load, close and reopen the browser

#### 3. Your Work Orders (5 min)
- After login: Today's assignments appear
- Tap a work order to open it
- What you'll see:
  - Job address (where you're going)
  - Scope of work (what you're doing)
  - Materials list (what you need to load)
  - Assigned crew (who you're working with)
  - Customer name

#### 4. Clock In (5 min)
- On the work order, tap "Clock In"
- System records your GPS location and start time
- **Important:** Clock in BEFORE you start work, not after
- If clock-in fails: Screenshot the error, message your crew lead

#### 5. Doing the Work (5 min)
- Review the scope and materials list on your phone
- Mark tasks complete as you go
- Upload photos if requested (helps the office close out faster)
- If you need to do work that's not on the scope — notify your lead first

#### 6. Clock Out (5 min)
- When you're done: Tap "Clock Out"
- Confirm the total hours shown are correct
- Tap "Submit"
- **Important:** Clock out WHEN you're done, not later — timestamps matter for billing
- Do NOT start another job until your lead confirms

#### 7. Quick Reminders (2 min)
- Login = Employee ID (same for username and password)
- Clock in BEFORE work
- Clock out WHEN done
- Photos help the office close out faster
- Problems? Message your crew lead, not the office

#### 8. Q&A (5 min)
- Keep it practical — let them try logging in on their own phones during the session

---

## Scheduling Recommendations

| Session | Suggested Order | Notes |
|---------|----------------|-------|
| **Session 1 (General)** | First | Sets the foundation — everyone understands what the system is |
| **Session 2 (Chris/JB)** | Second | Admin deep dive — Chris should be comfortable before managers train |
| **Session 3 (Managers)** | Third | Managers need to be set up before crew, since they create WOs |
| **Session 4 (Crew)** | Last | Crew training is simplest but depends on managers having WOs ready |

**Spacing:** Recommend at least 1 day between sessions so each group can practice before the next one trains.

---

## Reference Materials

| Document | Location | Audience |
|----------|----------|----------|
| TPS — Admin Guide (Pilot) | [Google Drive](https://docs.google.com/document/d/1OqswyhmM1N8spGOkplM1FnivsHdaXO2OJwy-vEGHybQ/edit) | Chris / JB |
| TPS — Manager Guide (Pilot) | [Google Drive](https://docs.google.com/document/d/13uzBYrTsn5wZgRYeetNU5Ckwln8EGx6TyKCSEYFYCmM/edit) | 7 Managers |
| TPS — Crew Field Guide (Pilot) | [Google Drive](https://docs.google.com/document/d/1o8H4yOWGLJxrmCC2zJnrJCCWcJDDon9TKQ7psi67y4Y/edit) | Crew Members |

These guides can be shared with attendees after each session as follow-up reference material.
