# Temp Power Systems - CRM Demo Meeting Notes
## February 5, 2026

**Attendees:** Fiona (PM), Chris Yates (Client)
**Duration:** ~1 hour 16 minutes
**Purpose:** CRM walkthrough and feature review

---

## Meeting Summary

Fiona walked Chris through the CRM simulator, covering:
- Dashboard and metrics
- Job pipeline and stages
- Job card sections (Sales Summary, Contracts & Compliance, Accounting, Permits, Tasks)
- Change Order workflow
- Materials & Work Order Builder
- Work Order Calendar
- People Management

**Crew Portal NOT covered** - deferred to next meeting with Wayne.

---

## 🚨 Critical Gap Identified

### Materials ↔ Work Orders Link Missing

**Problem:** Mark (shop/production) cannot see what materials are needed for each work order.

**Chris's Use Case:**
> "So Mark comes in on Monday and he's trying to figure out what his work schedule is. He's preparing for all the work orders that are scheduled for this week. How does he see that?"

> "So he sees the jobs on the calendar, but how does he double check that he's got everything prepared for them to take out to that job?"

**Impact:**
- Mark can't prep materials for the week's work orders
- Crew members don't know what to load on their truck
- This is "the part that makes a job fail or succeed" per Chris

**Solution Required:**
1. Link materials to specific work orders in the Materials Builder
2. Add a "Work Order" column showing which WO each material is assigned to
3. When viewing a work order, display the linked materials list
4. Crew members see their materials when they click into their assigned work order

---

## ✅ Features Confirmed (No Changes Needed)

| Section | Status |
|---------|--------|
| Dashboard - 4 metric boxes (SOV, Remaining to Bill, Retention, Reconciliation) | ✅ Good |
| Job Pipeline (Got Job → Get Ready → Execution → Maintenance → Removal → Archive) | ✅ Good |
| Search/Filter by project name, client, project manager | ✅ Good |
| Add New Job (manual entry option) | ✅ Good |
| Sales Summary (auto-populated from Salesforce) | ✅ Good |
| Red Tag / Service Suspension | ✅ Good |
| PDF Export - Job Card | ✅ Good |
| Change Order Workflow | ✅ Good |
| Contracts & Compliance | ✅ Good |
| Accounting & Deposits | ✅ Good |
| Permits & Utilities | ✅ Good |
| Task Management | ✅ Good |
| Schedule of Values | ✅ Good |
| Work Order Creation | ✅ Good |
| Work Order Calendar | ✅ Good |
| Billing Schedule View | ✅ Good |
| People Management | ✅ Good |

---

## 🔧 MARKY - Development Tasks

### ✅ ALL 4 TASKS COMPLETED - AWAITING FIONA REVIEW

| # | Task | Priority | Status | Notes |
|---|------|----------|--------|-------|
| 1 | **Implement notification bell** for task assignments and @mentions | HIGH | ✅ COMPLETED | Add to profile/header area in CRM |
| 2 | **Link materials to work orders** - create relation | CRITICAL | ✅ COMPLETED | Materials must be associated with specific work orders |
| 3 | **Add "Work Order" column in Materials Builder** | CRITICAL | ✅ COMPLETED | Shows which WO each material/equipment is needed for |
| 4 | **Show materials list in Work Order detail view** | CRITICAL | ✅ COMPLETED | Crew needs to see what to load on truck |

**COMPLETED BY:** Marky
**COMPLETED DATE:** 2026-02-05
**NEXT STEP:** 🔴 **FIONA - REVIEW REQUIRED** - Please validate all 4 tasks before Monday demo

---

## 📋 FIONA - Coordination Tasks

| # | Task | Status | Notes |
|---|------|--------|-------|
| 1 | Schedule Monday 2 PM call with Chris + Wayne | ⏳ To Do | Pilot walkthrough + Crew Portal review |
| 2 | Push/commit this update so Marky has visibility | ⏳ To Do | This document |
| 3 | 🔴 **REVIEW Marky's 4 completed tasks** | ⏳ URGENT | Notification bell, Materials ↔ WO link, WO column, Materials in WO view |

### 🚨 FIONA ACTION REQUIRED
Marky has completed all 4 development tasks from the Feb 5 demo. Please review and validate before the Monday meeting with Chris + Wayne.

---

## 📅 Monday Session Agenda (Feb 10, 2026 @ 2 PM)

**Attendees:** Chris, Wayne, Fiona

| # | Item | Owner |
|---|------|-------|
| 1 | Pilot walkthrough with 2-3 real jobs (end-to-end) | Chris + Wayne + Fiona |
| 2 | Review Crew Member Portal | Fiona (demo) |
| 3 | Prepare pilot test scenarios | Together during call |
| 4 | Decide data migration strategy for 260 active jobs | Chris + Wayne |
| 5 | Identify jobs for pilot | Chris + Wayne |

---

## 🔄 Data Integration Notes

| Topic | Answer |
|-------|--------|
| **New Got Jobs** | Auto-pulled from Salesforce (trigger: Got Job stage) |
| **Existing Jobs** | Must be manually entered into CRM |
| **~260 Active Jobs** | Chris/Wayne to decide: full migration vs. SOV only |
| **Rentals** | Not tracked in CRM - stays in QuickBooks |

---

## User Account Setup Process (Confirmed)

1. Aivate sets up admin accounts for all users
2. Client provides: Full name + Email address
3. Aivate creates: Username + Password
4. Users can edit their profile after first login
5. Future: May onboard someone from TPS team to create users internally

---

**Meeting Notes By:** Nova (Project Coordinator)
**Last Updated:** 2026-02-05
