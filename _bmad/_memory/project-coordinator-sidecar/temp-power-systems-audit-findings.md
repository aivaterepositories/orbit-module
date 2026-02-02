# Temp Power Systems - Audit Findings
**Date:** 2026-02-02
**Updated:** 2026-02-02 (Added Task #8 - Work Order Calendar)
**Auditor:** Fiona Cafe
**Source:** Simulator inspection + client requirements review

---

## STATUS: 8 Items Identified for Implementation

### ✅ COMPLETED ITEMS (Since Last Check)
- Materials list drop-down deployed (Mark)
- Skills list in crew portal deployed (Mark)
- Certifications list deployed (Mark)
- Client provided missing data lists (unblocked development)

---

## 🔴 ALL TASKS CRITICAL PRIORITY

### 1. Multi-Crew Assignment in Work Order Management
**Location:** Work order management section
**Issue:** Missing "Add Crew" capability for multiple crews per work order
**Impact:** CRITICAL

**Requirements:**
- Wayne creates new work order
- Wayne clicks "Add Crew" button
- Wayne assigns crew members to that crew
- Can repeat for multiple crews on same work order
- Must show in work order summary

**Design Needed:**
- Crew assignment interface
- Visual grouping of crew members by crew
- Clear indication of which crew members are assigned together

**Assigned To:** Mark (Simulator UI)
**Dependencies:** None
**Priority:** CRITICAL

---

### 2. Change Order Button & Workflow
**Location:** Sales summary section in job card
**Issue:** Missing "Change Order" button and process flow
**Impact:** CRITICAL

**Requirements:**
- Button in sales summary section
- Triggers change order workflow
- **NEEDS SOP FROM FIONA** - Process not fully documented

**Questions for Fiona:**
1. What triggers a change order? (Customer request, scope change, etc.)
2. Who initiates? (Jeff/Sales, Chris, Customer?)
3. What's the approval flow? (Sales → Sandra → Angela as mentioned in Dec 10 meeting?)
4. Does it need customer signature before execution?
5. How does it update Salesforce? (Auto-sync or manual?)
6. What notifications are sent and to whom?
7. What fields are captured in the change order form?

**Assigned To:** Marky (Front-End) + Cob/Jacob (Backend)
**Dependencies:** Change order process documentation (RECEIVED)
**Priority:** CRITICAL

---

### 3. "Crew Summary" Replacement
**Location:** Work order and extra section in CRM
**Issue:** "Selected Crew Member Summary" label needs replacement
**Impact:** CRITICAL

**Current Label:** "Selected Crew Member Summary"
**New Label:** "Crew Summary"

**Content Requirements:**
- Overview of crews needed for work order
- Crew members assigned per crew (by Wayne)
- Display for each crew member:
  - Name
  - Skill sets
  - Certifications
  - Job title

**Visual Design:**
- Grouped by crew (if multiple crews)
- Easy to scan at a glance
- Professional presentation for work order PDFs

**Assigned To:** Mark (Simulator UI + Label Change)
**Dependencies:** Multi-crew assignment implementation (#1)
**Priority:** CRITICAL

---

### 4. Crew Summary in Extra Work Orders
**Location:** Extra work order section
**Issue:** Crew summary is missing entirely
**Impact:** CRITICAL

**Requirements:**
- Same crew summary as regular work orders
- Must include all crew details (skills, certs, job titles)
- Consistent design and functionality

**Assigned To:** Mark (Simulator UI)
**Dependencies:** Multi-crew assignment implementation (#1), Crew Summary design (#3)
**Priority:** CRITICAL

---

### 5. Crew Portal Dashboard Replacement
**Location:** Crew portal - currently shows "My Task"
**Issue:** Need to replace "My Task" with comprehensive "Dashboard"
**Impact:** CRITICAL

**Current:** "My Task" section
**New:** "Dashboard" with metrics

**Dashboard Requirements:**
- **Total Hours Worked:**
  - Filterable: Week / Month / Year
  - Visual display of time tracked

- **Scheduled Pay:**
  - Based on hours worked
  - Pay period visibility

- **Open Work Orders:**
  - Count of assigned work orders not yet started/completed

- **Completed Work Orders:**
  - Count of finished work orders
  - Historical tracking

**Design Considerations:**
- Clean, easy-to-read layout
- Mobile-friendly (crew uses phones)
- Filter toggles for time periods
- Visual charts/graphs if possible

**Assigned To:** Mark (Simulator UI Design) + Cob/Jacob (Backend)
**Dependencies:** Work order time tracking data
**Priority:** CRITICAL

---

### 8. Work Order Calendar View (Salesforce-Style)
**Location:** Work Order Calendar navigation section
**Issue:** Missing calendar/schedule view that client uses daily in Salesforce
**Impact:** CRITICAL

**Requirements:**
- Calendar/schedule grid view showing work orders by date
- Columns: Date, Job Name, Crew, Comments, Scheduled Value, Billed, Remaining
- Daily totals (sum of scheduled values per day)
- Monthly projection totals at bottom
- Time period filters (This Month, Next Month, Custom)
- Revenue vs non-revenue work order identification
- Interactive: Click job → job card, Click crew → crew schedule
- Mobile-responsive design
- Export to PDF/CSV capability

**Client Quote (Chris - Meeting 1):**
"It tells me the day that we're doing the work. The schedule says on the 3rd of November, we're doing these jobs: Sycamore Walk, Lake Paris... This is the crew. Then the comments... Here's the scheduled value of this work today... So I can see very quickly... in November, if everything goes well, we should bill around $170,000 of the $2.1 million we have in the books."

**Design Reference:**
- Based on Salesforce schedule view Chris showed in Meeting 1
- Several rows per date showing work orders
- Schedule of value vs billed amount per work order
- Clear daily and monthly revenue projections

**Assigned To:** Marky (Front-End), Cob/Jacob (Backend data queries)
**Dependencies:** Work order data structure finalized
**Priority:** CRITICAL

---

### 6. "Add New Job" Notification/Feedback
**Location:** Jobs page - "Add New Job" button
**Issue:** No pop-up or notification when job is added
**Impact:** CRITICAL

**Current Behavior:**
- Button may work but provides no feedback
- User doesn't know if job was added
- No confirmation or error message

**Requirements:**
- Success notification: "Job [Job Name] added successfully"
- Error notification if something fails
- Visual feedback (loading state, then success/error)
- Option to view newly created job immediately

**Assigned To:** Mark (Simulator UI)
**Dependencies:** None
**Priority:** CRITICAL

---

### 7. Phone Number Field in Crew Portal Profile
**Location:** User profile in crew portal
**Issue:** Missing phone number field
**Impact:** CRITICAL

**Requirements:**
- Add "Phone Number" field to crew profile
- Format validation (US phone number format)
- Optional or required? (Recommend: Required)
- Display in crew summary for Wayne's reference

**Assigned To:** Mark (Simulator UI)
**Dependencies:** None
**Priority:** CRITICAL

---

## PRIORITY SEQUENCING RECOMMENDATION

### Sprint 1 (This Week - Critical Path)
1. **Multi-Crew Assignment (#1)** - HIGH IMPACT, blocks other items
2. **"Add New Job" Notification (#6)** - Quick win, improves UX
3. **Phone Number Field (#7)** - Quick win, low complexity

### Sprint 2 (Next Week - Dependent Items)
4. **Crew Summary Replacement (#3)** - Depends on #1
5. **Crew Summary in Extra (#4)** - Depends on #3
6. **Change Order Process (#2)** - SOP received, ready to implement

### Sprint 3 (Following Week - Major Features)
7. **Work Order Calendar (#8)** - Client priority, daily use feature
8. **Crew Portal Dashboard (#5)** - Enhancement, less urgent

---

## BLOCKERS

### 🚫 BLOCKED: Change Order Implementation (#2)
**Waiting On:** Fiona to provide SOP/process documentation
**Impact:** Cannot design workflow without understanding business process
**Action Required:** Fiona to document or schedule working session

**Questions Needing Answers:**
- Who initiates change orders?
- What's the approval workflow?
- What data is captured?
- How does it integrate with Salesforce?
- What notifications are triggered?
- Does customer sign-off required?

---

## ASSIGNMENT SUMMARY

### Mark (Simulator Lead) - ALL CRITICAL
- [ ] #1 - Multi-crew assignment in work order (CRITICAL)
- [ ] #2 - Change Order UI implementation (CRITICAL)
- [ ] #3 - Crew summary label and content redesign (CRITICAL)
- [ ] #4 - Crew summary in extra work orders (CRITICAL)
- [ ] #5 - Crew portal dashboard replacement (CRITICAL)
- [ ] #6 - Add new job notification (CRITICAL)
- [ ] #7 - Phone number field in crew profile (CRITICAL)
- [ ] #8 - Work Order Calendar view (CRITICAL)

### Fiona (Process Documentation)
- [x] #2 - Provide change order SOP/process documentation (COMPLETED)

### Cob/Jacob (Backend) - ALL CRITICAL
- [ ] #2 - Change order backend + Salesforce integration (CRITICAL)
- [ ] #5 - Crew portal dashboard data queries (CRITICAL)
- [ ] #8 - Work order calendar backend support (CRITICAL)

---

## ESTIMATED TIMELINE

**Current Status (All Unblocked):**
- Week 1: Items #1, #6, #7 (Critical + Quick Wins) - 3 of 8 complete
- Week 2: Items #3, #4, start #2 (Dependent items + CO start) - 5 of 8 complete
- Week 3: Items #2, #8 (Change Order + Work Order Calendar) - 7 of 8 complete
- Week 4: Item #5 (Crew Portal Dashboard) + Testing - 8 of 8 complete
- **Total:** 4 weeks to completion

**Marky's Workload:** 23-30 days across 8 tasks
**Cob/Jacob's Workload:** 8-13 days (Task #2) + support for #5 and #8

---

## NEXT STEPS

1. **Fiona:** Review this breakdown, confirm priorities
2. **Fiona:** Provide change order SOP (schedule working session if easier)
3. **Mark:** Review assignments, provide time estimates
4. **Nova:** Schedule sprint planning session with team
5. **Team:** Align on sprint capacity and delivery dates

---

**Document Created:** 2026-02-02
**Next Review:** After Fiona confirms priorities and provides change order SOP
