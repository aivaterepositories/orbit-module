# Temp Power Systems - Audit Findings
**Date:** 2026-02-02
**Auditor:** Fiona Cafe
**Source:** Simulator inspection post-materials/skills list deployment

---

## STATUS: 7 Items Identified for Implementation

### ✅ COMPLETED ITEMS (Since Last Check)
- Materials list drop-down deployed (Mark)
- Skills list in crew portal deployed (Mark)
- Certifications list deployed (Mark)
- Client provided missing data lists (unblocked development)

---

## 🔴 CRITICAL PRIORITY

### 1. Multi-Crew Assignment in Work Order Management
**Location:** Work order management section
**Issue:** Missing "Add Crew" capability for multiple crews per work order
**Impact:** HIGH - Wayne cannot assign multiple crews as needed

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
**Estimated Complexity:** Medium

---

### 2. Change Order Button & Workflow
**Location:** Sales summary section in job card
**Issue:** Missing "Change Order" button and process flow
**Impact:** HIGH - Cannot handle contract modifications (common occurrence)

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

**Assigned To:** BLOCKED - Waiting on SOP from Fiona
**Dependencies:** Change order process documentation
**Estimated Complexity:** High (workflow + Salesforce integration)

---

## 🟡 HIGH PRIORITY

### 3. "Crew Summary" Replacement
**Location:** Work order and extra section in CRM
**Issue:** "Selected Crew Member Summary" label needs replacement
**Impact:** MEDIUM - Clarity and consistency

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
**Estimated Complexity:** Low (if just label), Medium (if redesign needed)

---

### 4. Crew Summary in Extra Work Orders
**Location:** Extra work order section
**Issue:** Crew summary is missing entirely
**Impact:** MEDIUM - Inconsistency between work order types

**Requirements:**
- Same crew summary as regular work orders
- Must include all crew details (skills, certs, job titles)
- Consistent design and functionality

**Assigned To:** Mark (Simulator UI)
**Dependencies:** Multi-crew assignment implementation (#1), Crew Summary design (#3)
**Estimated Complexity:** Low (duplicate existing feature)

---

### 5. Crew Portal Dashboard Replacement
**Location:** Crew portal - currently shows "My Task"
**Issue:** Need to replace "My Task" with comprehensive "Dashboard"
**Impact:** MEDIUM - Crew visibility and engagement

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

**Assigned To:** Mark (Simulator UI Design)
**Dependencies:** Work order time tracking data
**Estimated Complexity:** Medium-High (new dashboard view)

---

## 🟢 MEDIUM PRIORITY

### 6. "Add New Job" Notification/Feedback
**Location:** Jobs page - "Add New Job" button
**Issue:** No pop-up or notification when job is added
**Impact:** LOW-MEDIUM - User uncertainty about action success

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
**Estimated Complexity:** Low

---

### 7. Phone Number Field in Crew Portal Profile
**Location:** User profile in crew portal
**Issue:** Missing phone number field
**Impact:** LOW - Nice to have for contact management

**Requirements:**
- Add "Phone Number" field to crew profile
- Format validation (US phone number format)
- Optional or required? (Recommend: Required)
- Display in crew summary for Wayne's reference

**Assigned To:** Mark (Simulator UI)
**Dependencies:** None
**Estimated Complexity:** Low

---

## PRIORITY SEQUENCING RECOMMENDATION

### Sprint 1 (This Week - Critical Path)
1. **Multi-Crew Assignment (#1)** - HIGH IMPACT, blocks other items
2. **"Add New Job" Notification (#6)** - Quick win, improves UX
3. **Phone Number Field (#7)** - Quick win, low complexity

### Sprint 2 (Next Week - Dependent Items)
4. **Crew Summary Replacement (#3)** - Depends on #1
5. **Crew Summary in Extra (#4)** - Depends on #3
6. **Change Order Process (#2)** - Once SOP received from Fiona

### Sprint 3 (Following Week - Enhancement)
7. **Crew Portal Dashboard (#5)** - More complex, less urgent

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

### Mark (Simulator Lead)
- [ ] #1 - Multi-crew assignment in work order (CRITICAL)
- [ ] #3 - Crew summary label and content redesign (HIGH)
- [ ] #4 - Crew summary in extra work orders (HIGH)
- [ ] #5 - Crew portal dashboard replacement (MEDIUM)
- [ ] #6 - Add new job notification (MEDIUM)
- [ ] #7 - Phone number field in crew profile (MEDIUM)

### Fiona (Process Documentation)
- [ ] #2 - Provide change order SOP/process documentation (BLOCKING)

### Cob/Jacob (Backend - if needed)
- [ ] #2 - Change order Salesforce integration (once SOP provided)
- [ ] #5 - Crew portal dashboard data queries (time tracking, pay calculation)

---

## ESTIMATED TIMELINE

**Best Case (No Blockers):**
- Week 1: Items #1, #6, #7 (Critical + Quick Wins)
- Week 2: Items #3, #4 (Dependent on #1)
- Week 3: Items #2, #5 (Complex items)
- **Total:** 3 weeks to completion

**With Change Order Blocker:**
- Items #1, #3, #4, #5, #6, #7: 2-3 weeks
- Item #2: TBD based on SOP delivery

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
