# LA Elite Rentals — Phase 1: Quick Wins

**Prepared for:** Kel King
**Prepared by:** Fiona (Aivate)
**Updated:** February 26, 2026

---

## WORKFLOW 1: Speed-to-Lead Auto-Response

When a new lead comes in — whether from your Facebook ads or a web form — they'll instantly get a text within 1 minute. No more leads sitting there waiting. This is your fastest way to engage before they move on to another rental company. The text includes your intake form link so interested leads can get started right away.

**How It Works**

- **Trigger:** New contact created (from Facebook Lead or Web Form)
- **Wait:** 1 minute (feels natural, not robotic)
- **Action:** Send SMS → Add tag (`Speed-to-Lead Sent`) → Create follow-up task for Dos if no response in 2 hours

**Recommended SMS Copy**

> Hi [First Name]! This is LA Elite Rentals. Thanks for reaching out.
>
> Quick question: Are you currently driving for Uber, Lyft, or delivery apps? And are you located in the LA area?
>
> Reply and we'll get you set up fast.
>
> Ready to get started? Fill out our intake form: https://laeliterentals2.hqrentals.asia/form/driver-intake-form

---

## WORKFLOW 2: Missed Call Text-Back

Whenever someone calls either your GoHighLevel number (516-670-1787) or your RingCentral number (310-943-6795) and the team can't pick up, they'll automatically get a text within 2 minutes. This way you never lose a lead just because you missed a call — and it opens the conversation via text so they can reply when it's convenient. The response is different depending on whether the call comes in during business hours or after hours.

**How It Works**

- **Trigger:** Missed call on 516-670-1787 (GHL) or 310-943-6795 (RingCentral)
- **Wait:** 2 minutes
- **Action:** Send SMS → Add tag (`Missed Call - Texted`) → Create follow-up task for Dos
- **Business Hours:** 8:00 AM – 4:00 PM PT

**Recommended SMS Copy — Business Hours (8 AM – 4 PM PT)**

> Hi [First Name], sorry we missed your call! This is LA Elite Rentals.
>
> Are you looking to rent a car for rideshare or delivery? Reply here and we'll get back to you right away.
>
> Ready to get started? Fill out our intake form: https://laeliterentals2.hqrentals.asia/form/driver-intake-form

Follow-up task: Dos responds within 2 hours.

**Recommended SMS Copy — After Hours (before 8 AM / after 4 PM PT)**

> Hi [First Name], sorry we missed your call! This is LA Elite Rentals.
>
> We're currently closed but will get back to you first thing tomorrow. In the meantime, feel free to fill out our intake form so we can get you started faster:
>
> https://laeliterentals2.hqrentals.asia/form/driver-intake-form
>
> Are you looking to rent a car for rideshare or delivery? Reply here and we'll follow up in the morning!

Follow-up task: Dos follows up first hour of next shift.

---

## WORKFLOW 3: Payment Due Reminder Sequence

This is a 3-stage automatic reminder sequence. The day before a renter's return date, on the due date, and if they haven't paid by 12:30 PM, an overdue nudge goes out. The first message also asks whether the renter plans to extend — so you know right away if they're staying, returning, or undecided, and the team gets a task based on their answer. You'll never have to manually chase weekly payments again.

**How It Works**

- **Trigger:** Renter is scheduled to return tomorrow (pulled from HQ Rental → Dashboard → "Time To Tomorrow")
- **Stage 1:** Day before — SMS at **2:00 PM PT** (includes extension question)
- **Stage 2:** Due date — SMS at **8:00 AM PT**
- **Stage 3:** Overdue — SMS at 12:30 PM PT (same day) if no payment received
- **Action:** Creates follow-up task for Dos based on renter's response

**Renter Response Handling (Stage 1)**

| Renter Replies | What Happens |
|----------------|-------------|
| **YES** (extending) | Dos gets a task to process the rental extension |
| **NO** (returning) | Dos gets a task to coordinate vehicle return |
| **UNSURE** | Dos gets a task to follow up and clarify |
| **No response** | Proceeds to Stage 2 |

**Recommended SMS Copy**

**Day Before (2:00 PM PT):**

> Hi [First Name], this is LA Elite Rentals. Your weekly payment is due tomorrow by 12:00 PM.
>
> Are you planning to extend your rental? Let us know:
> - Reply YES if you're extending
> - Reply NO if you're returning the vehicle
> - Reply UNSURE if you'd like to discuss options
>
> Payment methods:
> - Zelle: infolaeliterentals@gmail.com
> - Cash App: $rentals1000
>
> Please send a screenshot once paid. Thank you!

**Due Date (8:00 AM PT):**

> Hi [First Name], your weekly payment is due today by 12:00 PM.
>
> Zelle: infolaeliterentals@gmail.com
> Cash App: $rentals1000
>
> Please send confirmation once paid. Thank you!

**Overdue (12:30 PM PT):**

> Hi [First Name], your payment was due at 12:00 PM today. Please send payment immediately or contact us to discuss vehicle return.
>
> Thank you.

---

## WORKFLOW 4: Post-Pickup Welcome Kit

Once a new renter picks up their car and they're moved to "Became Renter" in GHL, they'll automatically receive a series of welcome messages 30 minutes later with everything they need to know — payment info, accident and insurance protocol, tickets and tolls policy, maintenance schedule, and Bluetooth setup. Split into separate texts so nothing gets cut off. You'll never have to remember to send this stuff manually again.

**How It Works**

- **Trigger:** Opportunity stage changed to "Became Renter"
- **Wait:** 30 minutes (so the onsite handoff finishes first)
- **Message 1:** Welcome + payment info
- **Message 2:** Accidents, insurance, tickets & tolls *(5 min later)*
- **Message 3:** Maintenance policy & schedule *(5 min later)*
- **Message 4:** Bluetooth setup instructions *(5 min later)*
- **Tag:** `Welcome Kit Sent`

**Recommended SMS Copy**

**Message 1 — Welcome & Payment (30 min after pickup):**

> Hi [First Name],
>
> Welcome to LA Elite Rentals! Here are the key terms for your rental:
>
> PAYMENT:
> - Zelle: infolaeliterentals@gmail.com
> - Cash App: $rentals1000
>
> SECURITY DEPOSIT: Refunded 24-48 hours after vehicle return (minus any incidentals).
>
> Questions? Call or text us: 310-943-6795
>
> Thank you for choosing LA Elite!

**Message 2 — Accidents, Insurance, Tickets & Tolls (5 min later):**

> IMPORTANT — ACCIDENTS & INSURANCE:
> If you are in an accident, DO NOT contact the insurance company. Contact LA Elite Rentals FIRST at 310-943-6795. We will handle everything from there.
>
> TICKETS & TOLLS:
> You are responsible for all parking tickets, traffic citations, red light violations, and toll charges while renting. Any fines will be charged to your account. If you receive a ticket, notify us immediately.

**Message 3 — Maintenance (5 min later):**

> MAINTENANCE:
> All repairs must be approved by us first. Unauthorized repairs are your responsibility.
>
> We conduct mandatory maintenance checks every 30-45 days. When it's time, we'll coordinate with you to bring the vehicle to our service partner:
>
> Santa Tire Depot
> 5150 Santa Monica Blvd, Los Angeles CA 90028
> 818-588-2440
>
> If you notice any vehicle issues, contact us immediately — do NOT attempt repairs on your own.

**Message 4 — Bluetooth Setup (5 min later):**

> BLUETOOTH SETUP (2015 Ford Fusion):
>
> 1. Turn on car (ignition on)
> 2. Tap "Phone" on touchscreen
> 3. Tap "Add Device"
> 4. On your phone: Settings → Bluetooth → ON
> 5. Select "SYNC" from device list
> 6. Enter the PIN shown on screen
> 7. Allow permissions when prompted
>
> For music: Tap Entertainment → Source → Bluetooth Audio
>
> Let us know if you need help!
