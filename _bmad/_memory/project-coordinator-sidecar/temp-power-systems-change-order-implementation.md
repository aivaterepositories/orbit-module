# Temp Power Systems - Change Order Implementation Specification

**Date:** 2026-02-02
**Source:** Change Order SOP provided by Fiona
**Status:** UNBLOCKED - Ready for Implementation

---

## OVERVIEW

Change Order (CO) Process is an exception-handling workflow for major scope deviations discovered after contract execution. Every CO is nested under the original Job (no duplicate opportunities). Process ensures client signatures, SOV adjustment, and Pre-Lien reconciliation.

**Key Principle:** Clean job record - all changes nested under original Job, not separate opportunities.

---

## WORKFLOW STAGES

### Stage 1: Initiation and Request Documentation
**Owner:** Production Manager (Wayne) or Any Department
**Goal:** Document scope deviation and create formal CO request

### Stage 2: Sales Quoting and Client Approval
**Owner:** Sales (Jeff)
**Goal:** Generate quote, secure client signature on addendum

### Stage 3: Mini-Compliance Check and Financial Update
**Owner:** Contracts (Sandra) + Accounting (Angela)
**Goal:** File documents, update SOV, reconcile contract amount and pre-lien

### Stage 4: Execution Release
**Owner:** Production Manager (Wayne)
**Goal:** Release new scope for field execution

---

## TECHNICAL REQUIREMENTS FOR IMPLEMENTATION

### 1. UI COMPONENTS NEEDED

#### A. Change Order Request Button
**Location:** Sales Summary section in job card
**Label:** "Change Order Request" or "CO Request"
**Behavior:** Triggers CO Request Form modal/page

**Visual Design:**
- Prominent button (high visibility)
- Orange or yellow color (indicates exception process)
- Icon: Document with plus sign or similar
- Disabled if CO already in progress for this job

---

#### B. Smart Alert for Pending CO
**Location:** Top of job card (above all sections)
**Trigger:** When CO Request is initiated but not yet completed
**Message:** "⚠️ Change Order in Progress - [Status Stage]"

**Status Display:**
- Stage 1: "CO Request Pending Sales Quote"
- Stage 2: "CO Awaiting Client Signature"
- Stage 3: "CO Pending Financial Update"
- Stage 4: "CO Ready for Execution"

**Visual Design:**
- Yellow/orange banner at top of job card
- Clickable to view CO details
- Shows current owner and next action needed
- Dismisses automatically when CO process completes

---

#### C. Change Order Request Form
**Trigger:** Click "Change Order Request" button
**Layout:** Modal or dedicated page

**REQUIRED FIELDS:**

1. **Change Scope Description** (Rich Text Area)
   - Field Label: "Detailed Description of Change Scope"
   - Help Text: "Describe what is changing and why"
   - Required: Yes
   - Validation: Minimum 50 characters

2. **Estimated Material List** (Text Area or Link)
   - Field Label: "Estimated Materials Required"
   - Help Text: "List materials needed for this change, or link to preliminary list"
   - Required: Yes
   - Option: Upload file OR paste text OR link to existing materials

3. **Affected Phase/Work Order** (Dropdown)
   - Field Label: "Phase or Work Order Affected"
   - Options: Populated from existing SOV phases or work orders in this job
   - Required: Yes
   - Multi-select: Yes (CO can affect multiple phases)

4. **Proposal Link** (Optional - Sales Use)
   - Field Label: "Link to Sales Proposal (if Sales-initiated)"
   - Help Text: "Sales can link existing proposal to bypass redundant data entry"
   - Required: No
   - Visible: Only if initiated by Sales user

5. **Estimated CO Amount** (Currency)
   - Field Label: "Estimated Change Order Value"
   - Help Text: "Estimated dollar value of this change (+ for addition, - for deduction)"
   - Required: Yes
   - Validation: Must be numeric, can be negative

6. **Urgency Level** (Dropdown)
   - Field Label: "Change Order Urgency"
   - Options: Standard / High / Critical
   - Required: Yes
   - Default: Standard

**BUTTONS:**
- "Submit CO Request" (Primary action - triggers workflow)
- "Save Draft" (Secondary - saves without triggering workflow)
- "Cancel" (Returns to job card)

---

#### D. Change Order Tracking Section
**Location:** New section in job card (after Sales Summary, before Contracts)
**Label:** "Change Orders"
**Visibility:** Only appears if CO has been initiated

**Display:**
- List of all COs for this job (can have multiple)
- Each CO shows:
  - CO Number (auto-generated: CO-[JobID]-[001])
  - Status (Stage 1-4 or Completed)
  - Initiated Date
  - Initiated By (user name)
  - CO Amount
  - Current Owner (who needs to act next)
  - Action button ("View Details")

**Detailed CO View:**
- All form data from CO Request
- Workflow progress tracker (visual timeline)
- Documents uploaded (quotes, signed addendums)
- Task history (who did what, when)
- Comments/notes thread
- Status update buttons (stage-specific)

---

### 2. WORKFLOW AUTOMATION

#### A. Stage 1: Initiation → Sales Handoff

**Trigger:** User clicks "Submit CO Request" on CO Request Form

**System Actions:**
1. Generate CO Number: CO-[JobID]-[sequential number starting 001]
2. Create Smart Alert at top of job card: "⚠️ CO Request Pending Sales Quote"
3. Create Task for Sales (Jeff):
   - Title: "Generate quote for Change Order CO-[JobID]-[001]"
   - Description: Include all CO Request form data
   - Priority: Based on urgency level from form
   - Due Date: Based on urgency (Critical: 1 day, High: 3 days, Standard: 5 days)
4. Send Notification to Sales:
   - Email + In-app notification
   - Subject: "Change Order Request: [Job Name]"
   - Body: Include CO details, link to job card
5. Update CO Status: "Stage 1 - Pending Sales Quote"
6. Log Activity in job card timeline: "[User] initiated Change Order CO-[JobID]-[001]"

---

#### B. Stage 2: Sales → Contracts Handoff

**Trigger:** Sales marks "Client Signature Obtained" in CO tracking

**Required Upload:** Signed quote/contract addendum document

**System Actions:**
1. Update Smart Alert: "⚠️ CO Pending Mini-Compliance Check"
2. Create Task for Contracts (Sandra):
   - Title: "File Change Order addendum and run mini-compliance check for CO-[JobID]-[001]"
   - Description: Include CO details + link to signed document
   - Priority: High (compliance critical)
   - Due Date: 2 business days
3. Send Notification to Contracts:
   - Email + In-app notification
   - Subject: "Change Order Compliance Required: [Job Name]"
   - Attachment: Link to signed addendum
4. Update CO Status: "Stage 2 - Mini-Compliance Check"
5. Complete Sales Task automatically
6. Log Activity: "[Sales User] obtained client signature on CO-[JobID]-[001]"

---

#### C. Stage 3: Contracts → Accounting Handoff

**Trigger:** Contracts marks "Documents Filed" in CO tracking

**System Actions:**
1. Update Smart Alert: "⚠️ CO Pending Financial Update"
2. Create Task for Accounting (Angela):
   - Title: "Update SOV and contract amount for CO-[JobID]-[001]"
   - Description: "Contract amount changed by [CO Amount]. Update SOV, contract total, and Pre-Lien amount."
   - Priority: High
   - Due Date: 3 business days
3. Send Notification to Accounting:
   - Email + In-app notification
   - Subject: "Change Order Financial Update Required: [Job Name]"
   - Details: Original contract amount, CO amount, new total
4. Update CO Status: "Stage 3 - Financial Update"
5. Complete Contracts Task automatically
6. Log Activity: "[Contracts User] filed CO documents and completed mini-compliance check"

**CRITICAL: SOV Update UI**
- When Angela opens CO task, provide direct link to SOV section
- Display warning if SOV doesn't balance with new contract amount
- Show: Original Amount, CO Amount, New Total, Current SOV Total, Variance
- Must rebalance SOV before marking CO as financially updated

---

#### D. Stage 4: Accounting → Production Release

**Trigger:** Accounting marks "Financial Update Complete" in CO tracking

**Validation Required:**
- SOV phases total = New contract amount (Original + CO)
- Pre-Lien amount updated (if applicable)
- Contract amount in job card matches new total

**System Actions:**
1. Update Smart Alert: "⚠️ CO Ready for Execution"
2. Create Task for Production Manager (Wayne):
   - Title: "Release Change Order scope for execution: CO-[JobID]-[001]"
   - Description: "Financial reconciliation complete. Update work order and release for field execution."
   - Priority: Standard
   - Due Date: Based on original urgency level
3. Send Notification to Production Manager:
   - Email + In-app notification
   - Subject: "Change Order Ready for Execution: [Job Name]"
4. Update CO Status: "Stage 4 - Ready for Execution"
5. Complete Accounting Task automatically
6. Log Activity: "[Accounting User] completed financial reconciliation for CO-[JobID]-[001]"

---

#### E. Completion: Production Release

**Trigger:** Production Manager marks "Released for Execution" in CO tracking

**System Actions:**
1. Remove Smart Alert from job card
2. Update CO Status: "Completed"
3. Add CO amount to contract amount in Sales Summary (if not already done)
4. Mark all associated tasks as complete
5. Log Activity: "[PM User] released CO-[JobID]-[001] for field execution"
6. Archive CO in "Change Orders" section (still visible but collapsed)
7. Send Completion Notification to all stakeholders:
   - Sales, Contracts, Accounting, Production Manager
   - Subject: "Change Order Complete: [Job Name] - CO-[JobID]-[001]"

---

### 3. DATA MODEL UPDATES

#### A. New Database Table: change_orders

```
change_orders
- id (primary key)
- job_id (foreign key to jobs table)
- co_number (string, format: CO-[JobID]-[001])
- status (enum: draft, stage1, stage2, stage3, stage4, completed)
- initiated_by (user_id)
- initiated_date (timestamp)
- change_scope_description (text)
- estimated_materials (text)
- affected_phases (JSON array of phase IDs)
- proposal_link (string, optional)
- estimated_amount (decimal)
- urgency_level (enum: standard, high, critical)
- signed_addendum_url (string, set in stage 2)
- financial_update_date (timestamp, set in stage 3)
- released_date (timestamp, set in stage 4)
- created_at (timestamp)
- updated_at (timestamp)
```

#### B. Update jobs table

Add field:
- `total_change_orders_amount` (decimal) - sum of all completed COs for this job

#### C. Update schedule_of_values table

Add field:
- `source` (enum: original, change_order) - indicates if phase came from original contract or CO
- `change_order_id` (foreign key, nullable) - links to specific CO if applicable

---

### 4. SALESFORCE INTEGRATION

#### A. Critical Requirement: NO Duplicate Opportunities

**Implementation:**
- Change Orders are NOT created as new opportunities in Salesforce
- COs are nested under the original opportunity as child records or updates
- When CO is completed, update the parent opportunity's contract amount

**Salesforce Update Trigger:**
- When CO reaches "Stage 4 - Ready for Execution"
- Before updating, check: Does Salesforce opportunity exist for this job?
- Update opportunity's contract amount field: Original + CO Amount = New Total
- Add note/activity in Salesforce opportunity: "Change Order CO-[number] added: [amount]"

**Mapping:**
- CRM Job ID → Salesforce Opportunity ID (must have this mapping table)
- CRM CO → Salesforce Opportunity Note/Activity (not separate opportunity)

---

### 5. NOTIFICATIONS SPECIFICATION

#### A. Email Templates Needed

**1. CO Request Initiated (to Sales)**
```
Subject: Change Order Request: [Job Name]
Body:
Hi [Sales Name],

A Change Order has been requested for [Job Name].

CO Number: CO-[JobID]-[001]
Initiated By: [User Name]
Urgency: [Urgency Level]

Change Scope:
[Description]

Estimated Materials:
[Materials List]

Affected Phases: [Phase Names]
Estimated Amount: [Amount]

Action Required: Generate quote and obtain client signature.

[View Change Order Details Button]

Thanks,
Temp Power Systems CRM
```

**2. Client Signature Obtained (to Contracts)**
```
Subject: Change Order Compliance Required: [Job Name]
Body:
Hi Sandra,

Sales has obtained client signature for a Change Order.

CO Number: CO-[JobID]-[001]
Job: [Job Name]
CO Amount: [Amount]

Action Required:
- File signed addendum in job folder
- Run mini-compliance check
- Notify Accounting when complete

[View Signed Addendum] [View Change Order Details]

Thanks,
Temp Power Systems CRM
```

**3. Compliance Complete (to Accounting)**
```
Subject: Change Order Financial Update Required: [Job Name]
Body:
Hi Angela,

A Change Order has completed compliance check and requires financial reconciliation.

CO Number: CO-[JobID]-[001]
Job: [Job Name]

Original Contract Amount: [Original Amount]
Change Order Amount: [CO Amount]
New Contract Total: [New Total]

Action Required:
- Update Schedule of Values to reflect new contract amount
- Reconcile Pre-Lien amount (if applicable)
- Update contract amount in job card

[Update SOV Now] [View Change Order Details]

Thanks,
Temp Power Systems CRM
```

**4. Financial Update Complete (to Production Manager)**
```
Subject: Change Order Ready for Execution: [Job Name]
Body:
Hi Wayne,

A Change Order has completed financial reconciliation and is ready for execution.

CO Number: CO-[JobID]-[001]
Job: [Job Name]
CO Amount: [Amount]

Action Required:
- Review change scope
- Update associated work order
- Release for field execution when ready

[View Change Order Details] [View Work Orders]

Thanks,
Temp Power Systems CRM
```

**5. CO Complete (to All Stakeholders)**
```
Subject: Change Order Complete: [Job Name]
Body:
The following Change Order has been completed and released for execution.

CO Number: CO-[JobID]-[001]
Job: [Job Name]
CO Amount: [Amount]
New Contract Total: [New Total]

Timeline:
- Initiated: [Date] by [User]
- Client Approved: [Date]
- Financially Reconciled: [Date]
- Released: [Date]

[View Job Card] [View Change Order History]

Thanks,
Temp Power Systems CRM
```

---

### 6. UI/UX CONSIDERATIONS

#### A. Mobile Responsiveness
- CO Request Form must work on tablets (Wayne uses iPad in field)
- Smart Alert visible on mobile view
- Status tracking accessible on phones

#### B. Visual Design
- CO section distinct from regular job sections (use accent color: orange/yellow)
- Progress tracker shows current stage clearly
- Documents easy to upload/view
- Status badges color-coded (yellow = pending, green = complete)

#### C. Permissions
- **Initiate CO:** Production Manager, Sales, Admin
- **Update Sales Stage:** Sales, Admin
- **Update Contracts Stage:** Contracts, Admin
- **Update Accounting Stage:** Accounting, Admin
- **Release for Execution:** Production Manager, Admin
- **View CO Details:** All manager-level and admin users
- **Crew Portal:** Cannot see Change Orders (not relevant to their work)

---

### 7. REPORTING & ANALYTICS

#### A. Dashboard Metrics (Optional Enhancement)
- Total Change Orders This Month/Year
- Average CO Processing Time (days from initiation to completion)
- CO Value vs Original Contract Value (percentage)
- Pending COs by Stage (how many stuck in each stage)

#### B. Job Card Display
- Total COs for this job (count)
- Total CO Amount added to original contract
- Contract Amount breakdown: Original + COs = Total

---

### 8. TESTING SCENARIOS

#### A. Happy Path
1. Wayne initiates CO Request for additional scope
2. Jeff generates quote, uploads signed addendum
3. Sandra files documents, completes mini-compliance
4. Angela updates SOV (balances correctly), updates pre-lien
5. Wayne releases for execution
6. All notifications sent, tasks auto-completed

#### B. Multiple COs on Same Job
1. Initiate CO-001
2. While CO-001 is in Stage 2, initiate CO-002
3. Both COs track independently
4. Both update contract amount cumulatively
5. SOV reflects: Original + CO-001 + CO-002 = Total

#### C. Deduction CO (Negative Amount)
1. Wayne initiates CO with negative amount (scope reduction)
2. System accepts negative values
3. Contract amount decreases: Original - Deduction = New Total
4. SOV must rebalance to lower total
5. Pre-lien adjusts accordingly

#### D. SOV Imbalance Error Handling
1. Angela updates contract amount but forgets to rebalance SOV
2. System detects: New Contract Total ≠ SOV Phase Total
3. Warning displayed: "SOV does not balance. Variance: [amount]"
4. Cannot mark "Financial Update Complete" until balanced

#### E. Salesforce Sync Failure
1. CO reaches Stage 4
2. System attempts to update Salesforce
3. Salesforce API returns error
4. System logs error, sends alert to admin
5. Manual intervention required (flag for Cob/Jacob)

---

## IMPLEMENTATION PRIORITY

### Phase 1: Core Workflow (Week 1-2)
- CO Request button and form
- Smart Alert system
- Workflow stages and task automation
- Basic notifications

### Phase 2: Financial Integration (Week 2-3)
- SOV update validation
- Contract amount reconciliation
- Pre-lien adjustment logic

### Phase 3: Salesforce Sync (Week 3-4)
- Opportunity amount update (no duplicate opportunities)
- Error handling and logging

### Phase 4: Polish & Testing (Week 4)
- UI refinements
- Full workflow testing
- Edge case validation
- User acceptance testing

---

## ESTIMATED EFFORT

**Mark (Front-End):**
- CO Request Form: 1-2 days
- Smart Alert System: 1 day
- CO Tracking Section: 2-3 days
- Workflow UI (stage updates): 2 days
- **Total: 6-8 days**

**Cob/Jacob (Back-End):**
- Database schema: 0.5 day
- Workflow automation logic: 2-3 days
- Task generation system: 1-2 days
- Notification system: 1-2 days
- SOV validation logic: 1-2 days
- Salesforce integration: 2-3 days
- **Total: 8-13 days**

**OVERLAP:** 2-3 weeks working in parallel (front-end + back-end)

---

## ACCEPTANCE CRITERIA

✅ CO Request button visible in job card Sales Summary section
✅ CO Request Form captures all required fields with validation
✅ Smart Alert appears and updates through workflow stages
✅ Tasks auto-generate for each handoff (Sales, Contracts, Accounting, PM)
✅ Notifications sent via email at each stage
✅ SOV validation prevents financial completion if unbalanced
✅ Contract amount updates correctly (additive and deductive COs)
✅ Multiple COs can be tracked on same job independently
✅ Salesforce opportunity updates with new contract amount (NO duplicate opportunities)
✅ CO history visible and archived after completion
✅ All 5 email templates working
✅ Mobile-responsive design
✅ Permissions enforced (only authorized users can update stages)

---

## ✅ CLARIFICATIONS FROM FIONA (ANSWERED)

### 1. Pre-Lien Amount Calculation
**Answer:** Manual field only - Angela calculates and enters manually
**Implementation:**
- Pre-Lien field in accounting section (text/currency input)
- NO auto-calculation logic needed
- Angela has full control to update as needed

### 2. Urgency Levels and Due Dates
**Answer:** Use specified timelines
**Implementation:**
- Critical: 1 business day per stage
- High: 3 business days per stage
- Standard: 5 business days per stage
- Due dates auto-calculate based on urgency level selected

### 3. QuickBooks Integration
**Answer:** NO integration with QuickBooks
**Implementation:**
- QuickBooks is separate platform - no sync needed
- Angela manually enters data into QB as needed
- CRM tracks billable amounts, QB handles actual payments
- Remove all QB integration from spec

### 4. Service Suspension During CO
**Answer:** NO automatic suspension - Smart Alert only
**Implementation:**
- Display Smart Alert at top of job card: "⚠️ Change Order in Progress for This Job"
- NO automatic work stoppage
- Manual service suspension remains separate workflow if needed
- Remove suspension checkbox from CO Request Form

### 5. Client Notifications
**Answer:** NO external client notifications - Internal team only
**Implementation:**
- When CO initiated: Send internal email to all admin users
- Email subject: "Internal Alert: Change Order Initiated on [Job Name]"
- Include: CO number, initiated by, urgency level, estimated amount
- NO emails sent to external client (Sales handles all client communication manually)

### 6. CO Rejection/Cancellation Flow
**Answer:** Allow notes, editing, and full cancellation
**Implementation:**
- Add "Notes" field in CO tracking (for rejection reasons, etc.)
- Allow editing of CO amount after initial submission
- Add "Cancel CO" button (visible to CO initiator and admins)
- When canceled:
  - Archive CO with "Canceled" status
  - Remove Smart Alert
  - Log activity: "[User] canceled CO-[number] - Reason: [note]"
  - Notify stakeholders of cancellation
- Notes visible to all users who can view CO details

---

---

## 🎯 MARKY: YOUR TASKS (Front-End)

### Priority Order:
1. **IMMEDIATE:** Task #6 - Add new job notification (1 day)
2. **IMMEDIATE:** Task #7 - Phone number field in crew profile (1 day)
3. **THIS WEEK:** Task #1 - Multi-crew assignment (3-4 days)
4. **NEXT WEEK:** Task #3 - Crew summary redesign (2 days)
5. **NEXT WEEK:** Task #4 - Crew summary in extras (1 day)
6. **WEEK 2-3:** Task #2 - Change Order UI (6-8 days)
7. **WEEK 3-4:** Task #5 - Crew portal dashboard (4-5 days)

### Change Order UI Components You'll Build:
- **CO Request Button** in Sales Summary section
- **CO Request Form** with all required fields (see Section 1.C above)
- **Smart Alert System** at top of job card
- **CO Tracking Section** showing all COs for job
- **Detailed CO View** with workflow progress
- **Stage Update Buttons** for Sales, Contracts, Accounting, PM
- **Notes Field** for rejection reasons
- **Edit CO Amount** capability
- **Cancel CO Button** and confirmation dialog
- **Mobile-responsive design** for iPad/phones

### Key Features:
✅ CO Request Form validates required fields
✅ Smart Alert updates through workflow stages
✅ Multiple COs can exist on same job
✅ Support negative amounts (deduction COs)
✅ Cancel CO removes alert and archives

---

## 🎯 COB/JACOB: YOUR TASKS (Back-End)

### Priority Order:
1. **WEEK 2-3:** Task #2 - Change Order backend (8-13 days)
2. **WEEK 3-4:** Task #5 - Crew portal dashboard data queries (support Marky)

### Change Order Backend Components You'll Build:

#### Database:
- **New table:** `change_orders` (see Section 3.A for schema)
- **Update:** `jobs` table (add `total_change_orders_amount`)
- **Update:** `schedule_of_values` table (add `source` and `change_order_id`)

#### Workflow Automation:
- **CO Initiation:** Generate CO number, create Smart Alert, task for Sales
- **Stage 2 Handoff:** Update alert, create task for Contracts
- **Stage 3 Handoff:** Update alert, create tasks for Sandra then Angela
- **Stage 4 Handoff:** Update alert, create task for Production Manager
- **Completion:** Remove alert, archive CO, notify all stakeholders

#### Notifications:
- **5 Email Templates** (see Section 5.A for all templates)
- **Internal Admin Alert** when CO initiated (NEW - per Fiona's answer)
- **Cancellation notification** when CO canceled

#### Validation Logic:
- **SOV Validation:** Prevent financial completion if SOV doesn't balance with new contract amount
- **Contract Amount Updates:** Cumulative CO tracking (Original + CO1 + CO2 = Total)
- **Multiple CO Support:** Independent tracking, cumulative amounts

#### Salesforce Integration:
- **Update parent opportunity** contract amount when CO completes
- **NO duplicate opportunities** - nest under original job
- **Error handling** if Salesforce sync fails

### Key Features:
✅ Pre-Lien field is manual (NO auto-calculation)
✅ NO QuickBooks integration
✅ NO automatic service suspension
✅ NO client-facing notifications (internal team only)
✅ Support CO notes, editing, and cancellation
✅ Urgency-based due dates (Critical: 1 day, High: 3 days, Standard: 5 days)

---

**Document Created:** 2026-02-02
**Document Updated:** 2026-02-02 (with Fiona's clarifications)
**Status:** Ready for implementation - All questions answered
**Next Step:** Marky and Cob/Jacob begin development per priority order above
