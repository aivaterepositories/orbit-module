# TEAM ASSIGNMENTS - February 2026 Sprint
**Project:** Temp Power Systems CRM
**Updated:** 2026-02-02
**Coordinator:** Nova (via Fiona)

---

## 🎯 MARKY - YOUR TASK LIST

### IMMEDIATE (Start Today/Tomorrow)
- [ ] **Task #6:** Add new job notification feedback (1 day)
- [ ] **Task #7:** Phone number field in crew profile (1 day)

### THIS WEEK (Feb 3-9)
- [ ] **Task #1:** Multi-crew assignment in work order management (3-4 days)

### NEXT WEEK (Feb 10-16)
- [ ] **Task #3:** Crew summary redesign and replacement (2 days)
- [ ] **Task #4:** Add crew summary to extra work orders (1 day)

### WEEKS 2-3 (Feb 10-23)
- [ ] **Task #2:** Change Order UI implementation (6-8 days)

### WEEKS 3-4 (Feb 17-28)
- [ ] **Task #5:** Crew portal dashboard replacement (4-5 days)

**TOTAL WORKLOAD:** 19-25 days across 4 weeks

---

## 🎯 COB/JACOB - YOUR TASK LIST

### WEEKS 2-3 (Feb 10-23)
- [ ] **Task #2:** Change Order backend implementation (8-13 days)
  - Database schema updates
  - Workflow automation
  - Email notifications (5 templates)
  - SOV validation logic
  - Salesforce integration
  - CO notes, editing, cancellation

### WEEKS 3-4 (Feb 17-28)
- [ ] **Task #5:** Crew portal dashboard backend support (TBD days)
  - Time tracking data queries
  - Pay calculation logic
  - Work order counts

**TOTAL WORKLOAD:** 8-13 days (Task #2) + support for Task #5

---

## 📋 DETAILED TASK DESCRIPTIONS

### Task #1: Multi-Crew Assignment (Marky)
**Priority:** CRITICAL - Blocks Tasks #3 and #4

**What to Build:**
- "Add Crew" button in work order management
- Ability to create multiple crew groupings per work order
- Assign crew members to each crew
- Display crews with visual grouping
- Show crew member details: name, skills, certifications, job title

**Acceptance Criteria:**
✅ Wayne can create multiple crews per work order
✅ Wayne can assign crew members to each crew
✅ Crews display with clear visual separation
✅ Works in both regular work orders and extra work orders

---

### Task #2: Change Order Workflow (Marky + Cob/Jacob)
**Priority:** CRITICAL - Client expects this feature

**MARKY - Front-End (6-8 days):**
- CO Request button in Sales Summary section
- CO Request Form with required fields:
  - Change scope description (rich text)
  - Estimated materials list
  - Affected phases/work orders (multi-select)
  - Estimated CO amount (can be negative)
  - Urgency level (Critical/High/Standard)
- Smart Alert at top of job card (shows CO progress)
- CO Tracking section (list all COs for job)
- Detailed CO view (full workflow visibility)
- Notes field (for rejection reasons)
- Edit CO amount capability
- Cancel CO button
- Mobile-responsive design

**COB/JACOB - Back-End (8-13 days):**
- Database: New `change_orders` table
- Workflow automation (4 stages, task generation)
- Notifications:
  - 5 email templates (see spec)
  - Internal admin alert when CO initiated
  - Cancellation notifications
- SOV validation (must balance before completion)
- Contract amount cumulative tracking
- Salesforce integration (update parent opportunity, NO duplicates)
- CO notes, editing, cancellation logic

**KEY REQUIREMENTS:**
✅ Pre-Lien: Manual field (NO auto-calculation)
✅ QuickBooks: NO integration
✅ Service Suspension: NO automatic suspension
✅ Client Notifications: Internal team only
✅ CO Rejection: Support notes, editing, cancellation
✅ Multiple COs: Independent tracking per job
✅ Deduction COs: Support negative amounts

**FULL SPEC:** `temp-power-systems-change-order-implementation.md`

---

### Task #3: Crew Summary Redesign (Marky)
**Priority:** HIGH
**Dependencies:** Requires Task #1 completion

**What to Build:**
- Replace "Selected Crew Member Summary" label with "Crew Summary"
- Enhanced display showing:
  - Crews needed for work order
  - Crew members per crew
  - For each member: Name, skills, certifications, job title
- Visual design: Grouped by crew, easy to scan
- Professional appearance for PDF exports

**Acceptance Criteria:**
✅ Label changed to "Crew Summary"
✅ Displays crew groupings clearly
✅ Shows all crew member details
✅ Looks professional in work order PDFs

---

### Task #4: Crew Summary in Extra Work Orders (Marky)
**Priority:** HIGH
**Dependencies:** Requires Task #3 completion

**What to Build:**
- Add same crew summary to extra work order section
- Match design and functionality of regular work orders
- Ensure consistency across work order types

**Acceptance Criteria:**
✅ Extra work orders have crew summary section
✅ Design matches regular work orders
✅ All crew details display correctly

---

### Task #5: Crew Portal Dashboard (Marky + Cob/Jacob)
**Priority:** MEDIUM
**Complexity:** Medium-High

**MARKY - Front-End (4-5 days):**
- Replace "My Task" with "Dashboard" in crew portal
- Dashboard displays:
  - Total hours worked (filter: Week/Month/Year)
  - Scheduled pay (based on hours)
  - Open work orders (count)
  - Completed work orders (count)
- Clean, mobile-friendly layout
- Filter toggles for time periods
- Visual charts/graphs if possible

**COB/JACOB - Back-End (TBD days):**
- Time tracking data queries
- Pay calculation logic
- Work order counts (open vs completed)
- Historical data aggregation

**Acceptance Criteria:**
✅ Dashboard replaces My Task section
✅ All metrics display correctly
✅ Filters work (week/month/year)
✅ Mobile-responsive design
✅ Performance optimized for quick loading

---

### Task #6: Add New Job Notification (Marky)
**Priority:** QUICK WIN
**Complexity:** Low

**What to Build:**
- Success notification when job is added
- Error notification if add fails
- Loading state during submission
- Option to view newly created job

**Acceptance Criteria:**
✅ User sees "Job [Name] added successfully"
✅ Errors display helpful messages
✅ Button to view new job appears
✅ Works on mobile and desktop

---

### Task #7: Phone Number Field (Marky)
**Priority:** QUICK WIN
**Complexity:** Low

**What to Build:**
- Phone number field in crew portal profile
- US phone number format validation
- Display in crew summary for Wayne's reference

**Acceptance Criteria:**
✅ Field appears in crew profile
✅ Validates phone number format
✅ Saves correctly
✅ Displays in crew summaries

---

## 📅 SPRINT TIMELINE

### Week 1 (Feb 3-9)
**Marky:** Tasks #6, #7, #1
**Cob/Jacob:** Prepare for Task #2
**Deliverables:** 3 tasks complete

### Week 2 (Feb 10-16)
**Marky:** Tasks #3, #4, start #2
**Cob/Jacob:** Start Task #2
**Deliverables:** 5 tasks complete, CO 40% done

### Week 3 (Feb 17-23)
**Marky:** Complete Task #2, start #5
**Cob/Jacob:** Complete Task #2, support #5
**Deliverables:** 6 tasks complete, #5 in progress

### Week 4 (Feb 24-28)
**All:** Complete Task #5, testing, pilot prep
**Deliverables:** ALL 7 tasks complete, ready for pilot

---

## 📊 PROGRESS TRACKING

Track your progress by updating task status:
- Update task status to "in_progress" when you start
- Update to "completed" when done
- Flag blockers immediately to Nova/Fiona

**Files to Monitor:**
- `temp-power-systems-audit-findings.md` - All 7 tasks overview
- `temp-power-systems-change-order-implementation.md` - Full CO spec
- `temp-power-systems-status.md` - Overall project status

---

## 🆘 NEED HELP?

**Marky:** Questions about UI/UX or task priorities?
**Cob/Jacob:** Questions about backend logic or Salesforce integration?

**Contact:**
- Fiona (PM/Coordinator)
- Nova (Project Coordinator)

**Communication Channels:**
- This GitHub repo (check files above)
- Email notifications
- Direct messages

---

## 🎯 SUCCESS CRITERIA

**End of February Goal:** All 7 tasks complete, pilot phase ready

**Pilot Requirements:**
✅ All audit findings implemented
✅ Change Order workflow functional
✅ Multi-crew assignment working
✅ Crew summaries consistent
✅ Crew portal dashboard live
✅ All UI polish complete
✅ Backend integrations tested
✅ Ready for client team to test with real data

---

**Let's make this happen! 🚀**

**Questions? Check the detailed specs or reach out to Fiona/Nova.**
