# LA Elite Rentals — GHL Build Scope for Marky

**Client:** LA Elite Rentals (Kel King)
**Lead Engineer:** Marky
**Support:** Jacob
**PM:** Fiona
**Created:** 2026-02-07

---

## Overview

This document contains the technical specifications for building GHL automations for LA Elite Rentals. Workflows are organized by phase and priority. Each workflow includes trigger, actions, and copy to use.

**Total Workflows:** 20 (across 4 phases)
**Pipeline Used:** Rideshare (primary), Black SUV (secondary)

---

## Pre-Build Checklist

Before starting, confirm the following in Kel's GHL account:

- [ ] Access granted (admin level)
- [ ] Review existing workflows (note what's already built)
- [ ] Confirm pipeline stages match (CONFIRMED Feb 26 — Rideshare pipeline):
  - New Lead
  - Waiting for Paperwork
  - Priority Nurturing Leads (warm leads — ready to convert soon)
  - Nurturing Lead (still trying to convert)
  - Waitlist
  - Denied Not Interested
  - Became Renter
  - Low Income
- [ ] Confirm custom fields exist (or create):
  - `Pickup Date`
  - `Payment Due Date`
  - `Vehicle Type`
  - `Denial Reason`
  - `Security Deposit Received` (yes/no)
- [ ] Confirm tags are set up (or create):
  - `Waitlist - Economy`
  - `Waitlist - SUV`
  - `Intake Sent`
  - `Docs Received`
  - `Payment Reminder Sent`
  - `Overheating Reported`

---

## PHASE 1: Quick Wins

### Workflow 1.1: Speed-to-Lead Auto-Response

**Priority:** HIGH
**Status:** APPROVED by Kel (Feb 26) — qualifying questions, tag, and 2hr window all confirmed
**Trigger:** Contact Created (source = Facebook Lead OR Web Form)
> **Note:** Web forms are NOT yet integrated with GHL. Currently received via email and manually added. Webhook integration deferred to Phase 4.

**Actions:**
1. Wait 1 minute
2. Send SMS (from +1 516-670-1787):
```
Hi {{contact.first_name}}! This is LA Elite Rentals. Thanks for reaching out.

Quick question: Are you currently driving for Uber, Lyft, or delivery apps? And are you located in the LA area?

Reply and we'll get you set up fast.

Ready to get started? Fill out our intake form: https://laeliterentals2.hqrentals.asia/form/driver-intake-form
```
3. Add Tag: `Speed-to-Lead Sent`
4. Create Task: "Follow up if no response in 2hrs" → assign to Dos

**Exit Conditions:**
- Contact replies (handled by Dos)
- Contact already has tag `Speed-to-Lead Sent`

---

### Workflow 1.2: Missed Call Text-Back

**Priority:** HIGH
**Status:** APPROVED by Kel (Feb 26) — tag and 2hr window confirmed. Needs business/after-hours split.
**Trigger:** Call Status = Missed on EITHER:
- GHL number: **+1 516-670-1787**
- RingCentral number: **310-943-6795**

> Both numbers must trigger this automation. Renters and leads call both.

**Actions — BUSINESS HOURS (8:00 AM – 4:00 PM PT)**

1. Wait 2 minutes
2. Send SMS (from +1 516-670-1787):
```
Hi {{contact.first_name}}, sorry we missed your call! This is LA Elite Rentals.

Are you looking to rent a car for rideshare or delivery? Reply here and we'll get back to you right away.

Ready to get started? Fill out our intake form: https://laeliterentals2.hqrentals.asia/form/driver-intake-form
```
3. Add Tag: `Missed Call - Texted`
4. Create Task: "Missed call follow-up — respond within 2 hours" → assign to Dos

**Actions — AFTER HOURS (before 8:00 AM / after 4:00 PM PT)**

1. Wait 2 minutes
2. Send SMS (from +1 516-670-1787):
```
Hi {{contact.first_name}}, sorry we missed your call! This is LA Elite Rentals.

We're currently closed but will get back to you first thing tomorrow. In the meantime, feel free to fill out our intake form so we can get you started faster:

https://laeliterentals2.hqrentals.asia/form/driver-intake-form

Are you looking to rent a car for rideshare or delivery? Reply here and we'll follow up in the morning!
```
3. Add Tag: `Missed Call - Texted`
4. Create Task: "Missed call follow-up (after hours) — follow up first hour of next shift" → assign to Dos

---

### Workflow 1.3: Payment Due Reminder Sequence

**Priority:** HIGH
**Status:** APPROVED by Kel (Feb 26) — major rework on trigger, timing, and SMS copy
**Trigger:** ~~Custom Field `Payment Due Date` = Today - 1 day~~ **CHANGED**
> **No custom field for payment due date in GHL.** Data lives in **HQ Rental** → Dashboard → select "Time To Tomorrow" to pull records for renters scheduled to return units tomorrow.
> **Integration needed:** Manual process for now. Webhook/API from HQ Rental to GHL deferred to Phase 4.

**Actions:**

**Stage 1 — Day Before (2:00 PM PT):** *(changed from 10am)*
1. Send SMS at **2:00 PM** (from +1 516-670-1787):
```
Hi {{contact.first_name}}, this is LA Elite Rentals. Your weekly payment is due tomorrow by 12:00 PM.

Are you planning to extend your rental? Let us know:
- Reply YES if you're extending
- Reply NO if you're returning the vehicle
- Reply UNSURE if you'd like to discuss options

Payment methods:
- Zelle: infolaeliterentals@gmail.com
- Cash App: $rentals1000

Please send a screenshot once paid. Thank you!
```

**Conditional VA Tasks (based on renter response to Stage 1):**

| Response | VA Task for Dos |
|----------|----------------|
| **YES (extending)** | "Renter extending — process rental extension for {{contact.first_name}}" |
| **NO (returning)** | "Renter returning vehicle — coordinate return for {{contact.first_name}}" |
| **UNSURE** | "Renter undecided — follow up to clarify extension or return for {{contact.first_name}}" |
| **No response** | Proceed to Stage 2 |

**Stage 2 — Due Date (8:00 AM PT):** *(changed from 10am)*
2. Wait until **8:00 AM** next day
3. Send SMS:
```
Hi {{contact.first_name}}, your weekly payment is due today by 12:00 PM.

Zelle: infolaeliterentals@gmail.com
Cash App: $rentals1000

Please send confirmation once paid. Thank you!
```

**Stage 3 — Overdue (12:30 PM PT):** *(unchanged)*
4. Wait until 12:30 PM
5. If no `Payment Received` tag → Send SMS:
```
Hi {{contact.first_name}}, your payment was due at 12:00 PM today. Please send payment immediately or contact us to discuss vehicle return.

Thank you.
```
6. Create Task: "Payment overdue - escalate" → assign to Dos

> **IMPORTANT:** Payment amount removed from all SMS — varies per vehicle/unit. Payment methods updated: NO cash, added Cash App ($rentals1000).

---

### Workflow 1.4: Post-Pickup Welcome Kit

**Priority:** HIGH
**Status:** APPROVED by Kel (Feb 26) — expanded SMS content with tickets, insurance, maintenance info
**Trigger:** Opportunity Stage Changed to `Became Renter`
> **Note:** May need HQ Rental webhook integration for trigger — circle back Phase 4.

**Actions:**
1. Wait 30 minutes (allows onsite handoff to complete)
2. Send SMS (Message 1 — Welcome & Payment) from +1 516-670-1787:
```
Hi {{contact.first_name}},

Welcome to LA Elite Rentals! Here are the key terms for your rental:

PAYMENT:
- Zelle: infolaeliterentals@gmail.com
- Cash App: $rentals1000

SECURITY DEPOSIT: Refunded 24-48 hours after vehicle return (minus any incidentals).

Questions? Call or text us: 310-943-6795

Thank you for choosing LA Elite!
```
3. Wait 5 minutes
4. Send SMS (Message 2 — Accidents, Tickets & Insurance):
```
IMPORTANT — ACCIDENTS & INSURANCE:
If you are in an accident, DO NOT contact the insurance company. Contact LA Elite Rentals FIRST at 310-943-6795. We will handle everything from there.

TICKETS & TOLLS:
You are responsible for all parking tickets, traffic citations, red light violations, and toll charges while renting. Any fines will be charged to your account. If you receive a ticket, notify us immediately.
```
5. Wait 5 minutes
6. Send SMS (Message 3 — Maintenance):
```
MAINTENANCE:
All repairs must be approved by us first. Unauthorized repairs are your responsibility.

We conduct mandatory maintenance checks every 30-45 days. When it's time, we'll coordinate with you to bring the vehicle to our service partner:

Santa Tire Depot
5150 Santa Monica Blvd, Los Angeles CA 90028
818-588-2440

If you notice any vehicle issues, contact us immediately — do NOT attempt repairs on your own.
```
7. Wait 5 minutes
8. Send SMS (Message 4 — Bluetooth Setup):
```
BLUETOOTH SETUP (2015 Ford Fusion):

1. Turn on car (ignition on)
2. Tap "Phone" on touchscreen
3. Tap "Add Device"
4. On your phone: Settings → Bluetooth → ON
5. Select "SYNC" from device list
6. Enter the PIN shown on screen
7. Allow permissions when prompted

For music: Tap Entertainment → Source → Bluetooth Audio

Let us know if you need help!
```
9. Add Tag: `Welcome Kit Sent`

---

### Workflow 1.5: Security Deposit Disclaimer

**Priority:** MEDIUM
**Trigger:** Custom Field `Security Deposit Received` = Yes

**Actions:**
1. Wait 5 minutes
2. Send SMS:
```
Hi {{contact.first_name}}! Your security deposit has been received and your vehicle is reserved for pickup on {{custom.pickup_date}}.

Please note: If the vehicle is not picked up on the scheduled date, the security deposit may be subject to forfeiture.

Let us know if you have any questions. Thank you!
```
3. Add Tag: `SD Disclaimer Sent`

---

## PHASE 2: Lead Nurturing

### Workflow 2.1: Intake Form Reminder (24hr)

**Priority:** HIGH
**Trigger:** Tag Added = `Intake Sent` + Wait 24 hours + Tag does NOT include `Docs Received`

**Actions:**
1. Send SMS:
```
Hi {{contact.first_name}}, just following up! We sent you the driver intake form yesterday.

Once you submit your documents (license, payout history), we can get you approved and on the road.

Need the link again? Just reply and we'll send it over.
```
2. Create Task: "Intake not submitted - follow up" → assign to Dos

---

### Workflow 2.2: 3-Day Urgency Sequence

**Priority:** HIGH
**Trigger:** Opportunity Stage = `Contacted` + No reply in 24 hours

**Actions:**

**Day 1 (24hr no reply):**
1. Send SMS:
```
Hi {{contact.first_name}}, checking in from LA Elite Rentals. Still interested in a rental car for rideshare/delivery?

We have vehicles available now. Let us know!
```

**Day 2 (48hr no reply):**
2. Wait 24 hours
3. If no reply → Send SMS:
```
Hi {{contact.first_name}}, just a heads up — vehicle availability changes fast.

If you're still interested, reply and we can hold one for you.
```

**Day 3 (72hr no reply):**
4. Wait 24 hours
5. If no reply → Send SMS:
```
Hi {{contact.first_name}}, this is our last check-in. We can only hold vehicles for a limited time.

If you're ready to book, reply now. Otherwise, we'll add you back to our waitlist for future availability.

Thank you!
```
6. If no reply after Day 3 → Move to `Nurturing Lead` stage

---

### Workflow 2.3: Nurturing Lead Weekly Drip

**Priority:** MEDIUM
**Trigger:** Opportunity Stage = `Nurturing Lead`

**Actions:**
1. Wait 7 days
2. Send SMS:
```
Hi {{contact.first_name}}, just checking in from LA Elite Rentals.

Vehicles are available now if you're ready to get on the road. Reply if interested!
```
3. Repeat every 7 days (max 4 times)
4. After 4 weeks with no response → Add Tag `Cold Lead`

---

### Workflow 2.4: Facebook Lead Warm-Up

**Priority:** MEDIUM
**Trigger:** Contact Created (source = Facebook)

**Actions:**
1. Wait 2 minutes
2. Send SMS:
```
Hi {{contact.first_name}}, this is LA Elite Rentals — I saw you just filled out our form on Facebook.

Quick question: Are you looking to rent long-term (4+ months), and are you currently driving for Uber, Lyft, or delivery apps?
```
3. Add Tag: `FB Lead - Warm Up Sent`

---

## PHASE 3: Retention & Payments

### Workflow 3.1: Late Payment Escalation

**Priority:** HIGH
**Trigger:** Tag Added = `Payment Overdue` + 24 hours elapsed

**Actions:**

**24hr Overdue:**
1. Send SMS:
```
Hi {{contact.first_name}}, your payment is now 24 hours overdue.

Please send payment immediately via Zelle (infolaeliterentals@gmail.com) or contact us to arrange vehicle return.

This is time-sensitive. Thank you.
```

**48hr Overdue:**
2. Wait 24 hours
3. If still no `Payment Received` tag → Send SMS:
```
Hi {{contact.first_name}}, your payment is now 48 hours overdue.

If we do not receive payment or hear from you today, we will need to proceed with vehicle recovery.

Please contact us immediately.
```
4. Create Task: "48hr overdue - escalate to DOS" → assign to Dos
5. Add Tag: `Payment Escalated`

---

### Workflow 3.2: Weekly Renter Check-In

**Priority:** LOW
**Trigger:** Opportunity Stage = `Became Renter` + 7 days elapsed (recurring)

**Actions:**
1. Send SMS:
```
Hi {{contact.first_name}}, just checking in from LA Elite Rentals.

How's everything going with the vehicle? Any issues or questions?

Reply anytime — we're here to help!
```
2. Repeat every 7 days while status = `Became Renter`

---

### Workflow 3.3: Referral Request (30-Day Mark)

**Priority:** LOW
**Trigger:** Opportunity Stage = `Became Renter` + 30 days elapsed

**Actions:**
1. Send SMS:
```
Hi {{contact.first_name}}! You've been with LA Elite Rentals for a month now — thank you for being a great renter!

Know any other drivers who need a reliable car for rideshare or delivery? Send them our way!

We appreciate your support.
```
2. Add Tag: `Referral Request Sent`

---

### Workflow 3.4: Renewal Reminder (3 Days Before)

**Priority:** MEDIUM
**Trigger:** Custom Field `Rental End Date` = Today + 3 days

**Actions:**
1. Send SMS:
```
Hi {{contact.first_name}}, your current rental period ends in 3 days.

Would you like to continue renting? Just reply to confirm and we'll keep you on the road.

Thank you!
```
2. Create Task: "Renewal follow-up" → assign to Dos

---

## PHASE 4: Internal Efficiency

### Workflow 4.1: Auto-Task on Stage Change

**Priority:** MEDIUM
**Trigger:** Opportunity Stage Changed to `Waiting for Paperwork`

**Actions:**
1. Create Task: "Follow up on intake form in 24hrs"
   - Due: Tomorrow
   - Assign to: VA
2. Add Note: "Intake form link sent. Awaiting docs."

---

### Workflow 4.2: Stale Lead Alert (48hr No Activity)

**Priority:** MEDIUM
**Trigger:** Opportunity Stage = `Contacted` OR `Waiting for Paperwork` + Last Activity > 48 hours

**Actions:**
1. Create Task: "Stale lead - re-engage or update stage"
   - Due: Today
   - Assign to: VA
2. Add Tag: `Stale - Needs Attention`

---

### Workflow 4.3: Denial Auto-Response

**Priority:** LOW
**Trigger:** Opportunity Stage Changed to `Denied`

**Actions:**
1. Check Custom Field `Denial Reason`
2. Send appropriate SMS based on reason:

**If Reason = "Low Earnings":**
```
Hi {{contact.first_name}}, thank you for your interest in LA Elite Rentals.

At this time, we're unable to proceed due to recent earnings not meeting our requirements. However, if you have another source of income (such as a 9-to-5 job), you may submit a recent pay stub for review.

Feel free to reach out once available. Thank you for understanding.
```

**If Reason = "Expired License":**
```
Hi {{contact.first_name}}, we're unable to move forward at the moment because your driver's license is expired.

Once it's renewed and valid, feel free to contact us again. Thank you.
```

**If Reason = "Too Far":**
```
Hi {{contact.first_name}}, thank you for reaching out. Unfortunately, we're unable to proceed as your location is outside our current service area.

We appreciate your interest.
```

**If Reason = "Under 25":**
```
Hi {{contact.first_name}}, at this time, we're unable to proceed as our rentals require drivers to be at least 25 years old.

Please feel free to reach out again once eligible. Thank you for understanding.
```

**If Reason = "Background Check":**
```
Hi {{contact.first_name}}, thank you for your interest. At this time, we're unable to proceed based on our background check requirements.

We appreciate your understanding.
```

**If Reason = "Outside LA":**
```
Hi {{contact.first_name}}, thank you for your interest. At this time, we're unable to proceed as we currently serve the Los Angeles area only.

Please feel free to reach out if your location changes. Thank you.
```

3. Add Tag: `Denial Message Sent`

---

### Workflow 4.4: Pickup Confirmation Sequence

**Priority:** HIGH
**Trigger:** Custom Field `Pickup Date` is set + Pickup Date = Tomorrow

**Actions:**

**Day Before:**
1. Send SMS at 10:00 AM:
```
Hi {{contact.first_name}}, just confirming your vehicle pickup tomorrow!

LOCATION: 6102 W Sunset Blvd, Los Angeles, CA 90028
TIME: {{custom.pickup_time}}

Please bring your driver's license. See you there!
```

**Day Of (30 min before):**
2. On Pickup Date, send SMS 30 minutes before pickup time:
```
Hi {{contact.first_name}}, we're expecting you in about 30 minutes at 6102 W Sunset Blvd.

On your way? Reply with your ETA!
```

---

## PHASE 4 ADDITIONS (Added Feb 24)

### Workflow 4.5: Bouncie Maintenance Alert Automation

**Priority:** MEDIUM
**Trigger:** Bouncie Webhook (vehicle alert received)
**Status:** Scope broadly — refine after auditing Kel's Bouncie dashboard

**Expected Alert Types (verify in Bouncie):**
- Check engine light
- Overheating / coolant alert
- Hard braking / rapid acceleration
- Mileage threshold reached
- Battery voltage low
- DTC (Diagnostic Trouble Code) triggered

**Actions:**
1. Receive Bouncie webhook → match vehicle to renter via custom field or tag
2. Create Task in GHL: "Vehicle Alert — [Alert Type] — [Vehicle Name]" → assign to Dos
3. Send SMS to renter (if applicable):
```
Hi {{contact.first_name}}, we received an alert from your vehicle.

Please do NOT attempt any repairs on your own. Contact us immediately so we can assess the situation.

Reply here or call us. Thank you.
```
4. Add Tag: `Maintenance Alert - [Type]`
5. Add Note with alert details

**Pre-Build:** Marky to audit Bouncie dashboard and confirm available webhook events + payload structure. Document findings before building.

---

### Workflow 4.6: Registration Renewal Notification

**Priority:** MEDIUM
**Trigger:** Custom Field `Registration Expiry Date` = Today + 30 days (and again at 14 days, 7 days)
**Data Source:** [LA Elite Rentals 2.0 Google Sheet](https://docs.google.com/spreadsheets/d/19YtXpZoymtNFaxKLucoz5TUWh-vaTu5dHHcAm59WUSs/edit?usp=sharing)

**Actions:**

**30 Days Before Expiry:**
1. Create Task: "Vehicle registration expiring in 30 days — [Vehicle Name]" → assign to Dos
2. Add Tag: `Registration - 30 Day Warning`

**14 Days Before Expiry:**
3. Create Task: "Vehicle registration expiring in 14 days — [Vehicle Name]" → assign to Dos (HIGH priority)

**7 Days Before Expiry:**
4. Create Task: "URGENT: Vehicle registration expires in 7 days — [Vehicle Name]" → assign to Dos (URGENT)
5. Add Tag: `Registration - Critical`

**Pre-Build:** Need to determine how registration dates get into GHL — manual entry, Google Sheets sync, or import. Check Google Sheet structure for field mapping.

---

### Workflow 4.7: Off-Grid / Border Alert

**Priority:** MEDIUM
**Trigger:** Bouncie Geofence Webhook (vehicle exits defined boundary)

**Actions:**
1. Create Task: "ALERT: Vehicle left service area — [Vehicle Name]" → assign to Dos (URGENT)
2. Send internal notification (SMS or email to Kel)
3. Add Tag: `Off-Grid Alert`
4. Add Note with location data from Bouncie

**Pre-Build:** Kel needs to set up geofence boundaries in Bouncie for LA service area. Marky to confirm webhook payload includes location data.

---

## FUTURE INTEGRATIONS (Phase 5+)

These require additional setup or third-party tools:

| Integration | Description | Complexity |
|-------------|-------------|------------|
| **RingCentral Integration** | Missed calls auto-trigger workflows | Medium |
| **Telegram Notifications** | High-priority events push to team chat | Low |
| **HQ Rentals Sync** | Vehicle availability updates tags | High |

---

## Build Order (Recommended)

| Order | Workflow | Phase | Priority |
|-------|----------|-------|----------|
| 1 | Speed-to-Lead Auto-Response | 1 | HIGH |
| 2 | Payment Due Reminder Sequence | 1 | HIGH |
| 3 | Post-Pickup Welcome Kit | 1 | HIGH |
| 4 | Missed Call Text-Back | 1 | HIGH |
| 5 | 3-Day Urgency Sequence | 2 | HIGH |
| 6 | Intake Form Reminder | 2 | HIGH |
| 7 | Late Payment Escalation | 3 | HIGH |
| 8 | Pickup Confirmation Sequence | 4 | HIGH |
| 9 | Security Deposit Disclaimer | 1 | MEDIUM |
| 10 | Nurturing Lead Weekly Drip | 2 | MEDIUM |
| 11 | Facebook Lead Warm-Up | 2 | MEDIUM |
| 12 | Renewal Reminder | 3 | MEDIUM |
| 13 | Auto-Task on Stage Change | 4 | MEDIUM |
| 14 | Stale Lead Alert | 4 | MEDIUM |
| 15 | Weekly Renter Check-In | 3 | LOW |
| 16 | Referral Request | 3 | LOW |
| 17 | Denial Auto-Response | 4 | LOW |
| 18 | Bouncie Maintenance Alerts | 4 | MEDIUM |
| 19 | Registration Renewal Notification | 4 | MEDIUM |
| 20 | Off-Grid / Border Alert | 4 | MEDIUM |

---

## Testing Checklist

For each workflow, verify:

- [ ] Trigger fires correctly
- [ ] Wait times are accurate
- [ ] SMS sends with correct merge fields
- [ ] Tags are added properly
- [ ] Tasks are created with correct assignee and due date
- [ ] Exit conditions prevent duplicate sends

---

## Key Reference Info (Updated Feb 26)

| Item | Value |
|------|-------|
| **GHL Sender Number** | +1 516-670-1787 |
| **RingCentral Number** | 310-943-6795 |
| **Intake Form** | https://laeliterentals2.hqrentals.asia/form/driver-intake-form |
| **Cash App** | $rentals1000 |
| **Zelle** | infolaeliterentals@gmail.com |
| **Task Assignee** | Dos (all follow-up tasks) |
| **Santa Tire Depot** | 5150 Santa Monica Blvd, LA CA 90028 — 818-588-2440 |
| **King Berk Auto Center** | 6044 Santa Monica Blvd, LA CA 90028 — 323-460-4989 |
| **Business Hours** | 8:00 AM – 4:00 PM PT |

### Reference Documents
- `la-elite-rentals-tickets-violations-process.md` — Full tickets & violations SOP (for WF4 SMS content)
- `la-elite-rentals-fleet-maintenance-process.md` — Full fleet maintenance SOP (includes mechanic contacts, routing rules)

### Existing GHL Workflows to Audit
| Workflow | Action |
|----------|--------|
| Save Caller Info | KEEP — do not modify |
| JV Leads | KEEP — do not modify |
| New Workflow | AUDIT — check for conflicts with our builds |
| Rental Waitlist Workflow | AUDIT — check for conflicts |
| Uber and Lyft Leads | AUDIT — check for conflicts |

---

## Notes for Marky

1. **Custom Fields:** Create these before building workflows. ~~Payment Due Date~~ is in HQ Rental (not GHL). Pickup Date is critical for scheduling triggers.

2. **Merge Fields:** Use `{{contact.first_name}}` and `{{custom.field_name}}` — test with real data.

3. **SMS Length:** Keep under 160 characters per segment when possible. Welcome Kit is now split into FOUR messages (welcome, tickets/insurance, maintenance, bluetooth).

4. **Time Zones:** Confirm GHL account is set to Pacific Time (LA).

5. **Existing Automations:** Audit the 3 flagged workflows before building. KEEP Save Caller Info and JV Leads untouched.

6. **Testing:** Use a test contact (your own number) before going live.

7. **HQ Rental Integration:** WF 1.3 (Payment) and WF 1.4 (Welcome Kit) may need HQ Rental data. For now, manual process. Webhook integration in Phase 4.

8. **Tags:** Starting fresh — Kel has minimal tags in GHL. Create tags as defined in each workflow.

---

**Document Created:** 2026-02-07
**Last Updated:** 2026-02-26
**Status:** Phase 1 In Progress — Build Week
**Project Coordinator:** Nova (ORBIT)
