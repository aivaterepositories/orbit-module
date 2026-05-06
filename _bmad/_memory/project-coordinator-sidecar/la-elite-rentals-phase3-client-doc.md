# LA Elite Rentals — Phase 3: Retention

**Prepared for:** Kel King
**Prepared by:** Fiona (Aivate)
**Updated:** May 7, 2026

---

## What Phase 3 Is About

Phases 1 and 2 focused on getting leads in the door and converting them into renters. Phase 3 is about **keeping the renters you already have** — making sure they pay on time, feel taken care of, renew their rentals, and send you more business through referrals.

These are the automations that protect your revenue and grow your fleet through word-of-mouth — without Dos having to manually chase payments, check in on renters, or remember to ask for referrals.

**Workflows in this phase:**

| # | Workflow | What It Does |
|---|----------|--------------|
| 9 | Late Payment Escalation | Automated follow-up when payment is overdue (picks up where WF3 leaves off) |
| 10 | Weekly Renter Check-In | Recurring check-in with active renters to catch issues early |
| 11 | Referral Request | Asks happy renters for referrals after 30 days |
| 12 | Renewal/Extension Reminder | Reminds renters 3 days before their rental period ends |

---

### WORKFLOW 9: Late Payment Escalation Sequence

This picks up where Workflow 3 (Payment Due Reminders) ends. If a renter misses their payment after the three-stage reminder sequence, this escalation kicks in. The tone shifts from friendly reminders to firm, action-oriented messages. After 24 hours overdue, they get a direct payment request. After 48 hours, they're told vehicle recovery may begin. Dos gets tasks at each stage so nothing falls through the cracks, and the team has a documented trail if things need to go further.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact has tag `Payment Overdue` (applied by WF3 when Stage 3 overdue message sends) + 24 hours elapsed |
| **Condition** | Contact is in `Became Renter` stage AND does NOT have `Payment Received` tag |
| **Stage 1 (24hr overdue)** | Send SMS → Add tag `Payment Escalation - 24hr` → Create task for Dos |
| **Stage 2 (48hr overdue)** | If still no `Payment Received` tag → Send SMS → Add tag `Payment Escalated` → Create URGENT task for Dos |
| **If they pay at any point** | Exit sequence → Dos confirms and tags `Payment Received` |

**Recommended SMS Copy**

**Stage 1 — 24 Hours Overdue:**
> Hi [First Name], your weekly payment is now 24 hours past due.
>
> Please send payment immediately:
> - Zelle: infolaeliterentals@gmail.com
> - Cash App: $rentals1000
>
> If there's an issue, contact us right away at 310-943-6795 so we can work something out.
>
> Thank you.

**Stage 2 — 48 Hours Overdue:**
> Hi [First Name], your payment is now 48 hours overdue.
>
> If we do not receive payment or hear from you today, we will need to proceed with vehicle recovery.
>
> Please contact us immediately at 310-943-6795.

**Response Handling**

| Renter Action | What Happens |
|---------------|--------------|
| Sends payment (any stage) | Dos confirms → tags `Payment Received` → sequence exits |
| Replies to discuss | Dos gets a task to negotiate (extension, partial payment, return date) |
| No response after 48hr | Dos gets URGENT task — "48hr overdue, no response. Initiate vehicle recovery process for [First Name]" |

---

### WORKFLOW 10: Weekly Renter Check-In

Once someone becomes a renter, they get a short, friendly check-in text every week. This isn't a payment reminder — it's a relationship builder. It keeps communication open so if there's a vehicle issue, a concern, or anything brewing, you hear about it early instead of getting blindsided. It also makes renters feel valued, which keeps them longer and makes them more likely to refer friends.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact is in `Became Renter` stage + 7 days since last check-in (or since becoming a renter) |
| **Condition** | Contact is still in `Became Renter` stage (not moved to Denied, Returned, etc.) |
| **Action** | Send SMS → Add tag `Check-In Sent` → Repeat every 7 days |
| **If they report an issue** | Dos gets a task to respond and resolve |
| **Exit** | Contact leaves `Became Renter` stage (returned vehicle, denied, etc.) |

**Recommended SMS Copy**

The message rotates weekly so it doesn't feel robotic. GHL can rotate through these templates:

**Week 1 (and every 4th week):**
> Hi [First Name], just checking in from LA Elite Rentals. How's everything going with the vehicle? Any issues or questions?
>
> Reply anytime — we're here to help!

**Week 2 (and every 5th week):**
> Hi [First Name], hope the week is going well! Just a quick check-in from LA Elite Rentals.
>
> Everything good with the car? Let us know if you need anything.

**Week 3 (and every 6th week):**
> Hi [First Name], LA Elite Rentals checking in. How are things on the road?
>
> If anything comes up with the vehicle, don't hesitate to reach out: 310-943-6795.

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| "All good" / positive | No action needed — relationship maintained |
| Reports an issue (vehicle, payment, etc.) | Dos gets a task — "Renter reported issue: [First Name]. Follow up and resolve." |
| No reply | No action — check-in continues next week |

---

### WORKFLOW 11: Referral Request (30-Day Mark)

After 30 days of renting, a renter has had enough experience to know whether they're happy with the service. This is the perfect time to ask for a referral. The message is warm and appreciative — not pushy. Rideshare and delivery drivers talk to each other constantly (at gas stations, waiting lots, group chats), so one happy renter can bring in 2-3 more. This automates what would otherwise require Dos to remember who's been renting for a month and manually reach out.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact is in `Became Renter` stage + 30 days elapsed since entering that stage |
| **Condition** | Contact does NOT already have `Referral Request Sent` tag |
| **Action** | Send SMS → Add tag `Referral Request Sent` |
| **One-time** | This message sends once per renter (not recurring) |

**Recommended SMS Copy**

> Hi [First Name], you've been with LA Elite Rentals for a month now — thank you for being a great renter!
>
> Know any other drivers who need a reliable car for Uber, Lyft, or delivery? Send them our way and we'll take good care of them.
>
> They can reach us at 310-943-6795 or fill out the intake form:
> https://laeliterentals2.hqrentals.asia/form/driver-intake-form
>
> We appreciate your support!

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| Refers someone (shares a name/number) | Dos gets a task — "Referral from [First Name]: [referred person's info]. Reach out within 24hrs." |
| "Sure, I'll share it" | No action needed — intake form link is in the message |
| No reply | No action — message was sent, no follow-up needed |

---

### WORKFLOW 12: Renewal/Extension Reminder

Three days before a renter's current rental period ends, they get a reminder asking whether they want to continue. This gives the team enough lead time to either process an extension or coordinate a vehicle return — instead of finding out the day-of that someone is dropping off a car. It also captures renters who might forget their end date and accidentally lapse, which can cause confusion around payments and scheduling.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact's rental end date is 3 days from now |
| **Condition** | Contact is in `Became Renter` stage |
| **Day 1 (3 days before)** | Send SMS → Add tag `Renewal Reminder Sent` → Create task for Dos |
| **Day 2 (1 day before)** | If no response → Send follow-up SMS → Create URGENT task for Dos |
| **Response routing** | Based on renter's reply, Dos gets a specific task |

**Recommended SMS Copy**

**3 Days Before End Date:**
> Hi [First Name], your current rental period with LA Elite Rentals ends in 3 days.
>
> Would you like to continue renting? Let us know:
> - Reply YES to extend your rental
> - Reply NO if you're planning to return the vehicle
> - Reply UNSURE if you'd like to discuss options
>
> We'd love to keep you on the road!

**1 Day Before End Date (if no response):**
> Hi [First Name], just a reminder — your rental period ends tomorrow.
>
> Please let us know if you're extending or returning the vehicle so we can plan accordingly.
>
> Reply here or call us: 310-943-6795. Thank you!

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| **YES** (extending) | Dos gets a task — "Process rental extension for [First Name]" |
| **NO** (returning) | Dos gets a task — "Coordinate vehicle return for [First Name] — rental ends [date]" |
| **UNSURE** | Dos gets a task — "Follow up with [First Name] — undecided on renewal. Discuss options." |
| No response (1 day before) | Follow-up SMS sends → Dos gets URGENT task — "No response on renewal. Contact [First Name] immediately." |

---

## Phase 3 Sprint Plan

| # | Workflow | Key Deliverables | Owner | Status |
|---|----------|-----------------|-------|--------|
| 9 | **Late Payment Escalation** | 2-stage escalation SMS for overdue payments, vehicle recovery trigger, URGENT VA tasks | Marky | Not Started |
| 10 | **Weekly Renter Check-In** | Rotating weekly SMS check-in for active renters, issue-response task creation | Marky | Not Started |
| 11 | **Referral Request (30-Day)** | One-time referral request at 30 days, intake form link included, referral task routing | Marky | Not Started |
| 12 | **Renewal/Extension Reminder** | 2-stage renewal reminder (3 days + 1 day before end), response-based task routing | Marky | Not Started |

## Phase 3 Pre-Build Checklist

- [ ] Confirm WF3 (Payment Due Reminders) is fully live and `Payment Overdue` tag is being applied correctly (WF9 depends on this)
- [ ] Confirm/create tags: `Payment Escalation - 24hr`, `Payment Escalated`, `Payment Received`, `Check-In Sent`, `Referral Request Sent`, `Renewal Reminder Sent`
- [ ] Confirm `Became Renter` stage triggers are available in GHL workflows
- [ ] Confirm custom field `Rental End Date` exists in GHL (or determine source — HQ Rental?)
- [ ] Determine how `Payment Received` tag gets applied — manual by Dos, or automated via payment confirmation?
- [ ] Confirm vehicle recovery process — what happens after 48hr escalation? Does Kel want a specific next step automated, or is it manual from there?
- [ ] Review WF3 → WF9 handoff: Payment Due Reminders exits into Late Payment Escalation seamlessly
- [ ] Review WF10 frequency — weekly check-ins: Kel comfortable with this cadence, or prefer bi-weekly?
- [ ] Marky to confirm GHL can track "days since entering stage" for WF10 and WF11 triggers

## What We Need From Kel for Phase 3

1. **Vehicle recovery process** — After the 48-hour overdue escalation, what's the next step? Do you want a specific message sent, or does the team take over manually from there? (This helps us decide whether to extend WF9 to a 72hr+ stage.)
2. **Rental end date tracking** — Where is the rental end date currently tracked? GHL custom field, HQ Rental, or the Google Sheet? We need to know so WF12 triggers correctly.
3. **Check-in frequency** — Are you comfortable with weekly check-in texts to renters, or would you prefer every two weeks? (We can adjust WF10.)
4. **Referral incentive** — Do you want to offer any incentive for referrals (e.g., "$50 off your next week for every driver you refer")? If so, we'll update the WF11 copy. If not, the current message works great as-is.
5. **Payment confirmation process** — When a renter sends payment, how does the team currently mark it as received? Manual tag in GHL? HQ Rental update? This affects how WF9 knows to stop escalating.
