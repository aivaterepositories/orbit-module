# TPS Meeting Feb 11 - Developer Email Drafts

**Status:** DRAFT - Awaiting Fiona's review before sending
**To Send Via:** fiona@aivate.net

---

## EMAIL 1: To Cob (cob@aivate.net)

**Subject:** TPS CRM - Action Items from Wayne Walkthrough (Feb 11)

---

Hi Cob,

We had the CRM walkthrough with Wayne (Chris's Project Manager) yesterday. He'll be the primary user for work orders and scheduling, so his feedback is crucial. Here's what came out of the meeting for you:

### BLOCKER: Salesforce Access

You mentioned you lost access last week. This blocks most of the backend work. I'm scheduling a 15-20 min session with Chris to get you reconnected. Will send the invite shortly.

### High Priority Items

**1. Remove Archived Jobs from Dashboard Metrics**
When a job moves to Archive stage, it should be excluded from:
- Schedule of Value calculation
- Retention Pending
- Reconciliation Status

Currently it's calculating all-time including archived jobs.

**2. Add Permit/Utility Fields**
Wayne identified several missing fields in the Permits section. He's sending me a screenshot of what they track in Salesforce:
- Dig alert numbers + expiration dates
- Permit inspection dates + release dates
- Utility application info, account IDs, application IDs

These should be pulled from Salesforce if available. I'll forward Wayne's screenshot when I receive it.

**3. iPermit Link**
This isn't being pulled from Salesforce currently. Wayne confirmed Jeff has it at GotJob stage. Once you have SF access, check for the field name and pull it.

**4. Change Order / Additional Scope Section**
The big one. Their current Salesforce setup creates a new GotJob for every change order, which is messy. They want change orders to live under the parent job card, with child amounts summing to the total.

You mentioned two options in the meeting:
- Add "Updates" section with a refresh button to scan SF for new child opportunities
- OR auto-trigger when new child created with same reference ID

Let's design this together before the next client session.

### Medium Priority

**5. POC Contacts from Salesforce**
Pull the contact roles from each opportunity. Wayne wants a dropdown in work order creation so he doesn't manually type POC info every time.

**6. Materials/Equipment List from Salesforce**
Good news: Chris confirmed Jeff uses dropdown fields in Salesforce for equipment lists (not Excel attachments). These can be pulled into the Materials Builder.

**7. Sitemap Link at Job Level**
Add a field at the job card level for a Google Maps link. When Wayne creates work orders, it auto-populates from the job. Saves him from entering it 20+ times per job.

**8. Pending Work Order Status**
Wayne creates work orders 2-3 weeks ahead but doesn't want crews to see them yet. Add a "Pending" status that:
- Shows on the work order calendar
- But is hidden from crew portal
- Only visible to crew when changed to "Ready for Field Execution"

### Recording & Transcript
Full transcript is being pushed to GitHub. Recording link: https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW

Let me know if you have questions. Priority is getting your SF access restored first.

Nova (On behalf of Fiona)

---

## EMAIL 2: To Marky (mark@aivate.net)

**Subject:** TPS CRM - Frontend Updates from Wayne Walkthrough (Feb 11)

---

Hi Marky,

Yesterday's meeting with Wayne went well. He's the Project Manager who'll be using work orders and scheduling daily, so he gave us great feedback on what's needed. Here's your list:

### High Priority

**1. Revamp Billing Schedule View**
This is the big one. Wayne shared his screen showing how he currently schedules in Salesforce - it's a list/report format where he can see all work for a day/week/month at a glance.

Our current calendar view doesn't give him that visibility. He said:
> "By that view, I can't tell if I've got five jobs, if I've got 20 jobs, and what those jobs are."

He needs to see a consolidated scheduling view similar to what he showed us. Check the recording at [1:55:25](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=6925.9999) to see his current Salesforce view.

**2. Daily/Weekly Materials Report**
For Mark (Shop Manager). Right now he'd have to open every job card individually to see what materials are needed.

Need a consolidated report showing:
- All materials needed across ALL jobs
- Filterable by date range (today, this week, this month)
- Which job each material is for
- Need-by dates
- Order status

Chris said Mark would "go crazy" without this. See [58:34](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=3514.9999) in recording.

**3. Crew Portal Missing Fields**
When crew views a work order, they can't see:
- Customer name (e.g., "ABC Construction")
- Job name
- POC name (only phone number shows)

Wayne: "They need to know who they're working for, who the account holder is, what the job name is."

Add these to the crew portal work order view. See [2:08:58](https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW?timestamp=7738.9999).

### Medium Priority

**4. POC Dropdown in Work Order Creation**
Instead of manually typing POC info, Wayne wants a dropdown of contacts (Cob will pull these from Salesforce). Also ability to add new contacts.

**5. Sitemap Link at Job Card Level**
Add a field at the job level for the Google Maps link. When work orders are created, it auto-populates from there. Saves Wayne from entering it every time.

**6. Pending Work Order Status**
New status option for work orders. Wayne creates WOs 2-3 weeks ahead but doesn't want crews to see them yet.
- "Pending" = shows on calendar but hidden from crew portal
- "Ready for Field Execution" = visible to assigned crew

### Scope Confirmation
Chris confirmed all these items are within current scope - no additional proposals needed.

### Recording & Transcript
Full transcript going to GitHub. Recording: https://fathom.video/share/EwhF_h461Xz1xfx5fbyxA8x3xBbDB4SW

The billing schedule revamp and materials report are the priorities for Wayne's workflow. Let me know if you need any clarification.

Nova (On behalf of Fiona)

---

## EMAIL 3: High-Level Meeting Summary (Optional - for both devs or Chris)

**Subject:** TPS CRM Walkthrough with Wayne - Summary (Feb 11)

---

Hi team,

Quick summary of yesterday's 2+ hour CRM walkthrough with Wayne McCoy, Chris's Project Manager:

### What Happened
- First time Wayne saw the CRM in depth
- Walked through dashboard, job cards, work orders, crew portal
- Wayne identified gaps based on his daily workflow
- Very positive reception overall

### Wayne's Reaction
> "This is absolutely amazing because it gives more information than we've ever been able to acquire."

He was particularly impressed with the Schedule of Values visibility - being able to see what's been paid and what's outstanding in real time.

### Key Items Identified

**Backend (Cob):**
- Salesforce access needs restoration (blocker)
- Add permit/utility tracking fields
- Design change order section under parent job
- Pull POC contacts + materials list from SF

**Frontend (Marky):**
- Revamp billing schedule to match Wayne's workflow
- Build materials-needed report for shop manager
- Add customer/job/POC info to crew portal view
- Add "Pending" status for advance scheduling

### What We Need from TPS
1. Wayne sending screenshot of permit fields from Salesforce
2. 15-20 min session with Chris to restore Cob's SF access

### Pilot Status
Still on track for end of February. These updates should be completed before pilot testing begins.

Full transcript and action items pushed to GitHub for project tracking.

Nova (On behalf of Fiona)

---

**Draft Created:** 2026-02-12
**Review Status:** Awaiting Fiona's approval to send
