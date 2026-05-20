# LA Elite Rentals — Phase 4: Internal Efficiency

**Prepared for:** Kel King
**Prepared by:** Fiona (Aivate)
**Updated:** May 21, 2026
**Status:** ROUGH DRAFT — Pending Fiona review + Kel discussion

---

## What Phase 4 Is About

Phases 1-3 focused on leads and renters — getting them in, converting them, keeping them happy, and protecting revenue. Phase 4 is about **the back-office** — making sure your internal systems run smoother so Dos and the team spend less time on manual tracking, follow-up reminders, and repetitive admin. These automations create tasks automatically, flag problems before they become emergencies, and handle routine communications that currently require someone to remember and act manually.

This is also where we bring in **Bouncie integration** — your GPS tracking system now talks to GHL so vehicle alerts, border violations, and maintenance triggers happen automatically instead of Kel or Dos having to monitor the Bouncie dashboard manually.

**Workflows in this phase:**

| # | Workflow | What It Does | Priority |
|---|----------|--------------|----------|
| 13 | Auto-Task on Stage Change | Automatically creates follow-up tasks for Dos when a lead moves through pipeline stages | HIGH |
| 14 | Stale Lead Alert | Flags leads that have had no activity for 48+ hours so nobody falls through the cracks | HIGH |
| 15 | Denial Reason Auto-Response | Sends a professional, reason-specific message when a lead is denied | MEDIUM |
| 16 | Pickup Confirmation Sequence | Day-before and day-of confirmation texts to renters with pickup scheduled | HIGH |
| 17 | Registration Renewal Notification | Internal alerts at 30, 14, and 7 days before a vehicle's registration expires | MEDIUM |
| 18 | Bouncie Maintenance Alert | Vehicle diagnostic alerts (check engine, overheating, battery, etc.) trigger tasks and renter notifications automatically | MEDIUM |
| 19 | Off-Grid / Border Alert | Urgent alert when a vehicle leaves the LA service area geofence | HIGH |

---

### WORKFLOW 13: Auto-Task on Stage Change

**Priority: HIGH**

Right now, when a lead moves from one pipeline stage to another, nothing happens automatically — someone has to remember what the next step is and do it. This workflow creates a task for Dos the moment a lead's stage changes, so the follow-up action is never missed. Each stage gets a different task tailored to what needs to happen next.

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

**Priority: HIGH**

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

**Priority: MEDIUM**

When a lead gets moved to `Denied Not Interested`, they currently get nothing — no message, no explanation. This workflow sends a professional, respectful denial message tailored to the specific reason. It closes the loop cleanly, keeps the door open where appropriate (expired license, low earnings), and saves Dos from having to write individual denial messages every time.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Contact moved to `Denied Not Interested` stage |
| **Condition** | Custom field `Denial Reason` is set |
| **Action** | Send reason-specific SMS → Add tag `Denial Message Sent` |
| **If no reason set** | Skip SMS → Create task for Dos: "Denial reason missing — update before message can send" |

**Recommended SMS Copy (by Denial Reason)**

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

**Under 25:**
> Hi [First Name], at this time, we're unable to proceed as our rentals require drivers to be at least 25 years old.
>
> Please feel free to reach out again once eligible. Thank you for understanding.

**Background Check:**
> Hi [First Name], thank you for your interest. At this time, we're unable to proceed based on our background check requirements.
>
> We appreciate your understanding.

---

### WORKFLOW 16: Pickup Confirmation Sequence

**Priority: HIGH**

When a new renter has a pickup date set, they automatically get a confirmation text the day before (with location and time) and a "headed our way?" check 30 minutes before their scheduled pickup. This reduces no-shows, makes the experience feel professional, and gives the team advance warning if someone isn't going to make it.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Custom field `Pickup Date` = Tomorrow |
| **Day Before (10:00 AM PT)** | Send confirmation SMS |
| **Day Of (30 min before pickup)** | Send ETA check SMS |
| **If renter replies with issue** | Dos gets a task to handle rescheduling |

**Recommended SMS Copy**

**Day Before — Confirmation (10:00 AM PT):**
> Hi [First Name], just confirming your vehicle pickup tomorrow!
>
> LOCATION: 6102 W Sunset Blvd, Los Angeles, CA 90028
> TIME: [Pickup Time]
>
> Please bring your valid driver's license. See you there!

**Day Of — ETA Check (30 min before scheduled time):**
> Hi [First Name], we're expecting you in about 30 minutes at 6102 W Sunset Blvd.
>
> On your way? Reply with your ETA!

**Response Handling**

| Renter Replies | What Happens |
|----------------|--------------|
| Confirms / gives ETA | No action needed — team prepares for pickup |
| Needs to reschedule | Dos gets a task: "Renter [First Name] needs to reschedule pickup. Follow up to set new date." |
| No reply (day of) | Dos gets a task: "No response from [First Name] — pickup in 30 min. Call to confirm." |

---

### WORKFLOW 17: Registration Renewal Notification

**Priority: MEDIUM**

This is an internal-only workflow — no messages go to renters. It monitors vehicle registration expiry dates and creates escalating tasks for the team at 30, 14, and 7 days before expiry. Keeps your fleet legal without anyone having to manually track dates in a spreadsheet.

**Data Source:** [LA Elite Rentals 2.0 Google Sheet](https://docs.google.com/spreadsheets/d/19YtXpZoymtNFaxKLucoz5TUWh-vaTu5dHHcAm59WUSs/edit?usp=sharing)

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

**Priority: MEDIUM**

When Bouncie detects a vehicle issue — check engine light, overheating, low battery, hard braking, or any diagnostic trouble code — it sends a webhook to GHL. This workflow catches that webhook, creates an internal task for Dos, and sends a text to the renter telling them NOT to attempt any repairs and to contact LA Elite immediately. This replaces manually monitoring the Bouncie dashboard.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Bouncie webhook received (vehicle alert) |
| **Match** | Vehicle matched to current renter via vehicle tag or custom field |
| **Action 1** | Create task for Dos: "Vehicle Alert — [Alert Type] — [Vehicle Name]. Contact renter." |
| **Action 2** | Send SMS to renter (see below) |
| **Tag** | Add `Maintenance Alert - [Type]` |
| **Note** | Alert details logged to contact record |

**Expected Alert Types (to verify in Bouncie dashboard):**

| Alert | Severity | Renter SMS? |
|-------|----------|-------------|
| Check engine light | HIGH | Yes |
| Overheating / coolant | CRITICAL | Yes |
| Low battery voltage | MEDIUM | Yes |
| Hard braking / rapid acceleration | LOW | No — internal task only |
| Mileage threshold reached | MEDIUM | No — internal task only |
| DTC (Diagnostic Trouble Code) | HIGH | Yes |

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

**Priority: HIGH**

If a vehicle crosses outside the defined LA service area geofence (set up in Bouncie), this workflow fires an urgent internal alert. Kel gets notified directly. This is a security and liability issue — no automated message goes to the renter. The team decides how to handle it on a case-by-case basis.

**How It Works**

| Step | Detail |
|------|--------|
| **Trigger** | Bouncie geofence webhook — vehicle exits defined boundary |
| **Action 1** | Create URGENT task for Dos: "ALERT: Vehicle left service area — [Vehicle Name]" |
| **Action 2** | Send internal notification to Kel (SMS or email) |
| **Tag** | Add `Off-Grid Alert` |
| **Note** | Location data from Bouncie logged to contact record |

**No SMS is sent to the renter** — this is handled manually by the team.

---

## Questions for Kel (Phase 4 Discussion)

These need to be resolved before Marky can build:

| # | Question | Context |
|---|----------|---------|
| 1 | **Bouncie access for Marky** — Can Kel share Bouncie dashboard access so Marky can audit available webhooks, alert types, and payload structure? | Required for WF18 and WF19. We scoped broadly — need to verify what Bouncie actually sends. |
| 2 | **Geofence boundaries** — Has Kel set up the LA service area geofence in Bouncie? If not, what boundaries should it cover? | Required for WF19. Need the exact boundary before building. |
| 3 | **Which Bouncie alerts should notify the renter?** — Some alerts (hard braking, mileage) may be internal-only. Others (check engine, overheating) definitely need renter contact. Where does Kel draw the line? | Affects WF18 SMS triggers. |
| 4 | **Vehicle-to-renter matching** — How do we know which renter has which vehicle? Is there a custom field in GHL linking vehicles to contacts, or does this live in HQ Rental only? | Required for WF17, WF18, WF19. If the link only exists in HQ Rental, we need a sync method. |
| 5 | **Registration data sync** — The Google Sheet has registration dates. How should this data get into GHL? Options: manual entry, Google Sheets integration, or periodic import. | Required for WF17. |
| 6 | **Pickup confirmation location** — Is 6102 W Sunset Blvd still the standard pickup location, or are there multiple locations now? | For WF16. If multiple locations, SMS needs to pull from a custom field. |
| 7 | **Denial reasons** — Are the 5 denial reasons (Low Earnings, Expired License, Too Far, Under 25, Background Check) still current? Any new reasons to add? | For WF15. Need complete list. |
| 8 | **HQ Rental webhook** — Phase 1 deferred the HQ Rental → GHL integration to Phase 4. Is this still a priority? If yes, this enables automatic triggers for WF3 (payment reminders) and WF16 (pickup confirmation) instead of manual processes. | This is the biggest technical lift in Phase 4. Determines how much manual work stays. |
| 9 | **Stale lead threshold** — Is 48 hours the right window? With the daily program ($222 model), leads may move faster. Should it be shorter for some stages? | For WF14. |

---

## Phase 4 Pre-Build Checklist

- [ ] **Bouncie dashboard access for Marky** — audit webhook events, payload structure, geofence options
- [ ] **Geofence boundaries defined in Bouncie** — Kel to configure LA service area
- [ ] **Vehicle-to-renter mapping in GHL** — confirm or create custom field linking vehicles to contacts
- [ ] **Registration expiry dates in GHL** — determine sync method from Google Sheet
- [ ] **HQ Rental webhook/API investigation** — Marky to assess feasibility of automatic data sync
- [ ] Confirm/create custom fields: `Vehicle Name`, `Vehicle Plate`, `Registration Expiry Date`, `Pickup Date`, `Pickup Time`, `Denial Reason`
- [ ] Confirm/create tags: `Stale - Needs Attention`, `Denial Message Sent`, `Registration - 30 Day Warning`, `Registration - Critical`, `Maintenance Alert - [Type]`, `Off-Grid Alert`
- [ ] Confirm `Pickup Date` custom field is being used consistently (or if it lives in HQ Rental only)
- [ ] Confirm denial reasons are logged as a custom field value (dropdown) in GHL
- [ ] **Resolve Phase 3 bug fixes first** — timezone mismatch, duplicate lead-intake automations, daily vs. weekly program verification (all must be clean before Phase 4 build)

---

## Phase 4 Sprint Plan

| # | Workflow | Priority | Key Deliverables | Owner | Status |
|---|----------|----------|-----------------|-------|--------|
| 13 | **Auto-Task on Stage Change** | HIGH | Task templates for 6 pipeline stages, no renter-facing SMS | Marky | Not Started |
| 14 | **Stale Lead Alert** | HIGH | 48hr no-activity detection, internal task, stale tag | Marky | Not Started |
| 15 | **Denial Reason Auto-Response** | MEDIUM | 5+ reason-specific SMS templates, fallback task if no reason set | Marky | Not Started |
| 16 | **Pickup Confirmation Sequence** | HIGH | Day-before + day-of SMS, response handling, no-show task | Marky | Not Started |
| 17 | **Registration Renewal Notification** | MEDIUM | 30/14/7-day escalating internal tasks, Google Sheet data sync | Marky | Not Started |
| 18 | **Bouncie Maintenance Alert** | MEDIUM | Webhook integration, renter SMS for critical alerts, internal tasks | Marky | Not Started |
| 19 | **Off-Grid / Border Alert** | HIGH | Geofence webhook, urgent internal task, Kel notification | Marky | Not Started |

**Recommended Build Order:**

| Order | Workflow | Reason |
|-------|----------|--------|
| 1 | WF13 — Auto-Task on Stage Change | No dependencies. Immediate value. Quick build. |
| 2 | WF14 — Stale Lead Alert | No dependencies. Protects existing pipeline. |
| 3 | WF15 — Denial Reason Auto-Response | No dependencies. Needs `Denial Reason` field confirmed. |
| 4 | WF16 — Pickup Confirmation | Needs `Pickup Date` field. May depend on HQ Rental sync. |
| 5 | WF17 — Registration Renewal | Needs Google Sheet sync or manual data entry method. |
| 6 | WF18 — Bouncie Maintenance | Blocked until Marky audits Bouncie dashboard. |
| 7 | WF19 — Off-Grid Alert | Blocked until geofence configured in Bouncie. |

---

## Dependencies on Previous Phases

| Dependency | Impact | Status |
|-----------|--------|--------|
| **Phase 3 bug fixes** — timezone, duplicate automations, daily/weekly verification | Must be resolved before Phase 4 build starts | From Phase 3 doc — check with Marky |
| **HQ Rental integration** — deferred from Phase 1 | WF3 payment triggers + WF16 pickup confirmation work better with automatic sync. Without it, triggers remain manual. | Needs scoping by Marky |
| **Phase 2 WF3 — Payment Due Reminders** | WF9 (Late Payment Escalation) chains from WF3. Confirm WF3 is fully operational. | Verify |

---

## Future Opportunities (Not in Phase 4 — Separate Scope)

These were discussed in previous calls but are not included in the retainer:

| Opportunity | Notes | Estimated Scope |
|------------|-------|-----------------|
| **AI Voice Agent / Robocalling** | AI handles inbound lead questions (rates, pickup, how it works) | Separate quote — $2,000+ |
| **AI Website Chat Agent** | Agentic AI on website to answer inquiries without calling | Separate quote |
| **Payment Email Parsing** | Automate reading Zelle/Chase payment notifications and marking payments in GHL or HQ Rental | Separate quote — Kel called this "a game changer" |
| **White Label Services** | Kel showing his GHL setup to other clients — white-label Aivate services | Discussion stage |
