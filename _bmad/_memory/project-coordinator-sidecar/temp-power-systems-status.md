# Temp Power Systems - Project Status

**Project Name:** Temp Power Systems
**Client:** Temp Power Systems
**Phase:** Deliver (Pilot Preparation)
**Status:** Active Development
**Started:** November 2025
**Last Updated:** 2026-05-22 (Nova — Processed full CRM Set-Up transcript from May 21. Live data audit conducted: ~15-20 jobs processed, 2 archived, several reclassified. Audit workflow established. Next sessions: Tue/Wed/Thu May 27-29. New bug found: SOV cents rounding. Duplicate reconciliation needed. Fathom: https://fathom.video/share/b2o3UrwrdzPckY-Lv97sxk6xx6DnAbqe)

---

## Latest Update - May 22, 2026

### CRM DATA AUDIT — FULL TRANSCRIPT PROCESSED

**Attendees:** Chris Yates, Angela Vaughn-Richey, Sandra Morales, Fiona, Cob/Jacob
**Recording:** [CRM Set-Up — May 21 (~2 hrs)](https://fathom.video/share/b2o3UrwrdzPckY-Lv97sxk6xx6DnAbqe)

**What happened:**
- Live CRM job audit — worked through Wayne's folder to verify, correct, and reclassify jobs across pipeline stages
- ~15-20 jobs processed, 2 closed to Archive (Clifton Hills Estates, Starbucks Alhambra), several moved to Maintenance
- Numerous duplicates identified (from CSV backfill)
- Cob deployed Archive status option and fixed bugs live during the call

#### Audit Workflow Established
1. Work exclusively from Wayne's folder
2. Check "Any" filter for duplicates
3. Fiona assigns all duplicate (backfilled/yellow) jobs to herself
4. Move audited jobs to Chris's bucket to track progress

#### Key Decisions
- **Got Job** = has contract, no work started, not yet scheduled
- **Get Ready** = permitting, utility setup, contract requirements, equipment procurement
- **Execution** = job is scheduled and actively being worked
- **Maintenance** = all contract work billed; only rental/PO extra work remains
- **Archive** = job fully finished and billed
- **SOV cents:** Team wants cents displayed and calculated accurately — do NOT round
- **Default assignment:** All new jobs default to Wayne's bucket

#### Next Audit Sessions (Chris's time / PST)
- **Tue May 27:** 10:00 AM – 12:00 PM
- **Wed May 28:** 10:00 AM – 12:00 PM
- **Thu May 29:** 2:00 PM – 4:00 PM

#### New Bug: SOV Cents Rounding (Issue #10)
- SOV calculation rounds to nearest dollar, creating discrepancies
- Save button disabled with "Save Disabled Until SOV Balances with Contract Amount"
- Discovered on Malia Holmes / Alara job
- Assigned to Cob

#### Additional Action Items from Audit
| # | Action | Owner | Priority |
|---|--------|-------|----------|
| 21 | Assign all CRM duplicate jobs to self + reconcile with Cob's 58-item list | Fiona | HIGH |
| 22 | Move ~20 completed Get Ready jobs to Angela's bucket for SOV work | Sandra | HIGH |
| 23 | Complete SOVs for jobs in her bucket, then move to Chris's bucket | Angela | HIGH |
| 24 | Fix SOV cents rounding — blocks saving on some jobs | Cob | HIGH |
| 25 | Salesforce IP whitelisting — get Fiona's access set up properly | Chris | MEDIUM |
| 26 | Build Salesforce link feature for master contracts in CRM | Cob | MEDIUM |
| 27 | Work orders feature rollout — planned for week of May 27 | Fiona/Cob | MEDIUM |

---

## Previous Update - May 21, 2026

### CRM SET-UP SESSIONS (Two Sessions: AM + PM) — 9 ISSUES IDENTIFIED

**Attendees:** Chris Yates, Angela Vaughn-Richey, Sandra Morales, Fiona
**Recording:** [CRM Set-Up — May 21 (65 min)](https://fathom.video/share/dq6wf8fyTacxr3gDT8YBtzBRfu973Eaj)

**What was demonstrated (working):**
- Contracts & Compliance section — 4-category document upload (Contract, Insurance Certificate, Billing Information, Purchase Order) now functional
- Deposit Required badge — changed from red to neutral yellow
- Task management — task creation, assignment, bell notification, profile task list, status filtering, task preview on pipeline view all working
- SOV Remaining to Schedule — auto-calculation live and working
- CSV backfill — 369 total jobs now in CRM (up from 251), cross-matched with Salesforce

#### All Issues Identified — May 21

| # | Issue | Severity | Description |
|---|-------|----------|-------------|
| 1 | **Job deletion blocked + admin-only guardrail** | CRITICAL | Backfilled duplicate job cards (from CSV import) cannot be deleted by ANY user. Chris and Fiona both attempted to delete the PIH Whittier duplicate — system returned "Failed to delete job. Method not allowed." This is a code-level blocker. Once fixed, deletion must be restricted to admin-only: **only Chris, Fiona, and Justin** can delete job cards. Non-admins should not see or access a delete option. The edit and delete buttons are also too close together — easy to accidentally hit delete instead of edit. |
| 2 | **Contract file uploads not persisting / disappearing** | CRITICAL | Sandra uploads a contract file, but it either: (a) doesn't appear for other users until she uploads it a second time, or (b) disappears entirely even after re-uploading. No save button exists after upload — it should auto-persist. Sandra should never have to re-upload. Files must persist immediately and reliably for all users on the first attempt, regardless of file size. |
| 3 | **SOV retention row — full logic overhaul needed** | CRITICAL | This is NOT isolated to job 84852 — it affects ALL job cards. The retention row in the SOV section has multiple issues: (a) the delete button is disabled/grayed out — users cannot remove a retention row once added; (b) retention must **add to the contract amount**, not just display as a line item; (c) the **Scheduled Value field** must be open and editable by the user; (d) the **Invoice Value field** must be open and editable by the user. Retention needs to integrate into the full SOV calculation flow (contract amount → scheduled → invoiced → remaining to bill). This requires a logic overhaul, not just a UI fix. |
| 4 | **Task deletion guardrail — assigner-only delete** | HIGH | Only the person who ASSIGNED a task should be able to delete it. Not the assignee, not anyone else. Chris: "The person assigning the task should be the only person to delete it... that could very quickly become an 'oh I didn't get your email' thing." |
| 5 | **Old document checklist on backfilled cards** | HIGH | Some job cards (from CSV backfill) still show the OLD 3-document checklist (Contract/PO, Insurance, Billing Information) instead of the updated 4-item checklist (Contract, Insurance Certificate, Billing Information, Purchase Order). ALL job cards — regardless of stage or source — must have the 4-document checklist. |
| 6 | **10MB file upload limit** | HIGH | Users cannot upload files exceeding 10MB. Workaround options: (a) increase the upload size limit in the CRM, OR (b) allow users to paste a **link** (e.g., to the Salesforce opportunity document) in addition to uploading a file. Sandra should be able to either upload a file OR paste a document link for each checklist item (Contract, Insurance Certificate, Billing Information, Purchase Order). |
| 7 | **Pipeline filters not persisting across navigation** | HIGH | When a user applies a filter on the Jobs Pipeline page (e.g., Project Manager = Wayne), opens a job card, then navigates back — the filter is cleared. Users have to re-apply filters every time they return from viewing a job card. Chris flagged this as a significant daily pain point, especially during the sanitization exercise. |
| 8 | **Retention filter not pulling correct records** | MEDIUM | On the Jobs Pipeline page, filtering by "has retention" does not return the correct job cards. Jobs with retention rows in their SOV are not being pulled by this filter. All pipeline filters should be validated to ensure they return accurate data. |
| 9 | **Notification bell requires real-time push** | MEDIUM | Task assignment notifications only appear in the bell icon after the user manually refreshes the page. Notifications should be real-time push — no refresh needed. Users must see new task assignments immediately without having to remember to refresh. |

#### Jacob Action Items from May 21 Sessions

| # | Action | Priority |
|---|--------|----------|
| 12 | **Fix job deletion + implement admin-only guardrail** — The "Method not allowed" error must be resolved first. Backfilled CSV jobs cannot be deleted by anyone. Fix the underlying deletion logic, then restrict delete permissions to Admin users only (Chris, Fiona, Justin). Remove the delete option from the 3-dot menu for non-admins. Test by deleting the PIH Whittier duplicate. | CRITICAL |
| 13 | **Fix contract/document upload persistence** — Investigate why uploaded files sometimes don't appear or disappear. Uploads must persist immediately and reliably for all users on the first attempt. No re-upload should ever be necessary. | CRITICAL |
| 14 | **SOV retention row — full logic overhaul** — This affects ALL job cards, not just one. Fix: (a) enable delete button on retention rows, (b) retention must add to the contract amount, (c) Scheduled Value field must be open/editable, (d) Invoice Value field must be open/editable. Retention must integrate into the full SOV calculation flow (contract amount → scheduled → invoiced → remaining to bill). | CRITICAL |
| 15 | **Implement task deletion guardrail** — Only the person who ASSIGNED a task can delete it. The assignee and other users should not see a delete option on tasks they did not create. | HIGH |
| 16 | **Migrate all job cards to 4-document checklist** — Ensure every job card (including CSV backfill imports) has: Contract, Insurance Certificate, Billing Information, Purchase Order. Fix the data for existing cards, not just new ones. | HIGH |
| 17 | **Increase file upload limit OR add document link option** — Either raise the 10MB upload cap, or add the ability to paste a URL/link to documents in each checklist item as an alternative to file upload. Ideally both. | HIGH |
| 18 | **Persist pipeline filters across navigation** — When a user applies a filter and opens a job card, the filter state must be preserved when they navigate back. | HIGH |
| 19 | **Fix retention filter on pipeline page** — The "has retention" filter is not pulling correct job cards. Validate ALL pipeline filters to ensure they return accurate records matching the filter criteria. | MEDIUM |
| 20 | **Implement real-time push notifications** — Notification bell must update in real-time when a task is assigned. No page refresh should be required. | MEDIUM |

#### Other Action Items from May 21 Sessions

| # | Action | Owner | Priority |
|---|--------|-------|----------|
| A | **Schedule Salesforce-Zapier reconnect session** — Jacob + Chris need to reconnect the API key so jobs auto-sync from Salesforce to CRM again. Jacob got kicked out due to Salesforce security settings. | Jacob + Chris | HIGH |
| B | **Schedule Permits & Utilities scope session with Wayne** — Wayne said there's a lot missing. Chris wants to talk to Wayne before any dev work. Target: next week, after Angela & Sandra are rolling. Mark and Wayne are the next users to onboard. | Fiona | MEDIUM |
| C | **Upload insurance certificates to CRM** — Fiona now has access to Sandra's folder (TPS Renewal Certificates). Fiona to download, organize, and upload COIs to each job card in the CRM. | Fiona | MEDIUM |
| D | **Supabase data recovery reminder** — Chris informed that accidental deletions can be recovered by emailing solutions@aivate.net. Supabase retains data. | Info only | — |

---

## Previous Update - May 16, 2026

### FIONA/COB CRM REVIEW CALL — 5 ITEMS TESTED

| # | Test Area | Result | Notes |
|---|-----------|--------|-------|
| 1 | **SOV Remaining to Schedule** | PASS | Auto-calculation reinstated in SOV summary area. Remaining to bill also works. Minor caching issue — use Cmd-Shift-R or incognito to force refresh. |
| 2 | **Purchase Order Separate Section** | FAIL — BUG | PO section separated (layout approved), but uploaded PO files don't persist after save. "No purchase order item in checklist" error. |
| 3 | **Pre-Lien Documents Upload** | PASS | Stackable uploads, instant-display, multiple files — working correctly. This is the reference design for PO/contract uploads. |
| 4 | **Deposit Status Color** | FAIL — NEEDS FIX | "Deposit Required" badge shows red, alarming the client. Decision: remove color entirely, use neutral/default style like "Pending." |
| 5 | **Task Management** | FAIL — CRITICAL | Tasks only visible to creator. Other users (e.g., Chris) cannot see tasks assigned to them. Notifications not firing. |

#### Cob Action Items from May 16 Call

| # | Action | Priority |
|---|--------|----------|
| 1 | **Fix PO upload persistence** — apply same upload logic from pre-lien/accounting docs (stackable, instant-display) to PO section | HIGH |
| 2 | **Remove "Documents Upload" section from Edit view** — redundant, docs accessible from front view | MEDIUM |
| 3 | **Rename "Contract PO" to "Contract"** — PO now has its own section | MEDIUM |
| 4 | **Add upload button on front view** for contracts and insurance certificates (match accounting docs pattern) | HIGH |
| 5 | **Text-wrap document file names** so delete button stays visible without horizontal scrolling | MEDIUM |
| 6 | **Remove red color from Deposit Required badge** — use neutral style | MEDIUM |
| 7 | **Fix task visibility** — tasks must be visible to ALL managers, not just the creator | CRITICAL |
| 8 | **Notification bell for task assignment** — bell must fire when someone is assigned a task | CRITICAL |
| 9 | **Tasks in assignee's profile** — assigned tasks must appear in the user's task management/profile section (two display locations: bell + task management page) | CRITICAL |
| 10 | **Add Fiona as a user** in the system so she can be assigned tasks | HIGH |
| 11 | **Audit Supabase free tier** — assess usage, flag when upgrade is needed. Aivate will cover cost, reimburse from Chris. BAA not needed (no healthcare data). | MEDIUM |

---

## Project Overview

**Strategy:** Simulator-First Approach
1. Marky builds simulator for client demonstrations
2. Client reviews and approves functionality in simulator
3. Cob integrates approved features into real CRM
4. Pilot launch with real CRM

**GitHub Repository (latest):** https://github.com/aivaterepositories/temp-power-system-true-final-version-truest-true-version-last
**Previous Repository:** https://github.com/aivaterepositories/temp-power-final-version-for-real

---

## Team Assignments

| Team Member | Role | Current Work |
|-------------|------|--------------|
| **Marky** | Developer | ✅ All 4 revisions pushed (2026-03-15) — 🔴 Fiona re-review required |
| **Cob** | Lead Developer | 🔴 **Login/Auth + Mobile Audit** assigned (Mar 20) — 11 pending backend tasks total |
| **Fiona** | PM/Coordinator | 🔴 Re-review needed — Marky's 4 revisions pushed to new repo |

---

## Current Sprint - Final Integration & Pilot Prep

**Sprint Goal:** Complete Salesforce integration, implement final UI tweaks, prepare for end-of-February pilot launch

**Sprint Status:** Week of Feb 2, 2026 - ON TRACK

### Active Tasks

#### 1. Salesforce Integration & Backend (Cob) — ✅ MAJOR MILESTONE COMPLETE
- **Status:** ✅ Core backend complete as of 2026-03-17
- **Goal:** Complete Salesforce API integration and enable live data sync
- **Phase:** Deliver - Integration Setup
- **Priority:** CRITICAL (blocking pilot)
- **Progress:** See full breakdown below ↓

#### 2. Simulator UI Refinements (Marky)
- **Status:** In Progress
- **Goal:** Implement final UI tweaks from Jan 7 meeting
- **Phase:** Deliver - Final Polish
- **Priority:** HIGH
- **Items:**
  - Crew portal work order sequencing (drag-and-drop)
  - Multi-crew assignment capability
  - Individual crew member timestamps
  - Work order PDF export with signatures

#### 3. Real CRM Deployment Prep (Cob/Jacob)
- **Status:** In Progress
- **Goal:** Prepare live CRM for pilot launch
- **Phase:** Deliver
- **Progress:** 95% front-end complete, back-end automation in progress
- **Notes:** Client extremely satisfied, on track for February pilot

#### 4. Lists Collection (BLOCKED - Waiting on Client)
- **Status:** Blocked - Awaiting Chris
- **Goal:** Receive skills list and materials/equipment list
- **Phase:** Deliver - Data Setup
- **Priority:** HIGH
- **Blocking:** Auto-suggest functionality for crew assignment and materials
- **Items Needed:**
  - Skills list (Electrician, CPR, OSHA 300, all certs)
  - Materials/equipment list (250-1,000 items)

---

## Latest Update - March 17, 2026

### ✅ COB — BACKEND MILESTONE COMPLETE

**Completed by:** Cob | **Date:** 2026-03-17

#### ✅ COMPLETED — Backend Tasks

| Task | What Was Built |
|------|---------------|
| **DB Schema** | `jobs`, `work_orders`, and related tables deployed to Supabase |
| **All API Routes** | `/api/jobs/create`, `/api/jobs/update`, `/api/work-orders/create`, `/api/work-orders/update` |
| **DataContext Migration** | Frontend migrated from `useState` to live Supabase queries |
| **SF Inbound Webhook** | `/api/webhooks/salesforce-job` — receives Closed Won from n8n, maps 21 SF fields, inserts to Supabase with dedup |
| **SF Outbound Push** | `/api/salesforce/push-change-order` — CO Stage 4 approved → posts to n8n → updates SF Opportunity Amount |
| **n8n WF1 (Poller)** | Polls SF every 5 min for Closed Won, HMAC signs payload, POSTs to webhook |
| **n8n WF2 (CO Approved)** | Receives CO approval, updates SF Opportunity Amount |
| **SF Field Mapping** | Verified against live SF org — address fields, `Job_Status__c`, `Job_Type__c`, `Utility_Company__c` |
| **Dashboard Metric Fix** | Archived jobs excluded from all dashboard calculations |
| **Pending WO Status** | Pending WOs hidden from crew portal, visible on calendar only |
| **Task #2 (Change Order + SF)** | Complete end-to-end |

#### 🔴 PENDING — Backend Tasks (Cob)

| Task | Notes |
|------|-------|
| **🔴 Login/Auth System** | **HIGH PRIORITY — ✅ RBAC SPEC APPROVED BY FIONA (Apr 23, 2026).** See RBAC Decision Record below. Ready for Cob to implement. |
| **🔴 Mobile Compatibility Audit** | **NEW — HIGH PRIORITY.** Audit and fix mobile responsiveness across all CRM views. Users (especially crew) will be on mobile in the field. Test all key flows on mobile devices. |
| **Task #5 — Crew Portal Dashboard** | Hours, pay calc, open/completed WO counts per crew member |
| **Task #8 — WO Calendar** | Backend queries for calendar view |
| **Multi-crew timestamps per WO** | Per-crew-member time in/out records |
| **Sitemap field auto-populate** | Job-level sitemap → inherit to all child WOs |
| **SF Contact Roles** | Pull POC contacts from SF into WO creation |
| **SF Permit fields** | iPermit link + dig alert fields — 🚫 BLOCKED: need field names from Wayne |
| **CO Parent/Child logic** | Prevent duplicate jobs from child SF opportunities |
| **SOV validation** | Phases must total contract amount before save |
| **Task Automation Engine** | Auto-tasks triggered by job events |

**🔴 BLOCKER:** SF Permit fields blocked — need Wayne to provide iPermit link + dig alert field names from Salesforce.

---

## RBAC Decision Record — Approved April 23, 2026

**Approved by:** Fiona
**Status:** Ready for Cob to implement

### Three-Tier Access Split

| Tier | Login Method | Pages | Permissions |
|------|-------------|-------|-------------|
| **Admin** | Email + password (provisioned by Aivate) | Dashboard, Jobs, Job Detail, WO Detail, WO Calendar, WO Schedule, Materials Report, People Management, Profile | Full access — SOV, CO approval, billing handoff, user management, edit job details |
| **Manager** | Email + password (provisioned by Aivate) | Dashboard, Jobs, Job Detail, WO Detail, WO Calendar, WO Schedule, Materials Report, People Management, Profile | View dashboard metrics, view people management, **edit job details**, create/schedule WOs, assign crews — **NO** CO approval, **NO** billing handoff, **NO** user management |
| **Crew** | Employee ID as username AND password (e.g., JORGEAB1) | Crew Dashboard, Crew Work Orders, Profile | View assigned WOs only, clock in/out, mark tasks complete, upload photos — mobile-first |

### Key Decisions

1. **Page-level split confirmed** — as mapped above
2. **Credential provisioning** — Aivate controls all user creation for pilot (no self-registration). TPS team to be onboarded for user management post-pilot.
3. **Crew login** — Employee ID serves as both username and password
4. **Manager permissions clarified:**
   - Managers **CAN** see the Dashboard
   - Managers **CAN** see People Management
   - Managers **CAN** edit job details
   - Managers **CANNOT** approve change orders
   - Managers **CANNOT** manage billing/handoff
   - Managers **CANNOT** create/manage user accounts

---

## Previous Update - March 15, 2026

### ✅ MARKY REVISIONS COMPLETE — FIONA RE-REVIEW NEEDED

Marky pushed all 4 revisions from Fiona's Feb 27 audit to the new repo:
**https://github.com/aivaterepositories/temp-power-system-true-final-version-truest-true-version-last**

| # | Task | Status |
|---|------|--------|
| 2 | Daily/Weekly Materials Report | ✅ PUSHED — needs Fiona verification |
| 3 | Customer Name visible in Crew Portal WO view | ✅ PUSHED — needs Fiona verification |
| 4 | POC Dropdown in Work Order Creation | ✅ PUSHED — needs Fiona verification |
| 5 | Sitemap Link as tappable hyperlink | ✅ PUSHED — needs Fiona verification |

**🔴 NEXT STEP: Fiona to review Marky's pushed revisions before next demo with Wayne/Chris.**

---

## Previous Update - February 27, 2026

### 🟡 FIONA REVIEW COMPLETE — 4 REVISIONS FOR MARKY

Fiona completed her audit of Marky's 7 tasks. 3 approved, 4 need revisions.

**Fiona's Loom Audit:** [Part 1](https://www.loom.com/share/0759be0050cb426ebce49141201526610) | [Part 2](https://www.loom.com/share/09e5e2901673421ea3c33e392aff83cb)

| # | Task | Priority | Status | Fiona's Note |
|---|------|----------|--------|--------------|
| 1 | Revamp Billing Schedule View | HIGH | ✅ APPROVED | — |
| 2 | Build Daily/Weekly Materials Report | HIGH | 🔴 REVISION | Can't find it — confirm location or build |
| 3 | Add Crew Portal Fields (Customer Name) | HIGH | 🔴 REVISION | Customer name not visible in crew portal WO view |
| 4 | Add POC Dropdown in Work Order Creation | MEDIUM | 🔴 REVISION | No dropdown/field for POC name when creating WO |
| 5 | Add Sitemap Link at Job Card Level | MEDIUM | 🔴 REVISION | Field exists but must be a tappable hyperlink, not plain text |
| 6 | Add Pending Work Order Status | MEDIUM | ✅ APPROVED | — |
| 7 | Revenue Type Flag on Billing Schedule | MEDIUM | ✅ APPROVED | — |

**REVIEWED BY:** Fiona | **DATE:** 2026-02-27
**🔴 MARKY — 4 items require fixes before next demo with Wayne/Chris**

**Details:** See `temp-power-systems-feb11-action-items.md` for full revision specs.

---

## Previous Update - February 5, 2026

### CRM Demo with Chris Yates
**Full walkthrough completed** - Crew Portal deferred to Monday meeting with Wayne

### 🚨 Critical Gap Identified: Materials ↔ Work Orders Link
Mark (shop/production) cannot see what materials are needed per work order. Chris emphasized this is "the part that makes a job fail or succeed."

### MARKY - New Tasks (CRITICAL) - ✅ ALL COMPLETED

| # | Task | Priority | Status |
|---|------|----------|--------|
| 1 | **Implement notification bell** for task assignments and @mentions | HIGH | ✅ COMPLETED |
| 2 | **Link materials to work orders** - create relation | CRITICAL | ✅ COMPLETED |
| 3 | **Add "Work Order" column in Materials Builder** | CRITICAL | ✅ COMPLETED |
| 4 | **Show materials list in Work Order detail view** | CRITICAL | ✅ COMPLETED |

**COMPLETED BY:** Marky | **DATE:** 2026-02-05
**🔴 FIONA REVIEW REQUIRED** - All 4 tasks ready for validation before Monday demo

**Details:** See `temp-power-systems-crm-demo-feb5.md` for full meeting notes.

### Next Meeting: Monday Feb 10, 2026 @ 2 PM
**Attendees:** Chris, Wayne, Fiona
**Agenda:** Pilot walkthrough, Crew Portal review, Data migration strategy

---

## Previous Update - February 2, 2026

### Meeting Transcript Analysis Complete
**4 meetings processed:** Nov 20, Dec 4, Dec 10, 2025; Jan 7, 2026

### Audit Findings Received from Fiona
**7 items identified** for implementation in simulator
**Status:** Skills/materials lists received from Chris (UNBLOCKED)

### Current Project State
- **Front-End:** 95% complete, audit findings being addressed
- **Back-End:** Salesforce integration mapping complete, ready for deployment
- **Client Satisfaction:** Extremely high ("everything we imagined and then some")
- **Timeline:** ON TRACK for end-of-February pilot launch
- **New Blocker:** Change order SOP needed from Fiona

### Key Achievements Since Kickoff
1. ✅ Dashboard with real-time KPIs finalized
2. ✅ Job card with compartmentalized sections complete
3. ✅ Schedule of Values auto-balancing system (client: "moneymaker")
4. ✅ Crew portal with e-signature capture working
5. ✅ Materials & Work Order Builder workflow implemented
6. ✅ Task management with auto-generation complete
7. ✅ PDF export for job cards and work orders
8. ✅ Three-tier access system (Admin/Manager/Crew)
9. ✅ Salesforce data fetch completed
10. ✅ Archive stage for closed projects added

### Outstanding Items
**High Priority:**
- Skills list from Chris (for crew assignment auto-suggest)
- Materials/equipment list from Chris (for procurement auto-suggest)
- Crew portal sequencing implementation (drag-and-drop)
- Multi-crew assignment with individual timestamps
- Back-end automation deployment

**Medium Priority:**
- Work order calendar view (Salesforce-style)
- Training module creation for pilot
- People Management module (separate proposal pending)

### Next Actions
1. **Fiona:** Follow up with Chris for outstanding lists
2. **Marky:** Implement crew portal sequencing and multi-crew assignment
3. **Cob/Jacob:** Complete back-end Salesforce automation mapping
4. **Team:** Prepare for pilot phase (end of February)
5. **Nova:** Schedule next demo coordination meeting

---

## Project Timeline

**November 2025** - Project kickoff
**Current (Feb 2026)** - Tail end of simulator, preparing for CRM pilot
**Next Milestone** - Client approval of simulator
**Target** - CRM pilot launch (date TBD)

---

## Key Decisions & Context

### Simulator-First Strategy
- Lower risk approach - validate with client before production build
- Allows iterative feedback without touching production CRM
- Marky focuses on UX/client satisfaction
- Cob focuses on robust production implementation

### Integration Architecture
- Salesforce webhook provisioning required
- Technical approach owned by Cob
- Details pending technical planning

---

## Risks & Blockers

| Risk | Impact | Mitigation | Owner |
|------|--------|-----------|-------|
| Client approval delays | Timeline slip | Regular demo cadence, clear approval criteria | Fiona |
| Salesforce integration complexity | Pilot delay | Early technical planning, test environment | Cob |
| Simulator-to-CRM feature parity | Rework | Clear requirements tracing | Marky + Cob |

---

## Next Actions

1. **Marky:** Continue simulator development for client demos
2. **Cob:** Technical planning for Salesforce webhook provisioning
3. **Fiona:** Coordinate client approval sessions
4. **Team:** Sync on simulator approval status and CRM readiness

---

## Communication Cadence

- **Daily Standups:** (TBD - establish rhythm)
- **Client Demos:** As simulator features complete
- **Sprint Reviews:** (TBD - establish sprint length)
- **Retrospectives:** After pilot launch

---

**Notes:**
- Project has been running since Nov 2025, now formalizing ORBIT tracking
- Dual-track approach: Simulator (Marky) + Real CRM (Cob)
- Critical path: Client approval → Salesforce integration → Pilot launch
