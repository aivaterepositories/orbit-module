# LA Elite Rentals — Phase 3: Retention

**Prepared for:** Kel King
**Prepared by:** Fiona (Aivate)
**Updated:** May 14, 2026
**Last Call:** Phase 3 Coordination — May 14, 2026 ([Fathom Recording](https://fathom.video/share/eExhBzDkf5yCsZqiGJz3QxizbpXQMQqQ))

---

## Summary of Changes (May 14 Call)

| # | Item | Type | Priority | Details |
|---|------|------|----------|---------|
| 1 | WF12 Renewal/Extension Reminder removed | Workflow Change | -- | Removed entirely. Day-before payment reminder already covers this. Does not work for daily renters. |
| 2 | WF9 Late Payment Escalation redesigned | Workflow Change | CRITICAL | Replaced 2-stage (24hr/48hr) model. New: single SMS at 12 PM if overdue, pay by 3 PM or return vehicle, $15 late fee, then manual review. No mention of repo. |
| 3 | WF10 Check-in sequence updated | Workflow Change | HIGH | Added 24-hour first check-in for new renters. Then 3 weekly check-ins. Then monthly for long-term renters. |
| 4 | WF11 Referral bonus standardized | Workflow Change | MEDIUM | $50 referral bonus for every successful referral. Include in SMS copy. |
| 5 | Payment reminder timezone mismatch | BUG | CRITICAL | Day-before reminders firing a day early. Likely set to Philippine time instead of PST. Renters saying "I'm not due today, I'm due tomorrow." |
| 6 | New $222/daily payment program | SYSTEM | HIGH | New program: $222 upfront for 3 days, then $74/day. Runs alongside weekly program. Verify automations work for both payment structures. |
| 7 | Duplicate lead-intake SMS | BUG | HIGH | New leads getting 2-3 messages at once. Kel's old automation + Aivate automation both firing. Deactivate Kel's old two automations. Keep Aivate flow only. Three-day urgency sequence is fine. |

---

## What Phase 3 Is About

Phases 1 and 2 focused on getting leads in the door and converting them into renters. Phase 3 is about **keeping the renters you already have** — making sure they pay on time, feel taken care of, and send you more business through referrals.

These are the automations that protect your revenue and grow your fleet through word-of-mouth — without Dos having to manually chase payments, check in on renters, or remember to ask for referrals.

**Workflows in this phase (updated):**

| # | Workflow | What It Does | Priority |
|---|----------|--------------|----------|
| 9 | Late Payment Escalation | Single automated reminder at 12 PM when payment is overdue. $15 late fee applied. Pay by 3 PM or return vehicle. Then manual review. | CRITICAL |
| 10 | Renter Check-In Sequence | 24-hour first check-in, then 3 weekly check-ins, then monthly for long-term renters | HIGH |
| 11 | Referral Request | Asks happy renters for referrals after 30 days. $50 bonus for successful referrals. | MEDIUM |
| ~~12~~ | ~~Renewal/Extension Reminder~~ | ~~REMOVED — existing day-before payment reminder covers this~~ | -- |

---

### WORKFLOW 9: Late Payment Escalation

**Priority: CRITICAL**

This picks up where Workflow 3 (Payment Due Reminders) ends. If a renter's payment is still overdue by 12:00 PM, a single firm reminder is sent. The tone is direct but not threatening. After this message, it becomes a manual review by the team — no further automated escalation.

**Key rules from Kel (May 14):**
- Late payments are handled on a **case-by-case basis**
- **Never mention "repo"** or vehicle recovery in automated messages
- $15 late fee applies to **all renters** as standard policy
- Kel and team can **manually waive** the late fee when warranted
- Use **general language** ("late fees are applied") — do not state the exact amount in the SMS
- After the single automated reminder, **no more automated messages** — team takes over manually

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact has overdue payment in HQ Rental + it is 12:00 PM PST |
| **Condition** | Contact is in `Became Renter` stage AND payment is still unpaid |
| **Action** | Send single SMS → Add tag `Payment Escalated` → Create task for Dos |
| **After SMS** | Manual review — Dos and team decide next steps on a case-by-case basis |
| **If they pay at any point** | Dos confirms and tags `Payment Received` → no further action |

**Recommended SMS Copy**

> Hi [First Name], your payment is past due. Please submit payment by 3:00 PM today, or arrange to return the vehicle.
>
> Late fees are applied for overdue payments.
>
> Payment options:
> - Zelle: infolaeliterentals@gmail.com
> - Cash App: $rentals1000
>
> If there's an issue, contact us right away at 310-943-6795 so we can work something out.
>
> Thank you.

**Response Handling**

| Renter Action | What Happens |
|---------------|--------------|
| Sends payment | Dos confirms → tags `Payment Received` → no further action |
| Replies to discuss | Dos gets a task to handle (extension, partial payment, return date) |
| No response after 3 PM | Dos gets URGENT task — manual review and decision on next steps |

---

### WORKFLOW 10: Renter Check-In Sequence

**Priority: HIGH**

Once someone becomes a renter, they get a check-in at key intervals. This isn't a payment reminder — it's a relationship builder. It keeps communication open so if there's a vehicle issue, a concern, or anything brewing, you hear about it early instead of getting blindsided. It also makes renters feel valued, which keeps them longer and makes them more likely to refer friends.

**Key changes from Kel (May 14):**
- **First check-in at 24 hours** — Kel wants early contact because new renters sometimes have paperwork issues, upload problems, or small things that need sorting out right away. Waiting a full week is too long.
- **Then weekly for 3 weeks** — standard weekly cadence after the 24-hour check-in
- **Then monthly for long-term renters** — if they're still renting after the initial sequence, transition to monthly to maintain the relationship without over-messaging

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact enters `Became Renter` stage |
| **Check-In 1** | 24 hours after becoming a renter → Send SMS |
| **Check-In 2** | 7 days after Check-In 1 → Send SMS |
| **Check-In 3** | 7 days after Check-In 2 → Send SMS |
| **Check-In 4** | 7 days after Check-In 3 → Send SMS |
| **Monthly (ongoing)** | Every 30 days after Check-In 4 → Send SMS → continues until renter exits |
| **Exit** | Contact leaves `Became Renter` stage (returned vehicle, denied, etc.) |

**Recommended SMS Copy**

**24-Hour Check-In (new renter):**
> Hi [First Name], welcome to LA Elite Rentals! Just checking in — how's everything going with the vehicle? Any issues or questions so far?
>
> Reply anytime — we're here to help!

**Weekly Check-Ins (rotate):**

*Week 1:*
> Hi [First Name], just checking in from LA Elite Rentals. How's everything going with the vehicle? Any issues or questions?
>
> Reply anytime — we're here to help!

*Week 2:*
> Hi [First Name], hope the week is going well! Just a quick check-in from LA Elite Rentals.
>
> Everything good with the car? Let us know if you need anything.

*Week 3:*
> Hi [First Name], LA Elite Rentals checking in. How are things on the road?
>
> If anything comes up with the vehicle, don't hesitate to reach out: 310-943-6795.

**Monthly Check-In:**
> Hi [First Name], just a quick check-in from LA Elite Rentals. Hope everything is going well with the vehicle!
>
> If you ever need anything, we're always here: 310-943-6795.

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| "All good" / positive | No action needed — relationship maintained |
| Reports an issue (vehicle, payment, etc.) | Dos gets a task — "Renter reported issue: [First Name]. Follow up and resolve." |
| No reply | No action — check-in continues on schedule |

---

### WORKFLOW 11: Referral Request (30-Day Mark)

**Priority: MEDIUM**

After 30 days of renting, a renter has had enough experience to know whether they're happy with the service. This is the perfect time to ask for a referral. The message is warm and appreciative — not pushy. Rideshare and delivery drivers talk to each other constantly (at gas stations, waiting lots, group chats), so one happy renter can bring in 2-3 more. This automates what would otherwise require Dos to remember who's been renting for a month and manually reach out.

**Key update from Kel (May 14):**
- Referral bonus is now standardized at **$50 per successful referral**
- "Successful" means the referred person completes the intake form and becomes a renter
- Include the $50 incentive in the SMS to motivate referrals

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
> Know any other drivers who need a reliable car for Uber, Lyft, or delivery? Refer them to us and earn a **$50 bonus** for every successful referral!
>
> They can reach us at 310-943-6795 or fill out the intake form:
> https://laeliterentals2.hqrentals.asia/form/driver-intake-form
>
> We appreciate your support!

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| Refers someone (shares a name/number) | Dos gets a task — "Referral from [First Name]: [referred person's info]. Reach out within 24hrs. $50 referral bonus applies if successful." |
| "Sure, I'll share it" | No action needed — intake form link is in the message |
| No reply | No action — message was sent, no follow-up needed |

---

## Known Issues (From May 14 Call)

| # | Issue | Priority | Description | Action Required |
|---|-------|----------|-------------|-----------------|
| 1 | **Payment reminder timezone mismatch** | CRITICAL | Day-before payment reminders are firing a day early. Renters getting messages saying "due tomorrow" when it's actually due the day after. Likely caused by automation set to Philippine time instead of PST. Kel confirmed this has been noticed by renters. | Marky: Check timezone settings on all payment reminder triggers in GHL. Align to PST/LA time. Verify both daily and weekly triggers. |
| 2 | **Duplicate lead-intake SMS** | HIGH | When a new lead enters the system, they receive 2-3 messages at once. Kel's pre-existing automation and Aivate's automation are both firing on the same trigger. First two messages are from Kel's old flow (DOS intro + "are you a rideshare driver?" — redundant). Third message is the Aivate flow (natural-sounding, the one Kel wants to keep). | Marky: Deactivate Kel's two old lead-intake automations in GHL. Keep only the Aivate flow active. Three-day urgency follow-up sequence stays as-is. |
| 3 | **New $222/daily payment program** | HIGH | Kel introduced a new pricing program (live ~1-2 weeks): $222 upfront for 3 days, then $74/day after. Runs alongside the existing weekly payment program. Daily renters appear to be getting messages on time (DOS updates payment dates in HQ Rental), but this needs verification. | Marky: Verify that all payment-related automations (WF3 reminders, WF9 escalation) work correctly for BOTH daily and weekly payment renters. Confirm HQ Rental data feeds are accurate for both structures. |

---

## Phase 3 Sprint Plan

| # | Workflow | Priority | Key Deliverables | Owner | Status |
|---|----------|----------|-----------------|-------|--------|
| 9 | **Late Payment Escalation** | CRITICAL | Single SMS at 12 PM for overdue payments, $15 late fee language, pay-by-3-PM-or-return, manual review task for Dos | Marky | Not Started |
| 10 | **Renter Check-In Sequence** | HIGH | 24-hour first check-in, 3 weekly check-ins, then monthly ongoing, issue-response task creation | Marky | Not Started |
| 11 | **Referral Request (30-Day)** | MEDIUM | One-time referral request at 30 days, $50 bonus included in copy, intake form link, referral task routing | Marky | Not Started |

**Bug fixes (address before or alongside Phase 3 build):**

| # | Fix | Priority | Owner | Status |
|---|-----|----------|-------|--------|
| 1 | Payment reminder timezone — align to PST | CRITICAL | Marky | Not Started |
| 2 | Deactivate duplicate lead-intake automations | HIGH | Marky | Not Started |
| 3 | Verify automations for daily vs. weekly payment programs | HIGH | Marky | Not Started |

---

## Phase 3 Pre-Build Checklist

- [ ] **Fix timezone on payment reminders (CRITICAL)** — align all triggers to PST before building WF9
- [ ] **Deactivate Kel's old lead-intake automations (HIGH)** — keep only Aivate flow
- [ ] **Verify daily vs. weekly renter automations (HIGH)** — confirm HQ Rental data feeds work for both programs
- [ ] Confirm WF3 (Payment Due Reminders) is fully live and `Payment Overdue` tag is being applied correctly (WF9 depends on this)
- [ ] Confirm/create tags: `Payment Escalated`, `Payment Received`, `Check-In Sent`, `Referral Request Sent`
- [ ] Confirm `Became Renter` stage triggers are available in GHL workflows
- [ ] Determine how `Payment Received` tag gets applied — manual by Dos, or automated via payment confirmation?
- [ ] Review WF3 → WF9 handoff: Payment Due Reminders exits into Late Payment Escalation seamlessly
- [ ] Marky to confirm GHL can track "days/hours since entering stage" for WF10 and WF11 triggers

## What's Been Resolved (From Kel — May 14)

These items from the original doc have been answered and no longer need Kel's input:

| Question | Answer |
|----------|--------|
| Vehicle recovery process after escalation? | No automated vehicle recovery messaging. Manual review only. Never mention "repo." |
| Check-in frequency? | 24 hours first, then weekly x3, then monthly. |
| Referral incentive? | Yes — $50 per successful referral. Standardized. |
| Renewal/Extension Reminder workflow? | Removed. Not needed — existing reminders cover it. |

---

## Upcoming Meetings

| Date | Time (PST) | Meeting | Attendees |
|------|------------|---------|-----------|
| Friday, May 16 | 3:00 PM | SOP Ground Crew (Scale Virtually) | Kel, Don, DOS, Fiona |
| Wednesday, May 21 | Same as today | Phase 4 Automation Discussion | Kel, Fiona |
