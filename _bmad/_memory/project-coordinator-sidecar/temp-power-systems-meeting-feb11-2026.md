# Temp Power Systems - CRM Walkthrough & Pilot Test Scenario
## Meeting 5: February 11, 2026 (139 mins)

**Recording:** https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW

---

### Attendees
- Fiona Cafe (Aivate) - PM/Coordinator
- Chris Yates (Temp Power Systems) - Owner
- Wayne McCoy (Temp Power Systems) - Project Manager **[NEW PARTICIPANT]**
- Cob Bautista (Aivate) - Lead Developer (Jacob)
- Mark Jalandoni (Aivate) - Developer (Marky)

### Meeting Objective
Walkthrough of CRM with Wayne (Project Manager) to gather feedback from the primary user who will manage work orders, crew scheduling, and materials coordination.

---

## KEY DEMONSTRATIONS & FEEDBACK

### 1. Dashboard Metrics
**Demonstrated:**
- Schedule of Value (total value of scheduled work - all time)
- Remaining to Bill (SOV minus total invoices)
- Total Retention Pending
- Reconciliation Status (completed contracts + cleared payments)
- Monthly Revenue Trend
- Job Status Distribution

**Chris's Clarification Request:**
> "Is the schedule of values all time? That number is going to grow to the multi..."

**Decision:** Archive stage jobs should be removed from all dashboard calculations (SOV, retention, reconciliation).

---

### 2. Job Card - Sales Summary
**Auto-fetched from Salesforce:**
- Project type
- Contract amount
- Mobilization fee requirement
- Start date
- Description from sales
- Location
- Project manager assignment
- Sales handoff notes

**Status:** Jacob confirmed Salesforce sync triggers on "Close Won" status.

---

### 3. Permits & Utilities Section - MAJOR GAPS IDENTIFIED

**Wayne identified missing fields needed for his workflow:**
- Dig alert numbers
- Dig alert expiration dates
- Permit inspection dates
- Permit release dates
- Utility application initiation date
- Utility account information
- Application IDs

**iPermit Link:**
- Currently NOT being pulled from Salesforce
- Wayne confirmed Jeff typically has this ready at GotJob stage
- Cob confirmed it CAN be pulled if we know the Salesforce field name

**ACTION:** Wayne to email Fiona/Chris with screenshot of Salesforce permit fields. Cob to add all identified fields once Salesforce access restored.

---

### 4. Salesforce Access Issue

**BLOCKER:** Cob lost access to Salesforce (since last week). Chris's account password may have changed.

**ACTION:** Schedule separate 15-20 min session for Chris + Cob to restore access and review Salesforce structure.

---

### 5. Service Suspension & Gatekeeping Discussion

**Chris's Position:**
> "I think that as we're doing these presentations, that we should write down that hey, we might want to look at gatekeeping... I think that we need to be in this thing and using it for a couple weeks before we start assigning gatekeepers."

**Decision:** No gatekeeping during pilot phase. All users can manipulate all fields. Gatekeeping decisions deferred until team has real usage experience.

---

### 6. Change Order Mapping - CRITICAL DISCUSSION

**Current Salesforce Problem:**
- Every change order creates a NEW GotJob
- Results in "20 million got jobs" that are actually additions to same project
- Confuses team trying to track parent/child relationships
- Wayne: "That made absolutely no sense to me"

**Desired CRM Behavior:**
- Change orders should live under parent job card
- Additional scope of work tracked with separate contract amounts
- Child contract amounts sum up to parent contract total
- SOV should reflect all scopes (original + change orders)

**Cob's Proposed Solution:**
- Add "Updates" section at bottom of job card
- Button to scan Salesforce for new child opportunities
- OR trigger when new child created with same reference ID
- System detects updates and pulls new data automatically

**ACTION:** Fiona + Cob to design CO/Additional Scope section and present in next session.

---

### 7. Schedule of Values - Wayne's Reaction

**Wayne:**
> "Wow, so we'll be able to see kind of in real time what's been paid, what our work orders turning into invoices, what's been paid... amazing."

**Chris:**
> "Fiona, just so you and Jacob know how valuable this is to us... this is on her [Angela's] computer, not even in a shared file, so we never really know the status without digging or asking."

---

### 8. Materials & Work Order Builder

**Wayne's Request - Materials Report:**
> "Is there a collective of things that, like, say we need to order that we could compile collectively with all jobs?"

**Need:** Daily/weekly materials report for Mark (Shop Manager) showing:
- All materials needed across all jobs for a specific day/week
- Which job each material is for
- Need-by dates
- Order status

**Current State:** Materials only viewable by opening each job card individually.

**Chris:**
> "Mark or anybody in Mark's position will go crazy if I got to open all these little bubbles every day to find out what I need for today for three weeks out."

**ACTION:** Create materials-needed report filterable by date range.

---

### 9. Materials List from Salesforce

**Wayne's Question:** Can materials/equipment list be auto-populated from Salesforce?

**Discovery:** Jeff creates equipment lists using dropdown fields in Salesforce (not Excel attachments as previously assumed).

**Chris confirmed:** "So, so far, and, yes, they are drop-down fields. So everything that's on that list was put into Salesforce."

**Cob confirmed:** If they're Salesforce fields, we can pull them into CRM.

**ACTION:** Cob to cross-reference Salesforce equipment list fields once access restored.

---

### 10. Sitemap Link - AUTO-POPULATION REQUEST

**Wayne's Pain Point:**
> "For one job, I could have 20,000 work orders... I don't want to type all this stuff over and over again."

**Request:** Add sitemap link field at job level that auto-populates into all work orders for that job.

**Marky confirmed:** "If you guys are going to populate it the first time, and then when you create a work order for the same opportunity... the link will automatically be there."

**Future Enhancement (Cob):** Potentially integrate Google Maps API to auto-generate sitemap links from address. Requires API key ($).

**ACTION:** Add sitemap link field to job card; auto-populate to work orders.

---

### 11. Work Order Status - PENDING STATUS REQUEST

**Problem:** Wayne creates work orders 2-3 weeks in advance but:
- Can't assign crews yet (doesn't know who's available)
- Doesn't want crews to see work orders until day before
- Currently required to assign crew to save work order

**Wayne:**
> "I don't want them to see anything until the day before."

**Chris's Solution:**
> "What if, on the crews, if we had another crew that's called pending?"

**Decision:**
1. Add "Pending" status for work orders
2. Pending work orders appear on calendar but hidden from crew portal
3. Crews only see work orders when status changed to "Ready for Field Execution"
4. Wayne can pre-plan scheduling without alerting crews prematurely

**ACTION:** Add Pending work order status; modify crew portal visibility logic.

---

### 12. Billing Schedule View

**Wayne shared his current Salesforce task-based scheduling view.**

**His Concern:**
> "By that view [our work order calendar], I can't tell if I've got five jobs, if I've got 20 jobs, and what those jobs are."

**His Process:**
- Creates tasks in Salesforce to schedule work
- Views scheduling as list/report format
- Sees all work for day/week/month at a glance
- Creates work orders only day-before

**ACTION:** Revamp Billing Schedule to match Wayne's Salesforce scheduling view format.

---

### 13. Crew Portal - MISSING FIELDS

**Wayne identified missing information in crew work order view:**
- Customer name (e.g., "ABC Construction")
- Job name
- Point of contact NAME (not just phone number)

**POC Enhancement:**
- POC should be dropdown from Salesforce contacts
- Ability to add new contacts
- Designate primary contact

**Wayne:**
> "They need to know who they're working for, who the account holder is, what the job name is. And then who the point of contact is."

**ACTION:** Add customer name, job name, POC name to crew portal work order view. Implement POC dropdown from Salesforce contacts.

---

## ACTION ITEMS SUMMARY

### For Cob (Backend/Salesforce)

| # | Action Item | Priority | Blocker |
|---|-------------|----------|---------|
| 1 | Restore Salesforce access (schedule 15-20 min with Chris) | CRITICAL | Blocks all SF work |
| 2 | Remove archived jobs from dashboard metrics (SOV, retention, reconciliation) | High | - |
| 3 | Add permit/utility fields (dig alerts, expiration dates, inspection dates, utility app info) | High | Need Wayne's screenshot |
| 4 | Pull iPermit link from Salesforce | High | Need field name |
| 5 | Design CO/Additional Scope section with SOV mapping | High | Need design session |
| 6 | Pull POC contacts from Salesforce opportunity | Medium | SF access |
| 7 | Pull materials/equipment list dropdowns from Salesforce | Medium | SF access |
| 8 | Add sitemap link field at job level → auto-populate work orders | Medium | - |
| 9 | Add 'Pending' work order status (hide from crew portal) | Medium | - |
| 10 | Research Google Maps API for auto sitemap (future) | Low | - |

### For Marky (Frontend/Simulator)

| # | Action Item | Priority |
|---|-------------|----------|
| 1 | Revamp Billing Schedule to match Wayne's SF task view format | High |
| 2 | Build daily/weekly materials-needed report for Mark | High |
| 3 | Add crew portal fields: Customer name, Job name, POC name | High |
| 4 | Add POC dropdown in work order creation (from contacts) | Medium |
| 5 | Add sitemap link field at job card level | Medium |
| 6 | Add Pending status option for work orders | Medium |

### For Fiona

| # | Action Item | Priority |
|---|-------------|----------|
| 1 | Schedule SF access session with Chris + Cob | CRITICAL |
| 2 | Follow up with Wayne for permit fields screenshot | High |
| 3 | Design CO/Additional Scope section (with Cob/Marky) | High |

### Waiting on Client

| # | Item | Owner |
|---|------|-------|
| 1 | Permit/utility fields screenshot | Wayne → Fiona |
| 2 | iPermit link field name in Salesforce | Wayne/Jeff → Fiona |

---

## KEY QUOTES

**Wayne on Schedule of Values:**
> "Wow, so we'll be able to see kind of in real time what's been paid, what our work orders turning into invoices, what's been paid... amazing."

**Wayne on CRM value:**
> "I can say as far as information goes, I think this is absolutely amazing because it gives more information than we've ever been able to acquire."

**Chris on piloting:**
> "And I think that, you know, it's going to take us a month or so of just going through this and just getting a rhythm and saying, okay, this works."

**Wayne on next steps:**
> "Thank you guys so much for your hard work."

---

## SCOPE OF WORK CLARIFICATION

**Chris clarified:** All additional fields requested (permit fields, sitemap, pending status, etc.) are within current scope of work - NOT change orders.

> "But for those stuff, yeah, those very incidental stuff are like creating additional fields, that's still part of your work scope of work and would not trigger another project proposal."

---

## NEXT STEPS

1. **Cob + Chris:** Schedule 15-20 min Salesforce access session
2. **Wayne:** Email permit fields screenshot to Fiona
3. **Fiona + Cob:** Design CO/Additional Scope section
4. **Marky:** Implement billing schedule revamp + materials report
5. **All:** Prepare for Wayne's first hands-on CRM testing

---

## PILOT READINESS STATUS

**On Track:** End of February 2026

**New Insights from Wayne:**
- Primary user perspective validated CRM design
- Several workflow gaps identified and documented
- Wayne's enthusiasm indicates good adoption potential
- Materials report and billing schedule are key productivity features

---

**Meeting Duration:** 139 minutes
**Documented by:** Nova (Project Coordinator)
**Date:** 2026-02-12
