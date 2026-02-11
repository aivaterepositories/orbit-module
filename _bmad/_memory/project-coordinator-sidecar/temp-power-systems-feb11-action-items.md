# TPS CRM - Action Items from Feb 11 Meeting with Wayne

**Meeting:** CRM Walkthrough with Wayne McCoy (TPS Project Manager)
**Date:** February 11, 2026
**Transcript:** https://github.com/aivaterepositories/temp-power-final-version-for-real (to be pushed)
**Recording:** https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW

---

## BLOCKERS

### Salesforce Access Lost
- **Status:** BLOCKED
- **Issue:** Cob lost access to Salesforce last week (password changed?)
- **Resolution:** Need to schedule 15-20 min session with Chris to restore access
- **Impact:** Blocks all Salesforce integration work

---

## COB'S ACTION ITEMS

### CRITICAL (Blocks Other Work)
1. **Restore Salesforce Access**
   - Schedule 15-20 min session with Chris
   - Fiona will coordinate scheduling

### HIGH PRIORITY

2. **Remove Archived Jobs from Dashboard Metrics**
   - Dashboard currently calculates SOV, retention, reconciliation for ALL jobs
   - Archive stage jobs should be EXCLUDED from all metrics
   - When job moves to Archive → remove from dashboard calculations
   - Timestamp: [6:56](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=415.9999)

3. **Add Permit/Utility Fields**
   - Waiting for Wayne's screenshot (he'll email Fiona)
   - Fields to add:
     - Dig alert numbers
     - Dig alert expiration dates
     - Permit inspection dates
     - Permit release dates
     - Utility application initiation date
     - Utility account information
     - Application IDs
   - Pull from Salesforce if available
   - Timestamp: [22:43](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=1362.9999)

4. **Pull iPermit Link from Salesforce**
   - Currently NOT being pulled
   - Wayne confirmed Jeff has this at GotJob stage
   - Need to identify Salesforce field name
   - Timestamp: [19:08](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=1148)

5. **Design Change Order / Additional Scope Section**
   - Current Salesforce problem: Every CO creates new GotJob (messy)
   - Need: CO lives under parent job card
   - Child contract amounts sum to parent total
   - SOV reflects all scopes
   - Options:
     - Add "Updates" section with refresh button
     - OR auto-trigger when new child opportunity created with same reference ID
   - Timestamp: [41:27](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=2476.9999)

### MEDIUM PRIORITY

6. **Pull POC Contacts from Salesforce**
   - Salesforce has contact roles per opportunity
   - Primary contact designated
   - Need dropdown in work order creation
   - Allow adding new contacts
   - Timestamp: [2:14:00](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=8040)

7. **Pull Materials/Equipment List from Salesforce**
   - Jeff uses dropdown fields for equipment list (confirmed!)
   - Not Excel attachments as previously thought
   - Can be pulled into Materials & Work Order Builder
   - Timestamp: [1:43:49](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=6229)

8. **Add Sitemap Link Field at Job Level**
   - Auto-populate to all work orders for that job
   - Wayne manually enters once at job level
   - All work orders inherit the link
   - Timestamp: [1:25:19](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=5119.9999)

9. **Add 'Pending' Work Order Status**
   - Wayne creates WOs 2-3 weeks ahead
   - Can't assign crews yet
   - Pending WOs show on calendar but NOT in crew portal
   - Crews only see when status = "Ready for Field Execution"
   - Timestamp: [1:48:16](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=6496.9999)

### LOW PRIORITY (Future)

10. **Research Google Maps API**
    - Auto-generate sitemap links from address
    - Requires API key (paid)
    - Nice-to-have, not critical
    - Timestamp: [1:22:41](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=4970.9999)

---

## MARKY'S ACTION ITEMS

### HIGH PRIORITY

1. **Revamp Billing Schedule View**
   - Wayne shared his current Salesforce task-based scheduling
   - Needs list/report format showing all work for day/week/month
   - Current calendar view insufficient for his workflow
   - He said: "By that view, I can't tell if I've got five jobs, if I've got 20 jobs"
   - Timestamp: [1:55:25](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=6925.9999)

2. **Build Daily/Weekly Materials Report**
   - For Mark (Shop Manager)
   - Consolidated view of ALL materials needed across ALL jobs
   - Filterable by date range
   - Shows: material, job, need-by date, order status
   - Chris said Mark would "go crazy" opening each job individually
   - Timestamp: [58:34](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=3514.9999)

3. **Add Crew Portal Fields**
   - Missing from work order view:
     - Customer name (e.g., "ABC Construction")
     - Job name
     - POC name (not just phone number)
   - Wayne: "They need to know who they're working for"
   - Timestamp: [2:08:58](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=7738.9999)

### MEDIUM PRIORITY

4. **Add POC Dropdown in Work Order Creation**
   - Dropdown from Salesforce contacts (Cob provides data)
   - Ability to add new contacts
   - Designate primary contact
   - Timestamp: [2:13:00](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=7980)

5. **Add Sitemap Link Field at Job Card Level**
   - Field for Wayne to paste Google Maps link once
   - Auto-populates to all work orders for that job
   - Timestamp: [1:25:19](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=5119.9999)

6. **Add Pending Status for Work Orders**
   - New status option in work order creation
   - Pending = visible on calendar, hidden from crew portal
   - Ready for Field Execution = visible to assigned crew
   - Timestamp: [1:48:16](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=6496.9999)

---

## SCOPE CLARIFICATION

Chris confirmed all items above are within current scope of work:
> "But for those stuff, yeah, those very incidental stuff are like creating additional fields, that's still part of your work scope of work and would not trigger another project proposal."

---

## KEY CONTEXT

### Who is Wayne?
- Project Manager at Temp Power Systems
- Primary user of work order & scheduling features
- Creates 3-6 work orders per crew per day
- Plans 2-3 weeks ahead
- Coordinates materials with Mark (Shop Manager)
- First time seeing the CRM in this meeting

### Wayne's Reaction
- "This is absolutely amazing because it gives more information than we've ever been able to acquire"
- Very impressed with Schedule of Values visibility
- Identified workflow gaps based on his daily operations
- Positive adoption signals

### Pilot Timeline
- Target: End of February 2026
- Status: ON TRACK
- These items should be implemented before pilot

---

## NEXT SESSION AGENDA

1. Cob + Chris: Salesforce access restoration
2. Fiona + Cob + Marky: CO/Additional Scope section design
3. Wayne: Hands-on CRM testing

---

**Document Created:** 2026-02-12
**Created By:** Nova (On behalf of Fiona)
