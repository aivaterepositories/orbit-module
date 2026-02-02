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

## 🔴 ALL TASKS CRITICAL - IMMEDIATE DEADLINE

**TARGET DEADLINE:** Before 5:30 AM Manila (Tuesday)

All 8 tasks are CRITICAL priority and must be completed immediately. Marky and Cob/Jacob should sequence efficiently based on dependencies.

**Suggested Sequencing (optional):**
- Task #1 blocks Tasks #3 and #4 (multi-crew assignment foundation)
- Task #2 is independent (change order workflow)
- Tasks #6 and #7 are quick wins (can be done anytime)
- Task #8 is independent (work order calendar)
- Task #5 can be done anytime (dashboard)

---

## BLOCKERS

### ✅ NO BLOCKERS - ALL TASKS UNBLOCKED

Change Order SOP received from Fiona. All 8 tasks ready for immediate implementation.

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

**All Tasks CRITICAL - IMMEDIATE DEADLINE**

**TARGET DEADLINE:** Before 5:30 AM Manila (Tuesday)

**Marky's Workload:** 8 tasks (immediate)
**Cob/Jacob's Workload:** 3 tasks (immediate) - Task #2 + support for #5 and #8

All tasks are CRITICAL and must be completed before Tuesday 5:30 AM Manila time.

---

## NEXT STEPS

**IMMEDIATE DEADLINE:** Before 5:30 AM Manila (Tuesday)

1. **Marky:** Start all 8 tasks immediately - All CRITICAL
2. **Cob/Jacob:** Start all 3 tasks immediately - All CRITICAL
3. **Team:** Report blockers immediately to Fiona/Nova
4. **Fiona:** Monitor progress, clear any blockers
5. **All:** Complete ALL tasks before Tuesday 5:30 AM Manila time

---

**Document Created:** 2026-02-02
**Deadline:** Tuesday 5:30 AM Manila
**Last Updated:** 2026-02-02 (Immediate deadline set)
