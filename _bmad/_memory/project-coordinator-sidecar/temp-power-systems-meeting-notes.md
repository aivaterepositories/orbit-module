# Temp Power Systems - Meeting Notes Summary

**Project:** Temp Power Systems CRM
**Team:** Marky (Simulator), Cob/Jacob (Real CRM), Fiona (PM/Coordinator)
**Client Contact:** Chris Yates (Owner)
**Period Covered:** November 20, 2025 - January 7, 2026

---

## Meeting 1: November 20, 2025 (88 mins)

### Attendees
- Fiona Cafe (Aivate)
- Chris Yates (Temp Power Systems)
- Cob Bautista (Jacob - Lead Developer)

### Key Demonstrations
- **Demo vs Live Environment Strategy** - Two separate environments to prevent production issues
- **Dashboard Metrics** - KPIs including scheduled value, monthly revenue, job distribution
- **Job Card Structure** - Compartmentalized sections for sales, contracts, accounting, permits
- **Sprint Structure** - 6 sprints in "Got Job" phase covering full workflow
- **Automation Preview** - Simulate one deal button showing data capture

### Major Decisions
1. **Maintenance Phase** - Initially planned, later removed as not applicable to workflow
2. **Dashboard Refinements:**
   - Keep: Scheduled value, monthly revenue, job status distribution, deposit alerts
   - Remove: Recent work orders section
   - Add: "Remaining to bill" metric
   - Add: Jobs awaiting execution (signed contracts, not yet scheduled)

3. **Salesforce Integration:**
   - API token approach approved (security)
   - Fiona granted temporary Salesforce access
   - Parent/child job structure to be mapped
   - Change orders tracked as child opportunities

4. **Email Notifications:**
   - Thank you emails automated
   - Send from Sandra's email (contracts@) not solutions@aivate.net
   - AI-powered dynamic greetings planned

### Client Team Structure Identified
- **Chris Yates** - Owner, final approvals
- **Jeff** - Sales, opportunity creation, permit coordination
- **Sandra** - Contracts & compliance
- **Angela** - Accounting, billing, invoicing
- **Wayne** - Project Manager, work order creation, crew scheduling
- **Mark** - Shop Manager, materials/equipment procurement

### Client Feedback
- "This is more information than we have now"
- Loves compartmentalized structure vs scattered Salesforce documents
- Concerned about contract amount vs schedule of values complexity
- Wants simple formula: scope of work + change orders only

### Action Items Generated
- Deploy Salesforce API integration
- Refine dashboard metrics per feedback
- Design work order calendar view (like Salesforce schedule view)
- Create employee management section
- Implement dark mode toggle

### Next Steps
- Demo scheduled for December 1st
- One week sprint to implement feedback
- Team available through Thanksgiving (not PH holiday)

---

## Meeting 2: December 4, 2025 (27 mins)

### Attendees
- Fiona Cafe (Aivate)
- Chris Yates (Temp Power Systems)
- Jacob (Dev - via audio)

### Key Demonstrations
- **Updated Dashboard** - Refined metrics based on previous feedback
- **Work Order Management** - Major new feature showcase
- **Three-Tier Access System:**
  - Admin (Chris) - See everything
  - Manager (Wayne) - Specific sections
  - Crew - Limited to assigned work orders only

### Work Order Management Features Shown
- Auto-generated work order numbers
- Scope of work entry
- Crew assignment
- Additional work tasks with billing amounts
- Completion status tracking
- Customer contact info
- Site map links
- Safety notes

### Major Decisions
1. **Work Order Builder Approved** - Ready for deployment to live
2. **User Account Provisioning:**
   - Chris to provide user list (name, email, title)
   - Three access levels to be assigned
   - Crew can self-register via work order notification

3. **Certificate Management:**
   - Upload capability for crew certifications
   - Expiration date tracking
   - Alert system for expiring certs
   - Chris uploads (not crew self-service)

### Client Feedback
- "Love it. Love it. Love it."
- "Lots of good progress"
- Work order structure matches their needs perfectly
- Scope of work copy/paste from quotes will work well

### Action Items Generated
1. Deploy Work Order Management to live CRM
2. Chris email user list (name, email, title)
3. Fiona/Jacob provision user accounts
4. Add cert/expiration upload to People Management
5. Access Salesforce org Chris shared
6. Email Chris next demo invite

### Technical Requirements Captured
- Schedule of Values must match Salesforce parent/child structure
- Work orders feed into SOV for billing tracking
- System must prevent SOV imbalance (won't save if totals don't match)

### Next Steps
- Salesforce access granted
- Jacob to begin API integration mapping
- User accounts to be created
- Demo to be scheduled

---

## Meeting 3: December 10, 2025 (78 mins)

### Attendees
- Fiona Cafe (Aivate)
- Chris Yates (Temp Power Systems)
- Angela (Accounting - joined mid-meeting)

### Key Demonstrations
- **Crew Portal** - Login via UID, work order view, e-signature capture
- **Login Page** - Admin/manager vs crew member login paths
- **Schedule of Values (SOV)** - Auto-balancing system
- **Materials & Work Order Builder** - Procurement workflow
- **Task Management** - Auto-generation and manual assignment
- **Job Card Export** - PDF generation capability

### MAJOR BREAKTHROUGH: Schedule of Values
Chris reaction: "That's a moneymaker for us" - Solves 25-year tracking problem

**How it works:**
- Contract amount locked (from Salesforce)
- Angela creates SOV phases
- System prevents saving if phases don't total contract amount
- Tracks: Total contract, amount billed, remaining to bill
- Salesforce change orders auto-update contract amount
- Triggers task to Angela to rebalance SOV

**Why it matters:**
- Prevents losing sight of unbilled work ($8,000 example)
- Cross-references across all dashboard metrics
- Forces data accuracy ("crap in, crap out")
- Provides instant visibility to remaining billable amounts

### Materials & Work Order Builder Workflow
**Wayne's Process:**
1. Reviews preliminary material list from Jeff
2. Adds materials/equipment needed per work order
3. Marks status: "Needs to order"

**Mark's Process (Shop Manager):**
1. Reviews materials marked "Needs to order"
2. Changes status: "Available in-house" OR "Procured on order"
3. Uploads PO document
4. Enters estimated turnaround time
5. Adds need-by date

**Chris's Process (Approval):**
1. Receives task when PO uploaded
2. Reviews: What is it? How much? When needed? Turnaround time?
3. Approves for ordering

**Material Status Legend:**
- Needs to Order (Mark's action needed)
- Available in-house (Ready to go)
- Procured on order (Waiting on vendor)
- All materials must be green before Wayne schedules work order

### Work Order Structure Finalized
**Information Captured:**
- Unique work order number (auto-generated)
- Parent job link
- Scope of work
- Financial info (admin/manager only)
- Schedule logistics with timestamps
- Customer contact
- Site map link
- Safety instructions
- Execution notes from crew
- Additional work done on-site
- Customer digital signature
- Timeline of all activities

**PDF Export Requirements:**
- Must include customer signature
- Show crew member names
- Show time in/out for each crew member
- Attach to invoices Angela sends

### Job Card Sections Reviewed
**Sales Summary:**
- Auto-captured from Salesforce
- Project type (Regular vs Prevailing Wage - detected by "PW" in title)
- Contract amount
- Mobilization requirements
- Sales handoff notes
- Preliminary material list upload

**Contracts & Compliance (Sandra):**
- Contract PO upload with signature tracking
- Insurance certificate
- Billing information
- Compliance package
- Status tracking
- Auto-triggers task to Angela when completed

**Accounting & Deposit (Angela):**
- Deposit requirements tracking
- Payment status
- Pre-lien status
- Service suspension flag
- Accounting documents (pay apps, POs, lien releases - NOT invoices)

**Permits & Utilities:**
- Auto-captured from Salesforce iPermit portal
- Utility company coordination
- Service application status
- Comment section for Jeff/Wayne coordination

**Task Management:**
- Auto-generated tasks from workflows
- Manual task creation capability
- Assignment to team members
- Comment/discussion threads
- Completion tracking
- 0 of 2 completed visibility

### Major Decisions
1. **Maintenance Pipeline** - Keep but redefine as "post-execution awaiting removal"
2. **Change Order Workflow** - Triggers engagement: Sales → Sandra → Angela
3. **SOV Rebalancing** - Auto-task Angela when contract amount changes
4. **Work Order Calendar** - Copy Salesforce schedule view format
5. **Ticket Submission** - Restrict Feature Request/Billing to Admin only

### Client Feedback - Angela's Reaction
Chris called Angela in to see SOV system
- Angela: "Yeah, it is cool"
- Chris: "I'm excited. I love this because now we can all see it."
- Will significantly reduce Angela's number-chasing work
- Forces upstream accuracy (Jeff must fix Salesforce discrepancies)

### Action Items Generated
1. Update Maintenance definition to cover post-execution jobs
2. Restrict Feature Request and Billing Question tickets to Admin only
3. Add Closed pipeline/archive and job search box
4. Implement Salesforce change-order sync to SOV
5. Update Accounting Docs guidance (exclude invoices)
6. Add My Tasks view in Profile
7. Implement task filters (Not Completed, In Progress, Completed)
8. Replace PO link w/ upload; add Need-by Date and Est Turnaround
9. Auto-assign Chris to review/order when PO uploaded
10. Add 'Extra' work order type (not tied to SOV)
11. Add WO PDF export w/ signature
12. Create tech doc for WO calendar/list view
13. Deploy crew portal e-signature

### Technical Requirements Captured
- **Skills List Needed:** Electrician, CPR, OSHA 300, all certifications
- **Materials List Needed:** All 250-1,000 generic equipment/material names
- **PO Workflow:** Upload (not link) + Need by date + Turnaround time
- **SOV Formula:** Must be consistent across all projects

### Timeline Update
- Front-end mostly complete
- Back-end (Jacob) working on Salesforce mapping
- On track for February pilot

---

## Meeting 4: January 7, 2026 (41 mins)

### Attendees
- Fiona Cafe (Aivate)
- Chris Yates (Temp Power Systems)
- Mark Jalandoni (Aivate - briefly)
- Wayne (Production Manager - phone call)

### Happy New Year Exchange
- Fiona: Beach celebration in Philippines
- Chris: In bed by 11pm, loved it

### Key Demonstrations
- **Crew Portal Signature Capture** - Implemented and working
- **Job Search Box** - Added to pipeline view
- **Archive Stage** - New column for closed/completed jobs
- **Job Card PDF Export** - Full job report generation
- **Work Order PDF Export** - For Angela's invoice attachments
- **My Task Management** - Consolidated view in profile
- **Submit Ticket Restrictions** - Feature requests removed for non-admins

### CRITICAL DISCUSSION: Work Order Sequencing

**Phone Call with Wayne (Ambush):**
- Daily work orders: 3-6 per crew (rarely over 6)
- Wayne controls sequential order (not crew discretion)
- Crew must follow Wayne's routing
- Need flexibility if job site conditions change
- Should NOT restrict starting job 2 before job 1 complete

**Solution Decided:**
- Wayne can drag-and-drop work orders to sequence
- Order displayed to crew in crew portal
- Crew can see all assigned work orders
- No technical restriction preventing out-of-order completion
- Flexibility maintained for field conditions

**Priority vs Sequence:**
- Original plan: Flag work orders as "critical"
- Wayne's preference: Explicit sequential ordering
- Decided: Drag-and-drop sequence (simpler, clearer)

### Work Order PDF Export Requirements

**Must Include:**
- Customer signature (captured via crew portal)
- Date and time crew on site
- Work order value
- Crew member names (not just "crew one")
- Individual timestamps: Who arrived when, who left when

**Why Important:**
- Angela attaches to invoices
- Heavily regulated jobs require employee time tracking
- Replaces time card duplication
- Professional appearance for clients

**Multi-Crew Assignment Problem Identified:**
- Current: Only one crew assignable
- Reality: 3 two-man crews (6 people)
- Crews are mix-and-match based on skills/licensing
- Need: Assign multiple crew members per work order
- Need: Individual time in/out for each crew member

**Example Given:**
- Fiona: 2:00 PM - 4:00 PM
- Mark: 2:00 PM - 4:30 PM
- Chris: 2:00 PM - 5:00 PM

### Dashboard Metrics Finalized

**Schedule of Value:**
- Total value of scheduled work across all active jobs

**Remaining to Bill:**
- SOV minus total invoiced
- "Work we've not yet completed or billed"

**Retention Pending:**
- Retention held across all jobs with retention value

**Reconciliation Status:**
- Jobs with completed contracts and cleared payments

**Monthly Revenue Trend:**
- Approved as-is

**Job Status Distribution:**
- Active, Pending Deposit, Completed
- Archive column added (not shown in distribution chart)

### Archive Stage Implementation
- New column in jobs pipeline
- Houses closed/completed projects
- Accessible for historical reference
- Searchable by job title, client, location, project manager
- Keeps active pipeline clean

### Task Management Consolidation
**My Task Management Section:**
- All tasks assigned to logged-in user
- Consolidated view without checking individual jobs
- Click task → jumps to source job card
- Solves "staring blankly at job tiles" problem
- Auto-generated + manually assigned tasks visible

**Why Important:**
- Many auto-generated tasks from workflows
- Tasks assigned by teammates
- Email notifications sent, but single view needed
- Prevents missing action items hidden in job cards

### Client Feedback - Chris's Assessment
**Quote:** "I feel like I'm being irresponsible because I'm not being more critical"

**Specific Praise:**
- "Everything we imagined and then some"
- "Very intuitive"
- "Training will go quickly because it just makes sense"
- Time savings from looking at data that matters
- Complete work orders with signatures
- Professional appearance
- "So many positives here. I'm tremendously excited."

**Efficiency Gains Identified:**
- Task management will "save hours by itself"
- No more staring at job list wondering what to do
- Consolidated view of action items
- Direct links to source jobs

### Action Items Generated
1. Implement crew portal sequencing (drag-and-drop, no start-restriction)
2. Demo simulator to Chris once complete
3. Add Work Order PDF export w/ signature, crew names, timestamps
4. Enable multi-crew assignment on Work Order
5. Add crew-member individual in/out timestamps
6. Send skills list (incl CPR, OSHA) to Chris then to Fiona
7. Send materials/equipment list to Chris then to Fiona
8. Email Chris next demo invite

### Lists Still Needed from Chris
1. **Skills List** - Everything: Electrician, CPR, OSHA 300, all possible certs
2. **Materials List** - All generic equipment/material names (not price list)

**Why Needed:**
- Dynamic search/auto-suggest in dropdowns
- Wayne types "electrician" → shows all electricians
- Wayne types material name → shows in dropdown
- Housed in CRM, not external references

### Timeline & Status Update

**Current Status (January 7, 2026):**
- Front-end: 95% complete
- Back-end: Jacob working on Salesforce mapping
- Salesforce data fetch: COMPLETED
- Waiting to click "green button" to enable live sync

**Next Phase:**
- Minor revisions from today's meeting
- Incorporate skills/materials lists when received
- Back-end automation completion
- Ready for pilot by end of February 2026

**Pilot Plan:**
- Team tests CRM with real data
- Provide feedback on glitches/errors
- Continue revisions until perfect
- Training module creation

### Project Timeline Summary
- **Started:** November 2025
- **Current:** January 2026 (Week 1)
- **Target Pilot:** End of February 2026
- **Status:** ON TRACK (3-month completion timeline maintained)

---

## Cross-Meeting Patterns & Insights

### Client Engagement Trajectory
- **Nov 20:** Cautiously optimistic, providing detailed feedback
- **Dec 4:** "Love it. Love it. Love it." - Enthusiasm building
- **Dec 10:** "That's a moneymaker" - Major value realization (SOV feature)
- **Jan 7:** "Everything we imagined and then some" - Fully confident

### Persistent Challenges Solved
1. **25-Year Problem:** Tracking remaining billable work (SOV solution)
2. **Document Chaos:** Scattered in Salesforce/email (compartmentalized job cards)
3. **Professional Work Orders:** Hand-written/scribbled (digital with signatures)
4. **Time Tracking:** Duplicate entry needs (crew timestamps in work orders)
5. **Material Coordination:** Email chains (integrated workflow)
6. **Task Visibility:** Hidden in various places (My Task Management)

### Key Integration Points
- **Salesforce → CRM:** Opportunity won → Auto-create job
- **Contract Signed → Task:** Auto-assign Angela (accounting setup)
- **Material Needed → Workflow:** Wayne → Mark → Chris approval
- **Work Order Ready → Notification:** Crew receives UID for portal access
- **Work Complete → Task:** Auto-assign Angela (invoice/billing)
- **Change Order → Update:** Salesforce change → CRM contract amount → Task to Angela (rebalance SOV)

### Team Workflow Clarifications
**Sales (Jeff):**
- Creates opportunities in Salesforce
- Coordinates permits and utilities
- Provides preliminary material list
- Handles sales handoff notes

**Contracts (Sandra):**
- Manages contract execution
- Handles compliance documentation
- Uploads insurance certificates
- Triggers accounting workflow

**Accounting (Angela):**
- Creates Schedule of Values
- Manages invoicing and billing
- Tracks deposits and retention
- Reconciles completed work

**Project Manager (Wayne):**
- Reviews preliminary materials
- Builds work orders from SOV
- Assigns crew members
- Sequences daily work orders
- Reviews completed work

**Shop Manager (Mark):**
- Reviews material requests
- Checks in-house availability
- Procures needed equipment
- Uploads POs and documents
- Tracks delivery timelines

**Crew Members:**
- Access portal via UID
- View assigned work orders (sequenced)
- Start/stop time tracking
- Add additional work performed
- Capture customer signatures
- Complete work orders

### Technical Architecture Decisions
1. **Two Environments:** Demo (simulator) + Live (production)
2. **Three Access Tiers:** Admin, Manager, Crew
3. **API Integration:** Token-based (secure, revocable)
4. **Parent/Child Jobs:** Salesforce structure maintained
5. **Auto-Balancing:** SOV must match contract amount
6. **PDF Generation:** Job cards + Work orders exportable
7. **Task Automation:** Workflow-triggered assignments
8. **Notification System:** Email + Text for various triggers

### Hosting & Cost Management
- Supabase credit-based (not subscription)
- ~$3 USD spent so far (cost-efficient)
- Avoiding $120/month subscription waste
- Monitoring token usage during setup
- Will scale based on actual usage

---

## Outstanding Items for Sprint Planning

### Immediate (In Progress)
- Minor UI revisions from Jan 7 meeting
- Crew portal sequencing (drag-and-drop)
- Multi-crew assignment capability
- Individual crew timestamps
- Work order PDF export finalization

### Waiting on Client
- Skills list (Electrician, CPR, OSHA, etc.)
- Materials/equipment list (250-1,000 items)
- User provisioning list (if not yet sent)

### Back-End (Jacob)
- Salesforce mapping completion
- Change order sync automation
- Email/text notification triggers
- "Green button" deployment readiness

### Future Phase (Post-Pilot)
- Employee/People Management module (separate proposal)
- Certificate tracking with expiration alerts
- Crew skill-based assignment automation
- Work order calendar view (Salesforce-like)
- Training module creation

---

## Risk Assessment

### Low Risk
- Client extremely satisfied with progress
- Timeline on track (3 months → February pilot)
- Team communication excellent
- Clear requirements and feedback loop

### Medium Risk
- Dependent on client providing lists (skills, materials)
- Back-end Salesforce integration not yet fully tested live
- User adoption during pilot (change management)

### Mitigation Strategies
- Follow up on outstanding lists from Chris
- Phased deployment: Simulator → Live with safeguards
- Training materials and support during pilot
- Continued iteration based on pilot feedback

---

## Success Metrics Being Delivered

1. ✅ **Time Savings:** Hours saved through task consolidation, search, consolidated views
2. ✅ **Professional Output:** Signed work orders, clean PDFs for invoicing
3. ✅ **Revenue Protection:** SOV tracking prevents lost billable work ($8K example)
4. ✅ **Data Accuracy:** Auto-balancing, validation, forced accuracy
5. ✅ **Workflow Efficiency:** Material coordination, task automation, notifications
6. ✅ **Visibility:** Dashboard KPIs, remaining to bill, real-time status
7. ✅ **Compliance:** Crew certifications, time tracking, document management
8. ✅ **Intuitive UX:** "Training will go quickly because it just makes sense"

---

**Last Updated:** 2026-02-02 by Nova (Project Coordinator)
**Next Demo:** TBD (Fiona to schedule with Jacob's availability)
**Pilot Launch Target:** End of February 2026
