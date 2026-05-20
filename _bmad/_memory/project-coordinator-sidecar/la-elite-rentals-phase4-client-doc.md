# LA Elite Rentals — Phase 4: Internal Efficiency

**Prepared for:** Kel King
**Prepared by:** Fiona (Aivate)
**Updated:** May 21, 2026
**Status:** ALL 7 WORKFLOWS APPROVED BY KEL — May 21, 2026
**Call Recording:** [Phase 4 Automation Kick Off — 39 min](https://fathom.video/share/ffTwkkS_5mxPU8oxxGRhc4y4g9JNC4Tu)

---

## Summary of Changes (May 21 Call)

| # | Item | Type | Details |
|---|------|------|---------|
| 1 | **WF15 — Background check denial: NO SMS** | Workflow Change | Kel says background check denials are sensitive. Do NOT send any automated message. Just move to Denied stage with no response. All other denial reasons approved as-is. |
| 2 | **WF16 — Day-before time changed to 1 PM PT** | Workflow Change | Kel requested afternoon instead of 10 AM. Changed to 1:00 PM Pacific. |
| 3 | **WF16 — ETA check changed to 1 hour before** | Workflow Change | "LA is a big place" — changed from 30 min to 1 hour before scheduled pickup. |
| 4 | **WF16 — Multi-person notification for ALL scenarios** | Major Addition | Every pickup outcome (confirm, reschedule, no reply) sends SMS notifications to Kel (773-807-7147) AND Don (917-365-3661) AND creates a task for DOS. Everyone gets notified regardless of the outcome. |
| 5 | **WF16 — No-reply alert at 30 min before** | Addition | If renter hasn't replied to the 1-hour ETA check, a "no response" alert fires to Kel, Don, and DOS at 30 min before pickup. |
| 6 | **WF16 — Post-pickup policy reiteration message** | Addition | Kel shared the current manual welcome text DOS sends after pickup. Wants it automated. Ties into existing WF4 (Welcome Kit) — needs update to include Kel's current version. Variable: payment due date differs for 3-day vs weekly programs. |
| 7 | **WF18 — Two new Bouncie alert types** | Addition | Added: (1) **Impact** (collision/positional impact) — CRITICAL, renter SMS yes. (2) **Device Removed** (Bouncie physically removed from vehicle) — CRITICAL, internal alert + team notification, no renter SMS. |
| 8 | **WF19 — Don added to notifications** | Addition | Don (917-365-3661) also receives SMS for off-grid alerts, not just Kel. |
| 9 | **Pipeline hygiene concern** | Operational | Kel wants proper pipeline labeling: current renters should not get mass lead texts, denied contacts properly categorized, waitlist properly organized. Fiona to coordinate with DOS to cross-check GHL pipeline. |
| 10 | **Phase 3 status update** | Info | Phase 3 is 90% complete. Marky finishing EOD May 21 (PH time). |
| 11 | **May $350 retainer outstanding** | Billing | Kel committed to sending today (May 21). |

---

## What Phase 4 Is About

Phases 1-3 focused on leads and renters — getting them in, converting them, keeping them happy, and protecting revenue. Phase 4 is about **the back-office** — making sure your internal systems run smoother so Dos and the team spend less time on manual tracking, follow-up reminders, and repetitive admin. These automations create tasks automatically, flag problems before they become emergencies, and handle routine communications that currently require someone to remember and act manually.

This is also where we bring in **Bouncie integration** — your GPS tracking system now talks to GHL so vehicle alerts, border violations, and maintenance triggers happen automatically instead of Kel or Dos having to monitor the Bouncie dashboard manually.

**Estimated timeline:** ~2 weeks for all 7 workflows (Bouncie integration may extend depending on webhook setup).

**Workflows in this phase:**

| # | Workflow | What It Does | Priority | Status |
|---|----------|--------------|----------|--------|
| 13 | Auto-Task on Stage Change | Automatically creates follow-up tasks for Dos when a lead moves through pipeline stages | HIGH | APPROVED |
| 14 | Stale Lead Alert | Flags leads that have had no activity for 48+ hours so nobody falls through the cracks | HIGH | APPROVED |
| 15 | Denial Reason Auto-Response | Sends a professional, reason-specific message when a lead is denied | MEDIUM | APPROVED (with changes) |
| 16 | Pickup Confirmation Sequence | Day-before and day-of confirmation texts + multi-person team notifications | HIGH | APPROVED (with changes) |
| 17 | Registration Renewal Notification | Internal alerts at 30, 14, and 7 days before a vehicle's registration expires | MEDIUM | APPROVED |
| 18 | Bouncie Maintenance Alert | Vehicle diagnostic alerts trigger tasks and renter notifications automatically | MEDIUM | APPROVED (with additions) |
| 19 | Off-Grid / Border Alert | Urgent alert when a vehicle leaves the LA service area geofence | HIGH | APPROVED (with additions) |

---

### WORKFLOW 13: Auto-Task on Stage Change

**Priority: HIGH | Status: APPROVED**

Right now, when a lead moves from one pipeline stage to another, nothing happens automatically — someone has to remember what the next step is and do it. This workflow creates a task for Dos the moment a lead's stage changes, so the follow-up action is never missed. Each stage gets a different task tailored to what needs to happen next.

Kel's feedback: *"I'm loving these accountability tasks for the employees. The automations are making sure they're not forgetting certain things."*

**How It Works**

| Stage Change | Task Created for Dos |
|-------------|---------------------|
| **New Lead** | "New lead entered — review and make first contact within 1 hour" |
| **Waiting for Paperwork** | "Follow up on intake form in 24 hours if not submitted" |
| **Priority Nurturing Leads** | "Hot lead — reach out today to schedule intake/pickup" |
| **Waitlist** | "Add to waitlist tracker — note vehicle type requested" |
| **Denied Not Interested** | "Confirm denial reason is logged — auto-response will send" |
| **Became Renter** | "New renter — confirm pickup completed and welcome kit received" |

**No SMS is sent to the lead/renter** — this is purely an internal task-creation workflow.

---

### WORKFLOW 14: Stale Lead Alert (48-Hour No Activity)

**Priority: HIGH | Status: APPROVED**

If a lead has been sitting in `New Lead`, `Waiting for Paperwork`, or `Priority Nurturing Leads` for more than 48 hours with no activity — no calls, no texts, no notes — this workflow fires off an urgent task for Dos. It's a safety net that catches leads before they go cold. With the volume of leads coming in, it's easy for one or two to slip through when things get busy.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact is in `New Lead`, `Waiting for Paperwork`, or `Priority Nurturing Leads` stage + no activity logged for 48 hours |
| **Action** | Create URGENT task for Dos: "Stale lead — [First Name] — no activity for 48hrs. Re-engage or update stage." |
| **Tag** | Add `Stale - Needs Attention` |
| **If Dos engages** | Activity logged → timer resets → no further alerts unless it goes stale again |

**No SMS is sent to the lead** — this is an internal alert only.

---

### WORKFLOW 15: Denial Reason Auto-Response

**Priority: MEDIUM | Status: APPROVED (with changes)**

When a lead gets moved to `Denied Not Interested`, they currently get nothing — no message, no explanation. This workflow sends a professional, respectful denial message tailored to the specific reason. It closes the loop cleanly, keeps the door open where appropriate (expired license, low earnings), and saves Dos from having to write individual denial messages every time.

**Key decision from Kel (May 21):** Background check denials get **NO automated message at all** — Kel says it's sensitive. The lead simply gets moved to Denied with no SMS.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact moved to `Denied Not Interested` stage |
| **Condition** | Custom field `Denial Reason` is set |
| **Action** | Send reason-specific SMS → Add tag `Denial Message Sent` |
| **If reason = Background Check** | **NO SMS sent.** Contact moved to Denied silently. No automated response. |
| **If no reason set** | Skip SMS → Create task for Dos: "Denial reason missing — update before message can send" |

**Recommended SMS Copy (by Denial Reason) — ALL APPROVED BY KEL**

**Low Earnings:**
> Hi [First Name], thank you for your interest in LA Elite Rentals.
>
> At this time, we're unable to proceed due to recent earnings not meeting our requirements. However, if you have another source of income (such as a 9-to-5 job), you may submit a recent pay stub for review.
>
> Feel free to reach out once available. Thank you for understanding.

**Expired License:**
> Hi [First Name], we're unable to move forward at the moment because your driver's license is expired.
>
> Once it's renewed and valid, feel free to contact us again at 310-943-6795. Thank you.

**Too Far / Outside LA:**
> Hi [First Name], thank you for reaching out. Unfortunately, we're unable to proceed as your location is outside our current service area.
>
> We appreciate your interest and wish you the best!

*Note: Kel mentioned the possibility of referring denied-for-location leads to business associates in nearby areas (San Diego, Inland Empire, Vegas) — decided to keep it simple for now. If they reach out asking, DOS handles the referral manually.*

**Under 25:**
> Hi [First Name], at this time, we're unable to proceed as our rentals require drivers to be at least 25 years old.
>
> Please feel free to reach out again once eligible. Thank you for understanding.

**Background Check:**
> **NO SMS SENT.** Contact moved to Denied silently. Kel's decision — this is sensitive and should not be communicated via automated text.

---

### WORKFLOW 16: Pickup Confirmation Sequence

**Priority: HIGH | Status: APPROVED (with significant changes)**

When a new renter has a pickup date set, they automatically get a confirmation text the day before (with location and time) and a "headed our way?" check **1 hour before** their scheduled pickup. This reduces no-shows, makes the experience feel professional, and gives the team advance warning if someone isn't going to make it.

**Key changes from Kel (May 21):**
- Day-before confirmation changed to **1:00 PM PT** (Kel requested afternoon)
- ETA check changed from 30 min to **1 hour before** pickup ("LA is a big place")
- **ALL scenarios notify the full team** — DOS (task), Kel (SMS), Don (SMS). Nobody is left out of the loop.
- If no reply, a "no response" alert fires to everyone at **30 min before** pickup

**Team Notification Numbers:**
| Person | Number | Notification Method |
|--------|--------|-------------------|
| **DOS** | *(GHL user)* | Task in GHL |
| **Kel** | 773-807-7147 | SMS |
| **Don** | 917-365-3661 | SMS |

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Custom field `Pickup Date` = Tomorrow |
| **Day Before (1:00 PM PT)** | Send confirmation SMS to renter |
| **Day Of (1 hour before pickup)** | Send ETA check SMS to renter |
| **If renter confirms ETA** | SMS to Kel + Don: "Renter [First Name] confirmed — arriving at [ETA]. Pickup at [Time]." + Task for DOS to inform ground crew. |
| **If renter needs to reschedule** | SMS to Kel + Don: "Renter [First Name] needs to reschedule pickup." + Task for DOS: "Coordinate new pickup date." |
| **If no reply (30 min before pickup)** | SMS to Kel + Don: "No response from [First Name] — pickup in 30 min. Unconfirmed." + Task for DOS: "Call [First Name] immediately to confirm." |

**Recommended SMS Copy**

**Day Before — Confirmation (1:00 PM PT):**
> Hi [First Name], just confirming your vehicle pickup tomorrow!
>
> LOCATION: 6102 W Sunset Blvd, Los Angeles, CA 90028
> TIME: [Pickup Time]
>
> Please bring your valid driver's license. See you there!

**Day Of — ETA Check (1 hour before scheduled time):**
> Hi [First Name], we're expecting you in about an hour at 6102 W Sunset Blvd.
>
> On your way? Reply with your ETA!

**Internal Team Notification Templates:**

*Renter confirmed:*
> [LA Elite] Pickup CONFIRMED — [First Name] arriving at [ETA]. Scheduled: [Time] at Sunset Blvd.

*Renter rescheduling:*
> [LA Elite] Pickup RESCHEDULE — [First Name] needs to reschedule. DOS to follow up for new date.

*No response (30 min before):*
> [LA Elite] Pickup NO RESPONSE — [First Name] has not replied. Pickup in 30 min. Unconfirmed.

---

### Post-Pickup Policy Reiteration (Addition from Kel — May 21)

Kel shared that DOS currently sends a manual welcome/policy text after every pickup. He wants this automated. This is separate from the WF4 Welcome Kit (which fires on stage change to "Became Renter") — this is a policy reiteration message that goes out after the renter physically pulls off with the car.

**Action item:** Kel to send the current text template to Fiona via email. Key variable: **payment due date differs for 3-day ($222) vs weekly programs.** Automation must be mindful of both payment structures.

**Implementation note:** This may update the existing WF4 (Post-Pickup Welcome Kit) rather than creating a new workflow. Fiona to review Kel's template and determine best placement.

---

### WORKFLOW 17: Registration Renewal Notification

**Priority: MEDIUM | Status: APPROVED**

This is an internal-only workflow — no messages go to renters. It monitors vehicle registration expiry dates and creates escalating tasks for the team at 30, 14, and 7 days before expiry. Keeps your fleet legal without anyone having to manually track dates in a spreadsheet.

**Data Source:** [LA Elite Rentals 2.0 Google Sheet](https://docs.google.com/spreadsheets/d/19YtXpZoymtNFaxKLucoz5TUWh-vaTu5dHHcAm59WUSs/edit?usp=sharing) — **"Car registrations" tab** (confirmed by Kel, May 21)

**How It Works**

| Timing | Action |
|--------|--------|
| **30 days before expiry** | Create task: "Vehicle registration expiring in 30 days — [Vehicle Name/Plate]" → Dos |
| **14 days before expiry** | Create HIGH priority task: "Vehicle registration expiring in 14 days — [Vehicle Name/Plate]" → Dos |
| **7 days before expiry** | Create URGENT task: "Vehicle registration expires in 7 days — [Vehicle Name/Plate]. Renew immediately." → Dos + Kel notified |
| **Tag** | `Registration - 30 Day Warning` at 30 days, `Registration - Critical` at 7 days |

**No SMS is sent to renters** — this is purely internal fleet management.

---

### WORKFLOW 18: Bouncie Maintenance Alert Automation

**Priority: MEDIUM | Status: APPROVED (with additions)**

When Bouncie detects a vehicle issue — check engine light, overheating, low battery, impact, or any diagnostic trouble code — it sends a webhook to GHL. This workflow catches that webhook, creates an internal task for Dos, and sends a text to the renter telling them NOT to attempt any repairs and to contact LA Elite immediately. This replaces manually monitoring the Bouncie dashboard.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Bouncie webhook received (vehicle alert) |
| **Match** | Vehicle matched to current renter via vehicle tag or custom field |
| **Action 1** | Create task for Dos: "Vehicle Alert — [Alert Type] — [Vehicle Name]. Contact renter." |
| **Action 2** | Send SMS to renter (for applicable alerts — see table below) |
| **Action 3** | Internal team notification (for critical alerts) |
| **Tag** | Add `Maintenance Alert - [Type]` |
| **Note** | Alert details logged to contact record |

**Alert Types (updated with Kel's additions — May 21):**

| Alert | Severity | Renter SMS? | Team Alert? |
|-------|----------|-------------|-------------|
| Check engine light | HIGH | Yes | Yes |
| Overheating / coolant | CRITICAL | Yes | Yes |
| Low battery voltage | MEDIUM | Yes | Yes |
| **Impact (collision)** | CRITICAL | Yes | Yes — Kel + Don + DOS |
| **Device removed** | CRITICAL | **No** — handled internally | Yes — URGENT to Kel + Don + DOS |
| Hard braking / rapid acceleration | LOW | No — internal task only | No |
| Mileage threshold reached | MEDIUM | No — internal task only | No |
| DTC (Diagnostic Trouble Code) | HIGH | Yes | Yes |

**Device Removed alert:** Kel confirmed this is a CRITICAL security issue. If the Bouncie device is physically removed from a vehicle, it fires an urgent internal alert to the entire team. **No SMS is sent to the renter** — the team handles it manually. Kel to send Fiona a screenshot of how this alert appears in the Bouncie dashboard.

**Recommended SMS Copy (for renter-facing alerts):**

> Hi [First Name], we received an alert from your vehicle.
>
> Please do NOT attempt any repairs on your own. Contact us immediately so we can assess the situation:
> 310-943-6795
>
> Reply here or call us. Thank you.

**Response Handling**

| Renter Action | What Happens |
|---------------|--------------|
| Calls or replies | Dos coordinates next steps (bring to Santa Tire Depot, roadside assist, etc.) |
| No response within 1 hour | Dos gets follow-up task: "No response from [First Name] on vehicle alert. Call immediately." |

---

### WORKFLOW 19: Off-Grid / Border Alert

**Priority: HIGH | Status: APPROVED (with additions)**

If a vehicle crosses outside the defined LA service area geofence (set up in Bouncie), this workflow fires an urgent internal alert. Kel AND Don get notified directly. This is a security and liability issue — no automated message goes to the renter. The team decides how to handle it on a case-by-case basis.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Bouncie geofence webhook — vehicle exits defined boundary |
| **Action 1** | Create URGENT task for Dos: "ALERT: Vehicle left service area — [Vehicle Name]" |
| **Action 2** | Send SMS to Kel (773-807-7147): "[LA Elite] ALERT: [Vehicle Name] left service area. Check Bouncie." |
| **Action 3** | Send SMS to Don (917-365-3661): "[LA Elite] ALERT: [Vehicle Name] left service area. Check Bouncie." |
| **Tag** | Add `Off-Grid Alert` |
| **Note** | Location data from Bouncie logged to contact record |

**No SMS is sent to the renter** — this is handled manually by the team.

---

## Resolved Questions (From Kel — May 21)

These items from the original draft have been answered:

| Question | Answer |
|----------|--------|
| Denial reasons complete? | Yes — Low Earnings, Expired License, Too Far/Outside LA, Under 25, Background Check. No new reasons. Background Check = NO SMS. |
| Pickup confirmation time? | Day-before at 1 PM PT. ETA check at 1 hour before (not 30 min). |
| Who gets pickup notifications? | Everyone — DOS (task) + Kel (SMS) + Don (SMS). All scenarios. |
| Additional Bouncie alerts? | Impact (collision) and Device Removed added. |
| Off-grid alert recipients? | Kel AND Don both get SMS. DOS gets task. |
| Registration data source? | Google Sheet > "Car registrations" tab confirmed. |

## Open Items (Still Needed)

| # | Item | Owner | Status |
|---|------|-------|--------|
| 1 | **Bouncie API key / webhook access for Marky** — Marky to work with DOS to get this | DOS + Marky | PENDING |
| 2 | **Bouncie dashboard screenshot (device removed alert)** — Kel or DOS to send to Fiona | Kel / DOS | PENDING — Kel to send via email |
| 3 | **Post-pickup policy text template** — Kel to send the current manual text DOS uses | Kel | PENDING — Kel to send via email |
| 4 | **Geofence boundaries** — Confirm LA service area geofence is configured in Bouncie | Kel / DOS | PENDING |
| 5 | **Vehicle-to-renter mapping in GHL** — Confirm custom field exists | Marky / DOS | PENDING |
| 6 | **Pipeline hygiene audit** — Cross-check GHL pipeline: ensure current renters, denied, and waitlist contacts are properly categorized so mass texts don't hit wrong people | Fiona + DOS | PENDING |
| 7 | **Payment structure handling for WF4 update** — Confirm how 3-day ($222) vs weekly programs are identified in GHL | Marky / DOS | PENDING |

---

## Phase 4 Pre-Build Checklist

- [ ] **Bouncie API key / webhook for Marky** — DOS to provide access
- [ ] **Bouncie device removed screenshot** — Kel to send via email
- [ ] **Kel's post-pickup policy text** — Kel to send via email
- [ ] **Geofence boundaries defined in Bouncie** — Kel/DOS to configure LA service area
- [ ] **Vehicle-to-renter mapping in GHL** — confirm or create custom field linking vehicles to contacts
- [ ] **Registration expiry dates in GHL** — determine sync method from Google Sheet "Car registrations" tab
- [ ] **Pipeline hygiene audit** — Fiona + DOS to cross-check GHL pipeline for proper categorization
- [ ] Confirm/create custom fields: `Vehicle Name`, `Vehicle Plate`, `Registration Expiry Date`, `Pickup Date`, `Pickup Time`, `Denial Reason`
- [ ] Confirm/create tags: `Stale - Needs Attention`, `Denial Message Sent`, `Registration - 30 Day Warning`, `Registration - Critical`, `Maintenance Alert - [Type]`, `Off-Grid Alert`
- [ ] Confirm denial reasons are logged as a custom field value (dropdown) in GHL
- [ ] **Resolve Phase 3 bug fixes first** — timezone mismatch, duplicate lead-intake automations, daily vs. weekly program verification (all must be clean before Phase 4 build)

---

## Phase 4 Sprint Plan

| # | Workflow | Priority | Key Deliverables | Owner | Status |
|---|----------|----------|-----------------|-------|--------|
| 13 | **Auto-Task on Stage Change** | HIGH | Task templates for 6 pipeline stages, no renter-facing SMS | Marky | APPROVED — Ready to Build |
| 14 | **Stale Lead Alert** | HIGH | 48hr no-activity detection, internal task, stale tag | Marky | APPROVED — Ready to Build |
| 15 | **Denial Reason Auto-Response** | MEDIUM | 4 reason-specific SMS templates (NOT background check), fallback task if no reason set | Marky | APPROVED — Ready to Build |
| 16 | **Pickup Confirmation Sequence** | HIGH | Day-before (1PM) + day-of (1hr before) SMS, multi-person team notifications for ALL outcomes | Marky | APPROVED — Ready to Build |
| 17 | **Registration Renewal Notification** | MEDIUM | 30/14/7-day escalating internal tasks, Google Sheet data sync | Marky | APPROVED — Needs data sync method |
| 18 | **Bouncie Maintenance Alert** | MEDIUM | Webhook integration, 8 alert types (incl. Impact + Device Removed), renter SMS for critical alerts | Marky | APPROVED — Blocked on Bouncie access |
| 19 | **Off-Grid / Border Alert** | HIGH | Geofence webhook, urgent task + SMS to Kel AND Don | Marky | APPROVED — Blocked on geofence config |

**Recommended Build Order:**

| Order | Workflow | Reason |
|-------|----------|--------|
| 1 | WF13 — Auto-Task on Stage Change | No dependencies. Immediate value. Quick build. |
| 2 | WF14 — Stale Lead Alert | No dependencies. Protects existing pipeline. |
| 3 | WF15 — Denial Reason Auto-Response | No dependencies. `Denial Reason` field needed. |
| 4 | WF16 — Pickup Confirmation | Needs `Pickup Date` field + team notification setup. |
| 5 | WF17 — Registration Renewal | Needs Google Sheet sync or manual data entry method. |
| 6 | WF18 — Bouncie Maintenance | Blocked until Marky gets Bouncie API/webhook access from DOS. |
| 7 | WF19 — Off-Grid Alert | Blocked until geofence configured in Bouncie. |

---

## Dependencies on Previous Phases

| Dependency | Impact | Status |
|-----------|--------|--------|
| **Phase 3 completion** | Phase 3 at 90% — Marky finishing EOD May 21 (PH time). Must complete before Phase 4 build starts. | In Progress |
| **Phase 3 bug fixes** — timezone, duplicate automations, daily/weekly verification | Must be resolved before Phase 4 build starts | From Phase 3 doc — check with Marky |
| **HQ Rental integration** — deferred from Phase 1 | WF3 payment triggers + WF16 pickup confirmation work better with automatic sync. Without it, triggers remain manual. | Needs scoping by Marky |
| **WF4 Welcome Kit update** | Post-pickup policy text from Kel may require updating existing WF4 to include full policy reiteration + handle 3-day vs weekly payment structures | PENDING — Kel to send template |

---

## Future Opportunities (Not in Phase 4 — Separate Scope)

These were discussed in previous calls but are not included in the retainer:

| Opportunity | Notes | Estimated Scope |
|------------|-------|-----------------|
| **AI Voice Agent / Robocalling** | AI handles inbound lead questions (rates, pickup, how it works) | Separate quote — $2,000+ |
| **AI Website Chat Agent** | Agentic AI on website to answer inquiries without calling | Separate quote |
| **Payment Email Parsing** | Automate reading Zelle/Chase payment notifications and marking payments in GHL or HQ Rental | Separate quote — Kel called this "a game changer" |
| **White Label Services** | Kel showing his GHL setup to other clients — white-label Aivate services | Discussion stage |

---

## Billing

| Month | Amount | Status |
|-------|--------|--------|
| May 2026 | $350 | OUTSTANDING — Kel committed to sending today (May 21) |
