# LA Elite Rentals — GHL Build Scope for Marky

**Client:** LA Elite Rentals (Kel King)
**Lead Engineer:** Marky
**Support:** Jacob
**PM:** Fiona
**Created:** 2026-02-07

---

## Overview

This document contains the technical specifications for building GHL automations for LA Elite Rentals. Workflows are organized by phase and priority. Each workflow includes trigger, actions, and copy to use.

**Total Workflows:** 16 (across 4 phases)
**Pipeline Used:** Rideshare (primary), Black SUV (secondary)

---

## Pre-Build Checklist

Before starting, confirm the following in Kel's GHL account:

- [ ] Access granted (admin level)
- [ ] Review existing workflows (note what's already built)
- [ ] Confirm pipeline stages match:
  - New Lead
  - Contacted
  - Waiting for Paperwork
  - Nurturing Lead
  - Denied
  - Became Renter
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
**Trigger:** Contact Created (source = Facebook Lead OR Web Form)

**Actions:**
1. Wait 1 minute
2. Send SMS:
```
Hi {{contact.first_name}}! This is LA Elite Rentals. Thanks for reaching out.

Quick question: Are you currently driving for Uber, Lyft, or delivery apps? And are you located in the LA area?

Reply and we'll get you set up fast.
```
3. Add Tag: `Speed-to-Lead Sent`
4. Create Task: "Follow up if no response in 2hrs" → assign to VA

**Exit Conditions:**
- Contact replies (handled by VA)
- Contact already has tag `Speed-to-Lead Sent`

---

### Workflow 1.2: Missed Call Text-Back

**Priority:** HIGH
**Trigger:** Call Status = Missed (or integrate with RingCentral webhook if available)

**Actions:**
1. Wait 2 minutes
2. Send SMS:
```
Hi {{contact.first_name}}, sorry we missed your call! This is LA Elite Rentals.

Are you looking to rent a car for rideshare or delivery? Reply here and we'll get back to you right away.
```
3. Add Tag: `Missed Call - Texted`
4. Create Task: "Missed call follow-up" → assign to VA

---

### Workflow 1.3: Payment Due Reminder Sequence

**Priority:** HIGH
**Trigger:** Custom Field `Payment Due Date` = Today - 1 day

**Actions:**

**Day Before (Trigger Day):**
1. Send SMS at 10:00 AM:
```
Hi {{contact.first_name}}, friendly reminder that your weekly payment of $420 is due tomorrow by 12:00 PM.

Payment methods: Zelle (infolaeliterentals@gmail.com) or Cash.

Please send a screenshot once completed. Thank you!
```

**Due Date (Next Day):**
2. Wait until 10:00 AM
3. Send SMS:
```
Hi {{contact.first_name}}, your weekly payment is due today by 12:00 PM.

Zelle: infolaeliterentals@gmail.com

Please send confirmation once paid. Thank you!
```

**Overdue (Same Day, 12:30 PM):**
4. Wait until 12:30 PM
5. If no `Payment Received` tag → Send SMS:
```
Hi {{contact.first_name}}, your payment was due at 12:00 PM today. Please send payment immediately or contact us to discuss vehicle return.

Thank you.
```
6. Create Task: "Payment overdue - escalate" → assign to VA

---

### Workflow 1.4: Post-Pickup Welcome Kit

**Priority:** HIGH
**Trigger:** Opportunity Stage Changed to `Became Renter`

**Actions:**
1. Wait 30 minutes (allows onsite handoff to complete)
2. Send SMS:
```
Hi {{contact.first_name}},

Welcome to LA Elite Rentals! Here are the key terms for your rental:

PAYMENT DUE: {{custom.payment_due_date}} by 12:00 PM
- Zelle: infolaeliterentals@gmail.com

SECURITY DEPOSIT: Refunded 24-48 hours after vehicle return (minus any incidentals).

MAINTENANCE: All repairs must be approved by us first. Unauthorized repairs are your responsibility.

Questions? Reply to this message anytime.

Thank you for choosing LA Elite!
```
3. Add Tag: `Welcome Kit Sent`
4. Wait 5 minutes
5. Send SMS (Bluetooth Setup - separate message to avoid length issues):
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
2. Create Task: "Intake not submitted - follow up" → assign to VA

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
4. Create Task: "48hr overdue - escalate to DOS" → assign to manager
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
2. Create Task: "Renewal follow-up" → assign to VA

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

## FUTURE INTEGRATIONS (Phase 5+)

These require additional setup or third-party tools:

| Integration | Description | Complexity |
|-------------|-------------|------------|
| **Bouncie Webhook** | Vehicle alerts trigger GHL tasks + renter texts | Medium |
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

## Notes for Marky

1. **Custom Fields:** Create these before building workflows. Payment Due Date and Pickup Date are critical for scheduling triggers.

2. **Merge Fields:** Use `{{contact.first_name}}` and `{{custom.field_name}}` — test with real data.

3. **SMS Length:** Keep under 160 characters per segment when possible. Welcome Kit is intentionally split into two messages.

4. **Time Zones:** Confirm GHL account is set to Pacific Time (LA).

5. **Existing Automations:** Audit what's already built before duplicating. Disable old workflows if replacing.

6. **Testing:** Use a test contact (your own number) before going live.

---

**Document Created:** 2026-02-07
**Status:** Ready for Build
**Project Coordinator:** Nova (ORBIT)
