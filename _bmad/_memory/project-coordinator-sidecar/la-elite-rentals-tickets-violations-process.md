# LA Elite Rentals — Tickets & Violations Process

**Source:** Fiona's process document (Scale Virtually)
**Added:** 2026-02-26
**Reference for:** Workflow 1.4 (Post-Pickup Welcome Kit), VA Operations

---

## Introduction

The Ticket and Violations Process is designed to streamline the identification, recording, and resolution of traffic and parking citations incurred by renters. Proper management is critical to ensure timely payments, avoid registration blocks, and maximize the recovery of fine amounts from renters before they return the vehicle.

**Goals:**
- Capture every violation within 24 hours of receipt
- Use active rental leverage to secure reimbursement
- Prevent late penalties and registration blocks
- Transfer liability properly when renters no longer have the vehicle
- Maintain complete documentation in HQ Rental

**Applies to:**
- Parking tickets
- Red light / speeding citations
- Bus lane / stop sign violations
- Toll violations
- Any mailed traffic-related fine

---

## Required Input

The VA must have access to:
- PhysicalAddress.com (or approved mail scanning service)
- HQ Rental Software → Fines Module
- Toll Authority Online Portal (Metro Express / LA authority: https://ladot.lacity.gov/projects/parking-in-la/pay-your-parking-citation)
- Company Payment Method (for authority payments)
- Rental Agreements in HQ
- Fleet Master List (VIN, plate, make/model)

---

## Daily Monitoring Standards

The VA must:
- Check the mail scanning service every weekday (Mon–Fri)
- Log all new violations within 24 hours of scan availability
- Monitor due dates daily
- Ensure no violation goes beyond its payment/dispute deadline

**Failure to act within deadline can:**
- Increase fine amounts
- Triple penalties
- Block vehicle registration renewal

---

## Process

### A. Mail Receipt & Identification

When a new violation scan appears, extract and record:
- Fine/Ticket Number
- Issuing Authority (ex: LA Parking Violations Bureau)
- License Plate
- Vehicle (match to fleet list)
- Date of Offense (when violation occurred)
- Date of Fine/Notice (mail issue date)
- Due Date
- Violation Type
- Amount Due
- Location of violation
- Registration expiration (if shown)

If any data is unclear → escalate immediately.

### B. Documentation in HQ Rental

1. Navigate to HQ Rental > Fines > Add Fine
2. Enter all identified details into the corresponding fields
3. Upload Attachment: Attach the scanned copy of the ticket or violation to the record
4. Add Notes: Include specific location details or any unique instructions mentioned on the ticket

### C. Toll Logic (Critical Distinction)

Not all tolls are violations.

**A. If Vehicle Has Transponder:**
1. Log into toll portal
2. Check if toll was charged normally
3. If charged:
   - Record toll amount
   - Bill renter directly in HQ
   - No violation entry needed unless penalty applied

**B. If Toll Violation Notice Was Mailed:**
- Process as normal violation (follow full workflow)

> **Note:** Normal toll may be $0.50. Violation toll may be $50–$100. Always confirm before logging as a violation.

### D. Determine Renter Status

Check rental record for Date of Offense.

**IF RENTER IS STILL ACTIVE (High Leverage Phase):**
This is the preferred scenario.
1. Contact renter immediately
2. Notify them of violation amount
3. Request immediate reimbursement
4. Add charge to their rental agreement
5. Once reimbursement is secured:
   - Pay authority directly
   - Update HQ status to Paid
   - Upload payment confirmation

> Do NOT delay while the renter still has a vehicle.

**IF RENTER HAS RETURNED VEHICLE:**
- Attempt reimbursement once
- If the renter is still active, use the "leverage" of the active rental to request immediate reimbursement

> Note: It is preferred that the renter pays the company so the company can ensure the authority is paid directly.

### E. Handling Past Renters (The Affidavit Process)

If the renter has already returned the vehicle and refuses to pay, do not pay the fine immediately.

1. **Submit Affidavit:** Locate the "Affidavit of Non-Liability" or "Rental Car Company" section on the back of the ticket
2. **Prepare Documentation:** Attach a copy of the Rental Agreement for the dates of the offense to the ticket
3. **Mail to Authority:** Use the mail service to send the completed affidavit and agreement to the issuing agency to transfer the liability into the renter's name

### F. Registration Risk Monitoring

If registration expiration is within 60 days:
- Mark fine as HIGH PRIORITY in HQ Notes
- Cross-check in Car Registration Tracker
- Ensure no unresolved tickets remain

If unpaid ticket blocks renewal:
- Escalate immediately

### G. Escalation Triggers

Escalate to Kel if:
- Fine exceeds $200
- Due date within 3 days and unresolved
- Authority requires in-person resolution
- Renter disputes aggressively
- Registration block warning appears
- Mail is unclear or incomplete

### H. Escalation and Renewal Blocks

- Cross-Check Tracker: Ensure any unpaid tickets are noted in the "Ticket Amount" column of the Car Registration Tracker
- Block Management: If a ticket remains unpaid and is blocking a registration renewal, escalate to Kel King if the amount exceeds $200

---

## Expected Output

- 100% of violations logged within 24 hours
- No missed payment deadlines
- No surprise registration blocks
- Maximum renter reimbursement recovery
- Clean HQ Fines module
- Clear documentation trail for every fine
