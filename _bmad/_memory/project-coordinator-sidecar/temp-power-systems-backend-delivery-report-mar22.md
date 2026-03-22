# Temp Power Systems — Backend Delivery & Testing Report

**Prepared by:** Cob Bautista (Lead Developer)
**Documented by:** Nova (Project Coordinator)
**Date:** March 22, 2026
**Scope:** All backend tasks delivered this session (Mar 22, 2026)
**Status:** ✅ ALL 6 BACKEND TASKS COMPLETE — Task #7 deferred to post-pilot

---

## Summary

Cob completed all 6 remaining backend tasks for the Temp Power Systems CRM. The live SF → Supabase pipeline is fully operational with 2,342 real SF records backfilled. The CRM is now running on real data.

---

## 1. Tasks Delivered

| # | Task | Priority | Status |
|---|------|----------|--------|
| 1 | CO Parent/Child Logic | 🔴 HIGH | ✅ COMPLETE |
| 2 | SOV Backend Validation | 🔴 HIGH | ✅ COMPLETE |
| 3 | SF Contact Roles (POC Contacts) | 🟡 MED | ✅ COMPLETE |
| 4 | Multi-Crew Timestamps Per WO | 🟡 MED | ✅ COMPLETE |
| 5 | Sitemap Field Auto-Populate Cascade | 🟡 MED | ✅ COMPLETE |
| 6 | SF Permit Fields (iPermit + Dig Alert) | 🟡 MED | ✅ COMPLETE |
| 7 | Task Automation Engine | 🔵 LOW | ⏸ DEFERRED — Post-pilot |

---

## 2. Task Implementation Details

### Task 1 — CO Parent/Child Logic
**File:** `api/webhooks/salesforce-job.ts`

- When an inbound SF opportunity has a `ParentId`, the webhook does NOT create a new job card
- Instead, it creates a Change Order record attached to the parent job (`changeOrders[]` array)
- Lookup: find parent job by `salesforce_opportunity_id` matching the incoming `ParentId`
- Prevents duplicate job cards for child CO opportunities in Salesforce
- If no parent job found → falls back to creating a standalone card (edge case protection)

---

### Task 2 — SOV Backend Validation
**File:** `api/jobs/update.ts`

- Before saving a Schedule of Values, validates that all phase amounts sum to `contractAmount`
- If validation fails: returns 400 with error message — blocks save
- CO edge case handled: validation uses the cumulative contract amount (original + all change orders)
- Frontend already blocks via UI; backend is the authoritative guard

---

### Task 3 — SF Contact Roles (POC Contacts)
**Integration:** Zapier v5 (Find Contact step)

- Zapier `Find Contact` step pulls POC contacts from the SF opportunity at trigger time
- Contact data (name, email, phone) included in the webhook payload to `/api/webhooks/salesforce-job`
- Mapped to `contacts[]` array in `jobs.data` JSONB
- Populates the POC dropdown in Marky's WO creation form (data source now available)

---

### Task 4 — Multi-Crew Timestamps Per Work Order
**Files:** `api/work-orders/clock-in.ts`, `api/work-orders/clock-out.ts`

- Two new API endpoints:
  - `POST /api/work-orders/clock-in` — writes `time_in` to `crew_time_logs`
  - `POST /api/work-orders/clock-out` — writes `time_out` to `crew_time_logs`
- `hours_worked` is auto-calculated as a generated column in Supabase — no manual calculation
- Each crew member on a WO records their own independent time in / time out
- Frontend clock-in/out UI is Marky's responsibility

**Table:** `crew_time_logs`
```
work_order_id  UUID
crew_member_id UUID
time_in        TIMESTAMPTZ
time_out       TIMESTAMPTZ
hours_worked   NUMERIC (GENERATED ALWAYS AS EXTRACT(EPOCH FROM (time_out - time_in))/3600 STORED)
```

---

### Task 5 — Sitemap Field Auto-Populate Cascade
**File:** `api/jobs/update.ts`

- When a sitemap link is set/changed at the Job level, the cascade logic propagates the value to all child Work Orders where `siteMapLink` is null or empty
- Does NOT overwrite WOs that already have a sitemap link set
- Trigger: on job update when `siteMapLink` field is present in the update payload
- Job-level sitemap field UI is Marky's responsibility

---

### Task 6 — Salesforce Permit Fields (iPermit + Dig Alert)
**File:** `api/webhooks/salesforce-job.ts`

- Added to SF webhook field mapping:
  - `iPermit_Link__c` → `jobs.data.permitLink`
  - `Dig_Alert_Number__c` → `jobs.data.digAlertNumber`
  - `Permit_Status__c` → `jobs.data.permitStatus`
- SF cross-object report built in Salesforce to surface permit data for backfill
- Fields now surface in the Job Detail page Permits & Utilities section
- Note: Wayne provided field names — blocker resolved ✅

---

## 3. Additional Work Completed (Beyond Pending Task List)

| Item | Details |
|------|---------|
| **SF Pipeline End-to-End Fix** | Confirmed full flow: SF Closed Won → Zapier → Webhook → Supabase → Got Job column live |
| **Full History Backfill** | 2,342 real SF Closed Won records imported to Supabase via Zapier |
| **SF Cross-Object Report** | Built in Salesforce to pull permit data across related objects for backfill |
| **Server-Side Search** | `searchAllJobsInSupabase()` RPC added to DataContext — queries full history, not just 12-month window |
| **Archived Filter** | 12-month default pipeline view — avoids loading 2,095 archived records on every page load |
| **SF ID Normalization** | Fixed 15-char vs 18-char SF Opportunity ID mismatch that caused duplicate job cards |
| **Zapier v5 Published** | Zapier 5-step flow (Find Account → Find Contact → Find Permit → Webhook POST) live and active |
| **Kanban Scroll Fix** | Per-column vertical scroll fixed on Jobs pipeline view |
| **n8n WF1 Abandoned** | Zapier fully replaces n8n WF1 for SF Closed Won trigger |

---

## 4. Live SF Integration Status

**Webhook URL:** `https://[vercel-domain]/api/webhooks/salesforce-job`
**Zapier Flow (v5):**
1. Trigger: SF Opportunity Stage = Closed Won
2. Find Account → pulls `Account.Name`, billing address
3. Find Contact → pulls POC contacts (Contact Roles)
4. Find Permit → pulls `iPermit_Link__c`, `Dig_Alert_Number__c`, `Permit_Status__c`
5. Webhook POST → sends combined payload to TPS CRM webhook endpoint

**SF Fields Mapped (21 core + 3 permit):**
`Name`, `Account.Name`, `Amount`, `CloseDate`, `StageName`, `Job_Status__c`, `Job_Type__c`, `Utility_Company__c`, `Cross_Streets__c`, `City_Opp__c`, `County__c`, `State_Opp__c`, `Zip_Opp__c`, `Owner.Name`, `Description`, `Job_Notes__c`, `Customer_Code__c`, `Id`, `BillingAddress`, `ShippingAddress`, `Type`, `iPermit_Link__c`, `Dig_Alert_Number__c`, `Permit_Status__c`

---

## 5. Testing Results

| Test | Result | Notes |
|------|--------|-------|
| SF → Zapier → Webhook → Supabase | ✅ PASS | End-to-end confirmed live |
| Backfill import (2,342 records) | ✅ PASS | All records visible in correct pipeline columns |
| Dashboard — archived jobs excluded | ✅ PASS | Archive records not counted in SOV / retention / reconciliation |
| Kanban column scroll | ✅ PASS | Vertical scroll per column working |
| Server-side search (full history) | ✅ PASS | Finds archived records outside 12-month window |
| SF ID dedup (15 vs 18 char) | ✅ PASS | No duplicate cards on re-trigger |
| CO Parent/Child routing | ⏸ DEFERRED | Needs real CO opportunity in SF to test |
| SOV validation | ✅ PASS | Backend returns 400 when phases don't sum to contract amount |
| SF Contact Roles on job card | ⏸ DEFERRED | Needs new Zapier trigger run (existing backfill records don't have contacts) |
| Clock-in/clock-out endpoints | ⏸ DEFERRED | Needs Wayne to create crew members in CRM first |
| Sitemap cascade to child WOs | ⏸ DEFERRED | Needs Wayne to add work orders + set sitemap at job level |
| SF Permit fields on job card | ⏸ DEFERRED | Needs new Closed Won trigger run with permit data present in SF |

---

## 6. Deferred Items & Dependencies

| Item | Dependency | Owner |
|------|-----------|-------|
| CO Parent/Child live test | Need a real child CO opportunity in SF to trigger | Wayne / Chris |
| Contacts on job card | Need new Zapier trigger run (backfilled records don't carry contact data) | Cob to confirm on next new Closed Won |
| Clock-in/clock-out UI | Marky builds the frontend UI | Marky |
| Sitemap cascade | Marky builds job-level sitemap field; Wayne needs to add WOs | Marky + Wayne |
| SF Permit fields display | Need new Closed Won with permit fields populated in SF | Natural (next real job) |

---

## 7. What Marky Still Needs to Build

| Item | Notes |
|------|-------|
| Clock-in / clock-out UI | API endpoints are live — Marky wires up the button/timestamp UI in WO detail view |
| Job-level sitemap field UI | Backend cascade logic is live — Marky adds the input field at job card level |
| Fiona's 4 revision re-review | Pushed to new repo Mar 15 — Fiona must approve before next Wayne/Chris demo |

---

## 8. What's Blocking the Next Demo

| Blocker | Owner | Status |
|---------|-------|--------|
| Fiona re-review of Marky's 4 revisions (pushed Mar 15 to new repo) | Fiona | 🔴 Pending |
| SF Permit field names from Wayne | Resolved ✅ | Done |

---

## 9. Live Pipeline Count (March 22, 2026 — Supabase)

| Column | Count | SF Status |
|--------|-------|-----------|
| **Got Job** | 3 | Brand new Closed Won — no `Job_Status__c` set yet |
| **Get Ready** | 20 | `Active - Pending Scheduling` |
| **Executions** | 167 | `Active` or `Change Order` |
| **Maintenance** | 8 | `Service Suspension` |
| **Removal** | 49 | `Finished` |
| **Archived** | 2,095 | `Cancelled` — historical records |
| **Total** | **2,342** | Full SF backfill confirmed |

---

## 10. Next Steps

| Priority | Action | Owner |
|----------|--------|-------|
| 🔴 IMMEDIATE | Fiona reviews Marky's 4 revisions (new repo) | Fiona |
| 🟡 HIGH | Marky builds clock-in/out UI + job-level sitemap field | Marky |
| 🟡 HIGH | Schedule next demo with Wayne/Chris once Fiona approves | Fiona |
| 🔵 LOW | Task Automation Engine (post-pilot) | Cob — future sprint |

---

**Report prepared by:** Cob Bautista
**Documented by:** Nova
**Date:** March 22, 2026
