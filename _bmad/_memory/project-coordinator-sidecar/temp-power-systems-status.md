# Temp Power Systems - Project Status

**Project Name:** Temp Power Systems
**Client:** Temp Power Systems
**Phase:** Deliver (Pilot Preparation)
**Status:** Active Development
**Started:** November 2025
**Last Updated:** 2026-06-17 (Nova — Materials Report patch shipped: 5 bug fixes (need-by date timezone shift, ETA-not-saving on On Order, global California time, notes visible without Edit, scrollable materials dropdown) + 4 feature updates (type quantities directly, custom Unit of Measure, change status from Materials Report row, simplified status labels: Needs to Order->Pending, Procured/On Order->On Order). Delivered to client; more feedback expected. See temp-power-systems-dev-report-jun17.md. Prior: 2026-05-22 — Processed full CRM Set-Up transcript from May 21. Live data audit conducted: ~15-20 jobs processed, 2 archived, several reclassified. Audit workflow established. Next sessions: Tue/Wed/Thu May 27-29. New bug found: SOV cents rounding. Duplicate reconciliation needed. Fathom: https://fathom.video/share/b2o3UrwrdzPckY-Lv97sxk6xx6DnAbqe)

---

## Latest Update - June 17, 2026

### MATERIALS REPORT PATCH — SHIPPED (5 fixes + 4 updates)

**Module:** Materials Report / materials-procurement
**Status:** Delivered to client. More feedback expected; follow-up patch to come.
**Full notes:** `temp-power-systems-dev-report-jun17.md`

**Bug Fixes**
1. **Need-by date wrong day** — system shifted dates back one day in some views; corrected so the entered date shows everywhere. No more project-view vs. Materials Report mismatch.
2. **ETA not saving on "On Order"** — editing a material with a saved ETA showed a blank field and save erased it; ETAs now load and persist.
3. **Global California time** — dates and the Overdue flag varied by user location; all dates now display in Pacific time for every user (Wayne and Fiona see the same date).
4. **Notes visible without Edit** — notes were hidden behind the Edit screen; now shown directly in the materials list per project.
5. **Materials dropdown scrollable** — full match list now scrolls via mouse wheel / keyboard.

**Feature Updates**
1. **Type quantities directly** — removed the up/down stepper; type the number straight in.
2. **Custom Unit of Measure** — type any unit instead of picking from a limited dropdown.
3. **Change status from the Materials Report** — per-row status dropdown; no need to open each job.
4. **Simplified status labels** — "Needs to Order" -> **Pending**; "Procured or On Order" -> **On Order**; Ready and Unknown unchanged.

---

## Latest Update - June 16, 2026

### WORK ORDER COORDINATION CALL

**Attendees:** Chris Yates, Wayne McCoy, Fiona Cafe
**Recording:** https://fathom.video/share/54dxcPJng64fLvxbJAatyGR7u_fz29hn
**Duration:** 98 min

#### What Happened

Fiona walked Chris and Wayne through the work order creation flow, work order calendar, billing schedule, crew portal, and work order statuses. Wayne demonstrated his current Salesforce scheduling workflow (list-based day view) and identified gaps in the CRM. Chris decided to consolidate Billing Schedule into Work Order Calendar. Test work orders were created on Prime Ventures and Gables. Crew portal was tested with Jorge's account — rendering delays and missing Google Maps were found.

#### Key Decisions

1. **Delete Billing Schedule entirely** — all functionality (list, table, export, filtering) moves to Work Order Calendar
2. **Work Order Calendar = list-first** — list view is default, calendar month view is collapsible/optional, day view available
3. **Keep all current WO statuses for now** — Pending, Ready for Field Execution, Field Execution Complete, Approved for Billing, Return for Revision, Invoiced/SOV (renamed). Pending Manager Review stays for evaluation.
4. **Rename "Invoiced/Needs Reconciliation"** → **"Invoiced/SOV"**
5. **Sitemap = dedicated field** in work order form (not Safety Notes)
6. **Remaining-to-bill per lane** on dashboard (Chris request, not highest priority)
7. **Salesforce migration still blocked** — Chris working with Salesforce on security/fraud alert issue preventing job transfers

#### Fixes Identified — Email Sent to Cob (June 16)

| # | Fix | Priority | Details |
|---|-----|----------|---------|
| 1 | Delete Billing Schedule, move to WO Calendar | CRITICAL | Remove section entirely, relocate all functionality |
| 2 | WO Calendar: list-first, collapsible calendar | CRITICAL | List = default, calendar = collapsible, add day view + table toggle + export |
| 3 | Add columns to WO Calendar list | CRITICAL | Opportunity Name, Site Location, Customer Contact (name + phone), Execution Notes |
| 4 | Crew Portal: fix WO rendering delay | CRITICAL | 2-3 min delay before assigned WOs appear. Same root cause as prior contracts/SOV delay fix |
| 5 | Crew Portal: show Google Maps | CRITICAL | Embedded map from site address. Currently not rendering |
| 6 | Crew Portal: sitemap link as hyperlink | CRITICAL | Currently plain text. Must be clickable, open in new tab |
| 7 | Add Sitemap field to WO form | CRITICAL | Dedicated field for sitemap PDF link (not in Safety Notes) |
| 8 | Rename status to "Invoiced/SOV" | HIGH | Replace "Invoiced/Needs Reconciliation" |
| 9 | Dashboard: remaining-to-bill per lane | HIGH | Show totals in Got Job, Get Ready, Execution lane headers |
| 10 | Bulk materials-to-WO assignment | ENHANCEMENT | Select multiple materials → assign to one WO (like bulk need-by-date) |

#### Test Data to Clean Up

- 2 test work orders on Prime Ventures ($1K + $1.5K, June 15)
- 1 test material on Prime Ventures
- 1 test work order on Gables (Run Power to Lift Station, created by Wayne)

#### Upcoming Sessions

- **Wednesday June 18** — Live implementation session with Wayne + Mark (afternoon, ~same time)
- **Friday June 20** — Live implementation session with Wayne + Mark (afternoon, ~same time)
- **Goal:** Load next 2 weeks of real work orders into CRM, test full workflow end-to-end

#### Salesforce Migration — Still Blocked

- Majority of jobs scheduled for this week and next are NOT in CRM yet due to Salesforce security issue
- Chris emailed Salesforce on Friday (June 13), awaiting response
- Will call Salesforce today (June 16) to escalate
- Cob on high alert for anything Salesforce-related — Zapier integration costs money if SF isn't syncing

---

## Previous Update - June 9, 2026

### MATERIALS COORDINATION TRAINING — SESSION 1

**Attendees:** Chris Yates, Wayne McCoy, Mark Moore, Jeff Clark, Fiona Cafe
**Recording:** https://fathom.video/share/7u66uFfAxBUk46kyd2x5Lg3eZ2kM8Uxk
**Duration:** 63 min
**Full notes:** `temp-power-systems-materials-training-jun9.md`

#### What Happened

Fiona walked the TPS team through the materials & work order builder and Materials Report. Wayne will enter June 15–17 materials (real data from Notes) today. Mark reviews and updates statuses tomorrow (June 10). Goal: CRM replaces Notes-based workflow by June 15.

#### Confirmed Working (Cob deployed before training)

- "?" / Unknown status in order status dropdown
- Bulk need-by date with per-item override
- Custom material entry (type any material name not in dropdown)

#### Bugs + Issues Found During Training

| # | Issue | Severity | Details |
|---|-------|----------|---------|
| 1 | Add Materials pop-up doesn't persist when switching tabs | CRITICAL | Cob said fixed — NOT fixed. Pop-up disappears when switching browser tabs. Wayne loses all entered data. |
| 2 | Preliminary Materials link not saving | HIGH | Wayne and Jeff both tried pasting Salesforce equipment list URL — link disappears on save. New functionality, deployed broken. |
| 3 | Materials dropdown not scrollable | MEDIUM | Filtered dropdown list not scrollable — can't reach items further down the list. |
| 4 | Material notes not visible in job detail view | MEDIUM | Notes show in Materials Report but not when drilling into job's materials section. Must click Edit to see. |
| 5 | Comment indicator needed on material items | MEDIUM | No visual indicator when a material has comments. Needs icon with count. |
| 6 | Cannot delete comments in Materials Coordination Log | MEDIUM | No delete option for posted comments in general comment/update section. |
| 7 | Materials Report default view wrong | MEDIUM | Should default to "Need By Date" with "All Statuses." |
| — | Archived jobs stay in Materials Report | NOTE | Chris wants all materials visible, including archived. Do NOT hide. |

#### Feature Requests — ON HOLD (Chris: "Let's not spend any money yet")

1. Manipulate order status directly from Materials Report filter view
2. Completed status that removes items from list
3. Materials ledger / checkbook per job
4. Salesforce equipment list auto-mapping
5. Materials tied to SOV phases / linear schedule

#### Action Items

| # | Action | Owner | Priority |
|---|--------|-------|----------|
| 1 | Fix Add Materials pop-up persistence (switching tabs kills it) | Cob | CRITICAL |
| 2 | Fix Preliminary Materials link not saving | Cob | HIGH |
| 3 | Fix Materials dropdown scroll | Cob | MEDIUM |
| 4 | Fix material notes visibility in job detail view | Cob | MEDIUM |
| 5 | Add comment indicator icon with count on material items | Cob | MEDIUM |
| 6 | Add delete option for comments in Materials Coordination Log | Cob | MEDIUM |
| 7 | Change Materials Report default view to "Need By Date" + "All Statuses" | Cob | MEDIUM |
| 8 | Enter June 15–17 materials into CRM | Wayne | TODAY |
| 9 | Review Wayne's entries, update statuses, log feedback | Mark | June 10 |
| 10 | Schedule scheduling/tasks working sessions with Wayne | Fiona | This week |
| 11 | Get Chris approval on Supabase upgrade (~$20/mo) | Fiona | HIGH |
| 12 | Send bug fix email to Cob (with Loom + screenshots) | Fiona | TODAY |

---

## Previous Update - June 3, 2026

### CHRIS'S RESPONSE — PERMITS & UTILITIES DIRECTION

**Chris's Decision:**
- Wants a **simple link to the Salesforce permit section** in the CRM for now (immediate, no cost)
- Open to exploring full module enhancement — asked Fiona to create a quote
- Not convinced they're ready for the full module yet, but acknowledges it will happen eventually

**Actions Taken:**
1. **Email to Cob** — 19 permit/utility fields to add to CRM (manual input, no cost). Salesforce Permit Link is first priority. CC: Chris, solutions@aivate.net.
2. **Email response to Chris** — Confirmed Salesforce link is doable immediately, mentioned we can add all fields at no cost (manual input), and will prepare formal proposal for full module.
3. **Proposal drafted** — `temp-power-systems-permits-utilities-proposal.md` + Google Drive HTML version. Two tiers: Basic ($1,000) / Advanced ($2,500). Awaiting Fiona's final review before sending to Chris.

### RECONCILIATION STATUS — DASHBOARD QUESTION FROM CHRIS

**Issue:** Chris asked what the "Reconciliation Status" tile on the dashboard means. It shows **2 out of 265**. Fiona does not know what logic is driving those numbers.

**Questions sent to Cob (June 3):**
1. What does 265 represent? (total jobs? jobs with SOV?)
2. What does 2 represent? (what triggers "reconciled" status?)
3. What logic is currently in place?

**Intended logic (per Fiona):**
- A job is "reconciled" when ALL Schedule of Value line items have been invoiced
- Job has SOV in place (Angela added all line items/phases)
- Every line item has a corresponding invoice amount entered
- Total invoiced matches total scheduled = fully billed and balanced
- TPS is just waiting on customer payment — nothing outstanding on their end

**Status:** Awaiting Cob's response. May need logic adjustment if current implementation doesn't match intended definition.

---

## Previous Update - June 2, 2026

### PERMITS & UTILITIES SCOPE SESSION WITH WAYNE

**Attendees:** Chris Yates, Wayne McCoy, Cob Bautista, Fiona Cafe
**Duration:** ~66 min
**Recording:** [Fathom](https://fathom.video/share/HMy4svTGTuzpyEnUxqpzXmn_ydzdVw35)
**Full notes:** `temp-power-systems-permits-utilities-call-jun2.md`

#### What Happened

Wayne walked the team through his full permit and utility workflow in Salesforce. This was the session originally planned in May 21 (action item B). Wayne demonstrated:
- Multi-permit records per job (1-5+ permits each)
- Per-permit fields (address, permit number, status, cross street, APN, Dig Alert, comments, iPermit Erators link)
- Inspection tracking (manual date entry)
- Utility company management (dropdown, account numbers, application IDs)
- Meter removal workflow (Pending → Removed → Picked Up)
- Document storage (consolidated PDFs from iPermit Erators uploaded to Salesforce file bank)

#### Scope Analysis & Email to Chris

**Within original scope:** Basic permit fields on existing job cards (manual entry). Approved by Chris in Feb 11 as "incidental stuff like creating additional fields."

**Outside scope — Permits & Utilities Module (new proposal needed):**

| Feature | Summary |
|---------|---------|
| Multi-permit architecture | New database tables, relational model (1-5+ permits per job) |
| iPermit Erators integration | New third-party integration (separate from Salesforce-only scope) |
| Utility company management & meter removal | Pre-populated dropdown, auto stage transition (Maintenance → Removal) |
| Permits & utilities document section | Dedicated upload area per job (same pattern as contracts section) |
| Salesforce permit document linking | Public-view links (same approach as contracts) |
| Data migration & workflow automation | SF data import + trigger-based notifications & auto-task assignments |

**Email sent:** June 2 to cyates@temppower.com (CC: solutions@aivate.net)
**Subject:** "Permits & Utilities Module — Additional Scope from Today's Call"
**Status:** Awaiting Chris's response. If approved → Fiona creates formal proposal with pricing.

#### Key Decisions

1. **Linking over duplication** — CRM links to Salesforce-stored permit documents (same as contracts). No duplicate file storage.
2. **Dedicated document sections** — Permits & utilities get their own section in each job card, not a single shared file bank.
3. **Manual entry for basic fields** — within scope. Automation (iPermit integration) = additional scope.
4. **Meter removal auto-transition** — When removal date is set → job auto-moves from Maintenance to Removal.
5. **Supabase upgrade needed** — Free tier (5 GB) → paid tier (100 GB). Separate infrastructure need, not part of the module scope.

#### Cob Improvements Demonstrated

- Collapsible sections (timeline, notes, contracts, permits, accounting) — working
- Document upload real-time sync — working
- Dashboard color reverted (accidental red push from sideline polish)

#### New Bug

| Issue | Severity | Owner |
|-------|----------|-------|
| Recurring password reset on sign-in (Chris forced to reset password every login) | HIGH | Cob |

#### Action Items

| # | Action | Owner | Priority |
|---|--------|-------|----------|
| 1 | Fix recurring password reset on sign-in | Cob | HIGH |
| 2 | Research iPermit Erators API (pending Chris approval) | Cob | MEDIUM |
| 3 | Salesforce CSV export with all permit/utility fields | Cob + Fiona | MEDIUM |
| 4 | Research Salesforce API for pulling existing docs | Cob | MEDIUM |
| 5 | Define Maintenance-to-Removal workflow | Chris + Wayne + Fiona | MEDIUM |
| 6 | Create formal proposal for Permits & Utilities Module | Fiona | PENDING Chris |
| 7 | Upgrade Supabase to paid tier | Cob/Fiona | HIGH |

---

## Previous Update - May 29, 2026

### FIONA'S AUDIT — COB'S SECOND FIX BATCH + POLISH PASS

**Context:** Cob went into "zen mode" for several days and pushed fixes for the 2 remaining open items from May 27, plus a UX polish pass, and a new feature (variable retention %). Fiona audited everything. Reply email sent to Cob (CC: Chris, solutions@aivate.net) on May 29.

**Result: 4 Confirmed Resolved, 1 New Critical Blocker, 4 Items Still Need Work**

### CRM AUDIT SESSION #3 — May 29, 2026 (Thu 2:00 PM PST)

**Attendees:** Chris Yates, Angela Vaughn-Richey, Sandra Morales, Fiona Flynn
**Duration:** ~20 min (cut short — team needed to keep working)
**Full notes:** `temp-power-systems-crm-audit-session3-may29.md`

#### Progress

| Metric | Count |
|--------|-------|
| Total jobs in CRM | 277 |
| Jobs completed (Chris's bucket) | 162 |
| Wayne's bucket remaining | 108 (44 Execution + 15 Maintenance + 49 Removal) |
| Realistic remaining for Sandra/Angela | ~59 (Execution + Maintenance) |
| Removals needing review | 49 (may need Wayne to determine Archive vs. Removal) |

#### Key Decisions

1. **Duplicate cleanup ownership → Fiona.** 6 duplicates discovered (Sandra/Angela had stopped checking under assumption they were fixed). Fiona will handle all remaining duplicate cleanup. Sandra/Angela no longer need to check — just assign any duplicates to Fiona.
2. **Monday June 2 = dedicated CRM cleanup day.** Chris's decision — no invoicing, reconciliation, or routine end-of-month work. All CRM. Resume regular duties Tuesday.
3. **Sandra not in PM dropdown = by design.** She has no jobs assigned, so she doesn't appear. Not a bug. Team agrees.

#### New Issue: Concurrent Editing Data Loss

When Sandra and Angela work on the same job simultaneously from separate offices, one person's changes disappear when the other saves and exits. Worked fine in-person (verbal coordination) but fails remotely. **Risk:** Wayne, Sandra, and Angela could all be in the same job card during daily operations and overwrite each other's work. Monitoring — escalate to Cob if it persists.

#### Connection to Bungalows Blocker

Sandra's next job after this call was **Bungalows** — the same job Chris later reported as having no document checklist. Sandra likely hit this blocker immediately after the call ended, which triggered Chris's email to Cob.

#### CONFIRMED RESOLVED

| # | Issue | Severity | Notes |
|---|-------|----------|-------|
| 1 | SOV Cents Rounding | CRITICAL | **NOW RESOLVED.** Values like $85.90 display correctly across dashboard, SOV, reports, and exports. No more rounding. Closed. |
| 2 | Retention Filter on Pipeline Page | MEDIUM | **NOW RESOLVED.** "Has Retention" and "No Retention" filters return the correct jobs. Closed. |
| 3 | Job Deletion (Admin Only) | CRITICAL | Confirmed for Chris and Fiona. **Still need Sandra/Angela to verify they cannot delete.** Tentatively resolved. |
| 4 | Document Uploads Sync | CRITICAL | Uploads appearing for other users without refresh. Will monitor. Closed. |

#### NEW CRITICAL BLOCKER

| # | Issue | Severity | Status | Details |
|---|-------|----------|--------|---------|
| NEW | **Missing Document Checklist on Some Job Cards** | CRITICAL | **BLOCKING SANDRA** | Chris reported that some job cards (e.g., "Bungalows") have NO contract document upload field, no contract dropdown, and no document checklist at all. Sandra cannot upload contracts or complete her tasks. Likely related to old backfill issue — some cards may not have been migrated to the 4-document checklist (Contract, Insurance Certificate, Billing Information, Purchase Order). Cob needs to check how many cards are affected and fix immediately. |

#### STILL NEEDS WORK

| # | Issue | Severity | Status | Details |
|---|-------|----------|--------|---------|
| 5 | **Variable Retention % (5/12/15%)** | HIGH | **NOT DEPLOYED** | Cob said 5%, 12%, and 15% retention options are implemented. Fiona only sees 10% in the dropdown. Feature not visible — needs investigation. |
| 6 | **Dashboard Chart — Maintenance Label Truncated** | MEDIUM | **RENDERING BUG** | Maintenance stage shows in the chart, but label is cut off — only displaying "AINTENANCE." Chart overflows its container and overlaps the Job Status Distribution section. Needs rendering fix. |
| 7 | **Dashboard Tiles — Revert to Old Design** | MEDIUM | **DESIGN REJECTED** | New tile design uses red color (reads as negative/alarming for neutral metrics). Fiona prefers old layout: four tiles in a single horizontal row (Schedule of Value, Remaining to Build, Total Build to Date, Reconciliation Status). Reinstate previous design, remove red color scheme. |
| 8 | **Collapsible Sections on Job Detail Pages** | LOW | **NOT VISIBLE** | Cob mentioned collapse functionality for materials/documents sections. Fiona sees no toggle, arrow, or collapse mechanism anywhere on job detail pages. May not have deployed correctly. |

#### ON HOLD

| Item | Status | Details |
|------|--------|---------|
| Salesforce Automation | Waiting on Chris | Salesforce flags additional logins as fraud alert, blocking credential sharing. Chris working with Salesforce on a workaround. No action for Cob. |

#### OBSERVING

| Item | Details |
|------|---------|
| Cleaner dashboard layout | Will evaluate in day-to-day usage |
| Smoother loading / loading indicators | Will evaluate in day-to-day usage |
| Mobile responsiveness | Not yet tested by Fiona — will observe |

#### OPEN FOLLOW-UPS (Carried Forward)

| Item | Type | Details | Owner |
|------|------|---------|-------|
| Job deletion — manager access check | Verification | Have Sandra or Angela confirm they do NOT see a delete option | Fiona |
| Task deletion — cross-user test | Verification | Confirm non-creators cannot delete tasks they didn't create | Fiona (during audit) |

---

## Previous Update - May 27, 2026

### FIONA'S TEST RESULTS — COB'S 10-ITEM FIX BATCH (FIRST ROUND)

**Context:** Cob reported all 10 open CRM items resolved on May 23. Fiona tested each item and sent reply email to Cob (CC: Chris, solutions@aivate.net) on May 27.

**Result: 8 of 10 Confirmed Resolved, 2 Still Open**

#### CONFIRMED RESOLVED

| # | Issue | Severity | Notes |
|---|-------|----------|-------|
| 1 | Job Deletion + Admin Guardrail | CRITICAL | Working. Fiona can delete as admin. Follow-up needed: confirm managers can't delete. |
| 2 | SOV Retention Row — Full Logic Overhaul | CRITICAL | Working. Can edit and delete retention lines. Auto 10% retention calculation is live. |
| 4 | Task Deletion Guardrail — Assigner-Only | HIGH | Partially confirmed. Cross-user test not yet done. |
| 5 | Document Link Option in Contracts & Compliance | HIGH | Working. Can paste external links. |
| 6 | Persist Pipeline Filters Across Navigation | HIGH | Confirmed resolved. Filters persist. |
| 8 | Real-time Push Notifications | MEDIUM | Confirmed resolved. Instant notifications. |
| 9 | Additional Notes — More Prominent | LOW | Working. Amber/yellow highlight with icon. |
| 10 | Audit Supabase Free Tier | LOW | On hold — not urgent. |

#### NOT YET RESOLVED (at the time)

| # | Issue | Severity | Status | Details |
|---|-------|----------|--------|---------|
| 3 | SOV Cents Rounding | CRITICAL | STILL BROKEN | Remaining to Bill rounded to nearest dollar. **(Now resolved in May 29 update)** |
| 7 | Retention Filter on Pipeline Page | MEDIUM | STILL BROKEN | Filter returning incorrect jobs. **(Now resolved in May 29 update)** |

---

## Previous Update - May 22, 2026

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
| **SF Permit fields** | iPermit link + dig alert fields — ✅ UNBLOCKED: Wayne provided full field list in June 2 session. See `temp-power-systems-permits-utilities-call-jun2.md`. Full module is additional scope — awaiting Chris approval. |
| **CO Parent/Child logic** | Prevent duplicate jobs from child SF opportunities |
| **SOV validation** | Phases must total contract amount before save |
| **Task Automation Engine** | Auto-tasks triggered by job events |

**✅ UNBLOCKED:** SF Permit fields — Wayne provided full field list in June 2 session. Full Permits & Utilities Module is additional scope pending Chris's approval.

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
