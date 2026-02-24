# LA Elite Rentals — Phase 1 Call Prep
## Fiona's Presentation & Discovery Guide for Kel

**Meeting:** Tuesday, Feb 24 (Pacific Time)
**Attendees:** Fiona + Kel (+ anyone Kel invites)
**Purpose:** Present Phase 1 workflows, get Kel's approval on SMS copy, confirm specs so Marky can build
**Note:** Marky will NOT be on this call — he's on TempPower CRM updates

---

## Opening Script

> "Hey Kel, thanks for jumping on. Now that payment is in, we're officially kicking off your automation build this week. I want to walk you through the 4 workflows we're building first — these are your Quick Wins. For each one, I'll show you what it does, the text messages your renters will receive, and I need your sign-off on the wording and a few details so my engineer Marky can build these exactly the way you want them."

---

## BEFORE WE DIVE IN — General Setup Questions

Ask these first. The answers affect ALL workflows:

| # | Question | Why We Need It |
|---|----------|----------------|
| 1 | **Can you walk me through your current pipeline stages in GHL?** We have: New Lead → Contacted → Waiting for Paperwork → Nurturing Lead → Denied → Became Renter. Does that match what you have? | Triggers depend on correct stage names |
| 2 | **Do you have any existing automations/workflows running right now?** We want to make sure we don't duplicate or conflict with anything. | Avoid double-sending texts |
| 3 | **Who is the VA or team member that should receive follow-up tasks?** Is there a specific person, or should tasks go to a general queue? | Task assignment for all workflows |
| 4 | **What's the best phone number / sender ID your texts go out from in GHL?** | Make sure SMS comes from the right number |

---

## WORKFLOW 1: Speed-to-Lead Auto-Response

### What to Present to Kel

> "When a new lead comes in — whether from your Facebook ads or a web form — they'll instantly get a text within 1 minute. No more leads sitting there waiting. This is your fastest way to engage before they move on to another rental company."

### How It Works
- **Trigger:** New contact created (from Facebook Lead or Web Form)
- **Wait:** 1 minute (feels natural, not robotic)
- **Action:** Send SMS → Add tag → Create VA task

### Recommended SMS Copy (Present to Kel)

> *"Hi [First Name]! This is LA Elite Rentals. Thanks for reaching out.*
>
> *Quick question: Are you currently driving for Uber, Lyft, or delivery apps? And are you located in the LA area?*
>
> *Reply and we'll get you set up fast."*

### Questions to Ask Kel

| # | Question | Notes |
|---|----------|-------|
| 1 | **How do you feel about this wording? Anything you'd change?** | He might want a different tone or add his name |
| 2 | **Do you want the text to come from "LA Elite Rentals" or from a specific person's name (like "Kel from LA Elite")?** | Personal touch vs. business brand |
| 3 | **Are Facebook and web forms your only lead sources, or do leads also come in from other places?** (Google, referrals, walk-ins) | We may need additional triggers |
| 4 | **What qualifying questions matter most to you?** We have "driving for Uber/Lyft/delivery?" and "in the LA area?" — anything else you screen for upfront? (e.g., age 25+, valid license) | May want to add screening questions |
| 5 | **For the tag — we're proposing `Speed-to-Lead Sent`. Do you already have tags in GHL, or are we starting fresh?** | Check if he has existing tag conventions |
| 6 | **For the VA task — what should the task say? We have "Follow up if no response in 2hrs." Is 2 hours the right window, or do you want it shorter/longer?** | Task timing and wording |

---

## WORKFLOW 2: Missed Call Text-Back

### What to Present to Kel

> "Whenever someone calls and you or your team can't pick up, they'll automatically get a text within 2 minutes. This way you never lose a lead just because you missed a call — and it opens the conversation via text so they can reply when it's convenient."

### How It Works
- **Trigger:** Call status = Missed
- **Wait:** 2 minutes
- **Action:** Send SMS → Add tag → Create VA task

### Recommended SMS Copy (Present to Kel)

> *"Hi [First Name], sorry we missed your call! This is LA Elite Rentals.*
>
> *Are you looking to rent a car for rideshare or delivery? Reply here and we'll get back to you right away."*

### Questions to Ask Kel

| # | Question | Notes |
|---|----------|-------|
| 1 | **How do you feel about the wording? Want it more casual, more professional?** | Match his brand voice |
| 2 | **Do calls come through GHL's built-in phone, or do you use RingCentral or another system?** | If external phone system, we may need a webhook or integration — affects how the trigger works |
| 3 | **Should the missed call text go out for ALL missed calls, or only from unknown/new numbers?** | He might not want existing renters getting "are you looking to rent?" texts |
| 4 | **For the tag — we're proposing `Missed Call - Texted`. Does that work?** | Keep naming consistent |
| 5 | **For the VA task — what should the follow-up task say? "Missed call follow-up — call back within [X time]"? What's the window?** | Task detail and urgency |
| 6 | **Is there a time window? For example, should missed call texts only go out during business hours (say 8 AM–8 PM PT), or 24/7?** | Avoid texting at 2 AM |

---

## WORKFLOW 3: Payment Due Reminder Sequence

### What to Present to Kel

> "This is a 3-stage automatic reminder sequence. The day before payment is due, day of, and if they haven't paid by 12:30 PM, an overdue nudge goes out. You'll never have to manually chase weekly payments again — and if someone still hasn't paid, it creates a task so your team can escalate."

### How It Works
- **Trigger:** Custom field `Payment Due Date` = Tomorrow
- **Stage 1:** Day before — SMS at 10:00 AM
- **Stage 2:** Due date — SMS at 10:00 AM
- **Stage 3:** Overdue — SMS at 12:30 PM (same day) if no `Payment Received` tag
- **Action:** Creates escalation task if still unpaid

### Recommended SMS Copy (Present to Kel)

**Day Before (10 AM):**
> *"Hi [First Name], friendly reminder that your weekly payment of $420 is due tomorrow by 12:00 PM.*
>
> *Payment methods: Zelle (infolaeliterentals@gmail.com) or Cash.*
>
> *Please send a screenshot once completed. Thank you!"*

**Due Date (10 AM):**
> *"Hi [First Name], your weekly payment is due today by 12:00 PM.*
>
> *Zelle: infolaeliterentals@gmail.com*
>
> *Please send confirmation once paid. Thank you!"*

**Overdue (12:30 PM):**
> *"Hi [First Name], your payment was due at 12:00 PM today. Please send payment immediately or contact us to discuss vehicle return.*
>
> *Thank you."*

### Questions to Ask Kel

| # | Question | Notes |
|---|----------|-------|
| 1 | **Is $420/week still the standard payment amount, or does it vary by vehicle/plan?** | If it varies, we need to pull from a custom field instead of hardcoding |
| 2 | **Is Zelle to infolaeliterentals@gmail.com still the primary payment method? Any others we should list?** | May need to add Cash App, Apple Pay, etc. |
| 3 | **Is the 12:00 PM deadline correct and consistent for all renters?** | Some renters might have different terms |
| 4 | **How does "Payment Received" currently get marked in GHL?** Does someone manually update it, or is there a process? | This is the exit condition — if it's manual, the VA needs to know to tag it promptly |
| 5 | **For the overdue escalation task — who should it go to? You directly, or a VA/manager?** | Task routing |
| 6 | **Do you want the day-before reminder, or is that too early? Some clients prefer only day-of + overdue.** | Optional — Kel may want to adjust the cadence |
| 7 | **Where is Payment Due Date tracked right now?** Is it a GHL custom field already, or do you track it somewhere else (spreadsheet, HQ Rental)? | Critical — this is the trigger. If it doesn't exist as a GHL field, we need to create it and populate it. |
| 8 | **Do you want us to ask for a screenshot of payment, or just a text confirmation?** | The SMS says "send a screenshot" — confirm this is what he wants |

---

## WORKFLOW 4: Post-Pickup Welcome Kit

### What to Present to Kel

> "Once a new renter picks up their car and you move them to 'Became Renter' in GHL, they'll automatically receive a welcome message 30 minutes later with everything they need to know — payment schedule, Zelle info, security deposit policy, maintenance rules. Then 5 minutes after that, a separate text with Bluetooth setup instructions. You'll never have to remember to send this stuff manually again."

### How It Works
- **Trigger:** Opportunity stage changed to `Became Renter`
- **Wait:** 30 minutes (so the onsite handoff finishes first)
- **Action 1:** Send welcome SMS with key terms
- **Wait:** 5 minutes
- **Action 2:** Send Bluetooth setup SMS (separate message to avoid length issues)
- **Tag:** `Welcome Kit Sent`

### Recommended SMS Copy (Present to Kel)

**Welcome Message (30 min after pickup):**
> *"Hi [First Name],*
>
> *Welcome to LA Elite Rentals! Here are the key terms for your rental:*
>
> *PAYMENT DUE: [Payment Due Date] by 12:00 PM*
> *- Zelle: infolaeliterentals@gmail.com*
>
> *SECURITY DEPOSIT: Refunded 24-48 hours after vehicle return (minus any incidentals).*
>
> *MAINTENANCE: All repairs must be approved by us first. Unauthorized repairs are your responsibility.*
>
> *Questions? Reply to this message anytime.*
>
> *Thank you for choosing LA Elite!"*

**Bluetooth Setup (5 min later):**
> *"BLUETOOTH SETUP (2015 Ford Fusion):*
>
> *1. Turn on car (ignition on)*
> *2. Tap "Phone" on touchscreen*
> *3. Tap "Add Device"*
> *4. On your phone: Settings → Bluetooth → ON*
> *5. Select "SYNC" from device list*
> *6. Enter the PIN shown on screen*
> *7. Allow permissions when prompted*
>
> *For music: Tap Entertainment → Source → Bluetooth Audio*
>
> *Let us know if you need help!"*

### Questions to Ask Kel

| # | Question | Notes |
|---|----------|-------|
| 1 | **Is the wording on the welcome message good? Anything you'd add or change?** | Key terms, policies, tone |
| 2 | **Security deposit refund — is 24-48 hours accurate? And is it always minus incidentals, or are there other conditions?** | Make sure policy is current |
| 3 | **The Bluetooth instructions reference a 2015 Ford Fusion. Do all your vehicles have the same setup, or do we need different instructions per car?** | If fleet varies, we may need vehicle-specific messages or a generic version |
| 4 | **Is 30 minutes after stage change the right delay? Too soon? Too late?** | Some handoffs might take longer |
| 5 | **Is there anything else you always tell new renters that we should include?** (parking rules, gas policy, emergency contacts, etc.) | Catch anything we're missing |
| 6 | **Do you want to include your phone number or a specific contact number in the welcome message for questions?** | Currently says "reply to this message" — he might want a direct line |

---

## CLOSING THE CALL

### Wrap-Up Script

> "So that's Phase 1 — four workflows that'll immediately take manual work off your plate. Once you confirm the wording and answer these questions, Marky will start building this week. He'll test everything with a test contact before going live, and I'll review it all before we flip the switch."
>
> "Phase 2 is next week — that's your lead nurturing sequences. I'll walk you through those the same way once Phase 1 is live."

### Final Questions

| # | Question | Notes |
|---|----------|-------|
| 1 | **Is there anything else in Phase 1 that you'd want to add or change before we start building?** | Last chance for scope adjustments |
| 2 | **What's the best way to reach you this week if Marky has a quick question while building?** (text, call, email) | Communication channel for build week |
| 3 | **Would you like to be on a quick 15-min review call before we push these live, or are you okay with us testing and going live once approved?** | Go-live process |

---

## QUICK REFERENCE — What You Need From Kel (Checklist)

Use this to track what you've confirmed during the call:

- [ ] Pipeline stages confirmed (or corrections noted)
- [ ] Existing automations identified (what to keep, what to replace)
- [ ] VA / task assignee name confirmed
- [ ] SMS sender name/number confirmed
- [ ] Lead sources confirmed (Facebook, web form, others?)
- [ ] Qualifying questions approved (for speed-to-lead)
- [ ] Phone system confirmed (GHL built-in vs. RingCentral vs. other)
- [ ] Missed call text — all calls or new numbers only?
- [ ] Business hours for texting confirmed
- [ ] Payment amount confirmed ($420 or variable?)
- [ ] Payment methods confirmed (Zelle address, others?)
- [ ] Payment deadline confirmed (12 PM, consistent?)
- [ ] How "Payment Received" gets tagged
- [ ] Payment Due Date — where it's tracked / how it gets into GHL
- [ ] Welcome message copy approved
- [ ] Security deposit policy confirmed
- [ ] Bluetooth instructions — same for all vehicles or varies?
- [ ] Welcome message delay (30 min) approved
- [ ] Additional info for new renters identified
- [ ] Best contact method for build week
- [ ] Go-live review preference confirmed

---

**Document Created:** 2026-02-24
**For:** Fiona — Phase 1 call with Kel
**Prepared by:** Nova (ORBIT)
