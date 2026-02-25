# LA Elite Rentals — Fleet Maintenance Scheduling Process

**Source:** Fiona's process document (Scale Virtually)
**Added:** 2026-02-26
**Reference for:** Workflow 1.4 (Post-Pickup Welcome Kit), Phase 4 (Bouncie), VA Operations

---

## Introduction

The Fleet Maintenance Scheduling Process ensures that all vehicles are actively monitored, maintained, and repaired in a proactive and autonomous manner. The process relies on real-time vehicle health data, centralized maintenance tracking, and predefined decision rules to reduce downtime, prevent escalations, and eliminate the Fleet Manager as a routine bottleneck.

This process covers proactive system alerts, renter-reported issues, roadside breakdowns, geofence and inactivity monitoring, and ongoing visibility through structured reporting and task tracking.

---

## Required Input

### Systems & Tools
- Bouncie App (fleet health and alerts)
- HQ Rentals Software (Maintenance Request, Pending Maintenance, Repair Orders)
- RingCentral (calls and texts from renters)
- GoHighLevel (Task creation and follow-up tracking)
- Telegram (internal notifications)
- Email or internal messaging tool for team coordination

### Contacts

| Contact | Details |
|---------|---------|
| **Primary Mechanic: Santa Tire Depot** | 5150 Santa Monica Blvd, Los Angeles CA 90028 — Phone: 818-588-2440 |
| **Secondary Mechanic: King Berk Auto Center** | 6044 Santa Monica Blvd, Los Angeles CA 90028 — Phone: 323-460-4989 |
| **On-Ground Team** | Don / John (towing and physical assistance) |
| **Gold Star Tracker Installer** | Tony — +1 (818) 620-1665 |
| **Roadside Assistance** | AAA — https://roadside.aaa.com |

---

## Process

### Step 1: Daily Fleet Health Check (Bouncie App)

1. Log into the Bouncie app
2. Review the full vehicle list and confirm all vehicles are showing green status
3. Identify any alerts (red or orange)

**When a red or orange alert appears (engine, battery, diagnostic code, accident, or system alert):**

**Default action (most codes):**
- Route the vehicle to Santa Tire Depot (5150 Santa Monica Blvd, Los Angeles, CA — Contact: Arturo – 818-588-2440)
- Use the Elite Mechanic chat to coordinate
- No Fleet Manager approval needed

**Contact Fleet Manager if ANY of the following apply:**
- P0420 code (likely catalytic converter issue)
- Battery-related alerts
- Location issues: Geofence alerts, vehicle outside approved area, no activity in 24 hours, unusual location

If an alert is present:
1. Open the affected vehicle
2. Take a screenshot of the alert and code shown

**Decision Point:**
- If no alerts → proceed to Step 2
- If alerts exist → continue to Step 3

### Step 2: Scheduled Maintenance Review (HQ Rental Software)

1. Open HQ Rental Software
2. Review: Maintenance Requests, Pending Maintenance, Repair Orders
3. Confirm accuracy of scheduled dates, notes and descriptions
4. If no action required, continue monitoring
5. If maintenance due or overdue, proceed to Step 3 or 4

### Step 3: Proactive Alert Handling (Autonomous Decision Rules)

**A. Diagnostic Routing Rules:**

| Code/Alert | Action |
|-----------|--------|
| **P0420 (Catalytic Converter)** | Flag, notify Fleet Manager, create GHL task, route to King Berk Auto Center |
| **All other alerts** | Route directly to Santa Tire Depot (95-99% of cases) |

**B. Internal Summary:** Prepare short summary including vehicle name, issue type, Bouncie screenshot, recommended next step.

**C. Notifications (Required in Two Ways):**
1. Send internal notification via Telegram
2. Create GoHighLevel task with: Issue details, assigned owner, due date, status tracked until complete

### Step 4: Mechanic Coordination

1. Contact the appropriate mechanic (Santa Tire Depot primary, King Berk backup)
2. Confirm availability
3. Provide vehicle details and issue description
4. Schedule service
5. Update HQ Rental Software with appointment details
6. Notify renter of scheduled maintenance

**Payment Handling:**

| Mechanic | Payment Method |
|----------|---------------|
| **Santa Tire Depot** | Account on file, invoiced on backend |
| **King Berk Auto Center** | Payment by Manager on Duty (Dos) via credit card |
| **Out-of-Network Emergency** | Authorized up to $100 max, minor repairs only |

### Step 5: Renter-Reported Issues (Calls or Texts)

1. Acknowledge renter message immediately
2. Identify issue type:
   - Vehicle drivable → proceed with mechanic scheduling
   - Vehicle not drivable / breakdown → proceed to Step 6
3. Route to Santa Tire Depot by default
4. If Santa Tire unavailable → King Berk Auto Center backup
5. If P0420 code → route directly to King Berk
6. Payments at King Berk handled by Manager on Duty (Dos) via company credit card
7. For out-of-network mechanics → coordinate with Dos before approval
8. Confirm appointment details with renter

**Common Exception — Coolant Issues (common in summer):**
- Renter may be instructed to buy coolant temporarily
- Renter will be reimbursed
- Vehicle must still go to Santa Tire Depot

### Step 6: Roadside Assistance (AAA)

1. Go to https://roadside.aaa.com
2. Enter AAA Member Number first, then member name
3. If card is invalid or benefits exhausted → try a different AAA card
4. Select Tow (preferred option)
5. Enter vehicle details (basic only)
6. Confirm vehicle location (use Bouncie app if renter is unsure)
7. Tow destination: Santa Tire Depot (preferred)
8. Contact phone number: RingCentral number **302-596-8635** — answer neutrally (do not identify as LA Elite Rentals)
9. Monitor until driver is dispatched and renter is informed
10. Log outcome and update GoHighLevel task

### Step 7: Activity, Location, and Geofence Monitoring

1. Confirm each vehicle is within Southern California and has an active geofence set
2. Review last activity timestamp
3. If no activity in 24 hours:
   - Check vehicle location in Bouncie
   - Google address for impound lot indicators
   - Contact renter to confirm status
4. If unresolved by end of shift → Notify Fleet Manager, create GoHighLevel task

### Step 8: Maintenance Reminders to Renters

- Send reminder 7 days before scheduled maintenance
- Send follow-up reminder 1 day before
- Use approved templates
- Confirm renter acknowledgment

### Step 9: Reporting & Ongoing Visibility

**On the 1st and 15th of every month:**
- Compile maintenance summary: Vehicles due, vehicles serviced, open/pending issues
- Send report internally for visibility

**Daily:**
- Send brief internal updates for same-day or urgent maintenance actions

### Step 10: Tracker & Geofence Oversight (FYI Monitoring)

**If vehicle missing from Bouncie or lacks tracker:**
- Notify on-ground team
- Create GHL task with clear notes (vehicle, issue, date, action taken)

**If geofence alerts trigger:**
- Flag immediately, escalate internally
- Notify via Telegram
- Create GHL task, add notes, track until resolved

> Note: Admins do not install trackers, but must flag gaps promptly.

---

## Expected Output

- Maintenance issues identified early and routed autonomously
- Vehicles serviced with minimal downtime
- Fleet Manager involvement limited to exceptional cases
- All issues logged, tracked, and closed through GoHighLevel
- Renters informed clearly and consistently
- Fleet visibility maintained through structured reporting
