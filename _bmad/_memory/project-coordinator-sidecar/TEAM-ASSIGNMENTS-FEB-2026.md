# TEAM ASSIGNMENTS - February 2026 Sprint
**Project:** Temp Power Systems CRM
**Updated:** 2026-02-02
**Coordinator:** Nova (via Fiona)

---

## 🎯 MARKY - YOUR TASK LIST

### 🔴 ALL TASKS CRITICAL PRIORITY - IMMEDIATE

- [ ] **Task #1:** Multi-crew assignment in work order management (immediate) - CRITICAL
- [ ] **Task #2:** Change Order UI implementation (immediate) - CRITICAL
- [ ] **Task #3:** Crew summary redesign and replacement (immediate) - CRITICAL
- [ ] **Task #4:** Add crew summary to extra work orders (immediate) - CRITICAL
- [ ] **Task #5:** Crew portal dashboard replacement (immediate) - CRITICAL
- [ ] **Task #6:** Add new job notification feedback (immediate) - CRITICAL
- [ ] **Task #7:** Phone number field in crew profile (immediate) - CRITICAL
- [ ] **Task #8:** Work Order Calendar view (immediate) - CRITICAL

**TARGET DEADLINE:** Before 5:30 AM Manila (Tuesday)
**TOTAL WORKLOAD:** 8 tasks - All items are critical and immediate

---

## 🎯 COB/JACOB - YOUR TASK LIST

### 🔴 ALL TASKS CRITICAL PRIORITY - IMMEDIATE

- [ ] **Task #2:** Change Order backend implementation (immediate) - CRITICAL
  - Database schema updates
  - Workflow automation
  - Email notifications (5 templates)
  - SOV validation logic
  - Salesforce integration
  - CO notes, editing, cancellation

- [ ] **Task #5:** Crew portal dashboard backend support (immediate) - CRITICAL
  - Time tracking data queries
  - Pay calculation logic
  - Work order counts

- [ ] **Task #8:** Work Order Calendar backend support (immediate) - CRITICAL
  - Data queries for calendar view
  - Daily/monthly revenue calculations

**TARGET DEADLINE:** Before 5:30 AM Manila (Tuesday)
**TOTAL WORKLOAD:** 3 tasks - All items are critical and immediate

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

### Task #8: Work Order Calendar View (Marky)
**Priority:** HIGH (Client specifically requested)
**Complexity:** Medium-High
**Estimated Time:** 4-5 days

**What to Build:**
Calendar/schedule grid view showing work orders by date (Salesforce-style)

**Layout - Columns:**
- Date (grouped by day)
- Job Name (clickable → job card)
- Crew Assignment
- Comments/Special Instructions
- Scheduled Value (billable amount)
- Billed Amount (if completed)
- Remaining (Scheduled - Billed)
- Daily totals per date
- Monthly total at bottom

**Key Features:**
1. **Time Period Filters:**
   - This Month (default)
   - Next Month
   - Custom date range

2. **Daily Totals:**
   - Sum of scheduled values per day
   - Shows expected daily billing

3. **Monthly Projection:**
   - Total at bottom: "If all goes well, bill $170,000 this month"

4. **Revenue Indicators:**
   - Visual for $0 work orders (pickups, already billed)
   - Distinguish partial vs full scope work

5. **Interactive Elements:**
   - Click job → Opens job card
   - Click crew → Shows crew schedule
   - Click value → Shows SOV breakdown
   - Hover comments → Full text tooltip
   - Export to PDF/CSV

**Filters:**
- Time period, Crew, Status, Revenue type

**Client Quote (Chris - Meeting 1):**
> "It tells me the day that we're doing the work. The schedule says on the 3rd of November, we're doing these jobs: Sycamore Walk, Lake Paris... This is the crew. Then the comments... Here's the scheduled value of this work today... So I can see very quickly... in November, if everything goes well, we should bill around $170,000."

**Implementation Phases:**
- Phase 1: Mockup/Design (1 day) - Show Chris for approval
- Phase 2: Basic calendar grid (1-2 days)
- Phase 3: Calculations and totals (1 day)
- Phase 4: Filters and interactions (1 day)

**Acceptance Criteria:**
✅ Calendar view groups work orders by date
✅ Daily and monthly totals calculate correctly
✅ Crew assignments display clearly
✅ Comments visible (hover or column)
✅ Time period filters work
✅ Click interactions functional
✅ Mobile-responsive design
✅ Export capability
✅ Matches Salesforce view per Chris's approval

---

## 📅 SPRINT TIMELINE

### 🔴 ALL TASKS CRITICAL - IMMEDIATE DEADLINE

**TARGET DEADLINE:** Before 5:30 AM Manila (Tuesday)

**All 8 tasks are CRITICAL priority and must be completed immediately.** Marky and Cob/Jacob should sequence efficiently based on dependencies.

**Suggested Sequencing (optional):**
- Task #1 blocks Tasks #3 and #4 (multi-crew assignment foundation)
- Task #2 is independent (change order workflow)
- Tasks #6 and #7 are quick wins (can be done anytime)
- Task #8 is independent (work order calendar)
- Task #5 can be done anytime (dashboard)

**Deliverable:** ALL 8 tasks complete before Tuesday 5:30 AM Manila time

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

**End of February Goal:** All 8 tasks complete, pilot phase ready

**Pilot Requirements:**
✅ All audit findings implemented (Tasks #1, #3, #4, #6, #7)
✅ Change Order workflow functional (Task #2)
✅ Work Order Calendar view complete (Task #8)
✅ Multi-crew assignment working (Task #1)
✅ Crew summaries consistent (Tasks #3, #4)
✅ Crew portal dashboard live (Task #5)
✅ All UI polish complete
✅ Backend integrations tested (Salesforce, SOV validation)
✅ Ready for client team to test with real data

---

**Let's make this happen! 🚀**

**Questions? Check the detailed specs or reach out to Fiona/Nova.**
