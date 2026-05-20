# TPS CRM — Critical Fixes for Jacob (Pre-Audit)

**Created:** 2026-05-09
**Created by:** Nova (on behalf of Fiona)
**Source:** Fiona's screen share / Loom video transcripts (3 videos) + May 8 strategy call with Angela & Chris
**Deadline:** Before Sunday audit meeting (Fiona-Jacob audit). Fixes also needed before Tuesday 8am PT follow-up session with Angela & Chris.
**Priority:** ALL CRITICAL — Client satisfaction at risk

---

## Screen Recordings (Jacob: Watch ALL of these)

1. **Dashboard errors + Contracts & Compliance bugs:** https://www.loom.com/share/f7d70674aaa9497fb874fc13ee5404f2
2. **Sale Summary + Schedule of Value bugs:** https://www.loom.com/share/f94f143f73814f43aabafa7ef8904389
3. **Additional SOV + Contracts fixes:** https://www.loom.com/share/332f1abd53bf498cba91467a20e6829e

---

## Context

Fiona recorded screen share videos documenting critical bugs and UX issues in the TPS CRM. These fixes MUST be completed before Sunday so Fiona can audit them during her meeting with Jacob. If not resolved, the clients will be left very unhappy with the entire CRM buildout. These issues span four areas: Dashboard Data, Contracts & Compliance, Schedule of Value, and Sale Summary.

**ADDITIONAL URGENCY — May 8 Strategy Call with Chris & Angela:**
During a live 1:1 strategy call on May 8, Chris and Angela attempted to enter SOV data into the CRM for real jobs. They hit the SOV deletion bug (4.2) and auto-calculation bug (4.1) LIVE. Chris's exact words: "That we can't do this. No way." and "we'll just waste hours" and "every time we change something or go someplace that it's going to erase everything we just did." The session had to be cut short because the bugs made data entry impossible. They also confirmed contract amount discrepancies between Salesforce and the CRM (e.g., La Sierra showing $76,140 in CRM vs $78,650 in Salesforce). Chris has scheduled a follow-up session for **Tuesday May 13 at 8:00 AM PT** to continue SOV entry — these fixes MUST be working by then or the client will lose more time and confidence.

---

## SECTION 1: DASHBOARD — Salesforce Job Count Mismatch

**Priority: CRITICAL**
**Impact: Data integrity — CRM is showing incorrect totals**

| # | Issue | Expected | Actual |
|---|-------|----------|--------|
| 1.1 | Total number of jobs on dashboard | 289 (per Salesforce) | 250 |
| 1.2 | Reconciliation status job count | 289 | Mismatched (not 289) |
| 1.3 | Contract amount vs build project count | 289 | 201 |
| 1.4 | Jobs section category totals | Should sum to 289 | Categories (6, 20, 1, 67, 8, 49) may not total correctly |

**Root Cause:** Not all active jobs from Salesforce migrated to the CRM. There is a discrepancy — jobs are missing from the migration.

**Confirmed in May 8 call:** Chris and Angela also found contract amount discrepancies on individual jobs (e.g., La Sierra: CRM shows $76,140 but Salesforce shows $78,650 — a $2,510 difference). Angela believes this is because Salesforce amounts were updated after the initial migration (revisions to proposals), and the CRM did not capture the updates. This may also explain the total count discrepancy.

**Fix Required:**
- Investigate why only 250 (or 201) jobs are captured vs 289 in Salesforce
- Identify the missing jobs and ensure they sync/migrate
- All dashboard counts (total jobs, reconciliation status, contract amount vs build) must reflect the true Salesforce count of 289 active jobs
- Verify that the jobs section category breakdown totals match the overall count
- Investigate whether contract amounts are being synced on an ongoing basis or only at initial migration — amounts that change in Salesforce after migration should update in the CRM

---

## SECTION 2: CONTRACTS & COMPLIANCE

**Priority: CRITICAL**
**Impact: UX broken, data loss on delete, session persistence failure**

### 2.1 — Remove Compliance Package Field
- The "Compliance Package" field in the Contracts & Compliance section is no longer needed
- **Action:** Delete/remove this field entirely

### 2.2 — Remove Contract Document Section (Bottom)
- The "Contract Document" section at the bottom of Contracts & Compliance is no longer needed
- **Action:** Delete/remove this section entirely

### 2.3 — File Name Text Overflow (UX Bug)
- When a file is uploaded, the file name text extends beyond the Contracts & Compliance section box
- User has to zoom out to read the full file name
- **Fix:** Either (a) wrap the text so it stays within the section box, or (b) enlarge the section to accommodate longer file names. Text wrapping is preferred.

### 2.4 — Delete Button Not Visible at 100% Zoom
- The delete button for uploaded files goes outside the Contracts & Compliance section box
- At 100% zoom, the button is not visible/clickable
- **Fix:** Ensure the delete button is always visible and accessible within the section box at 100% browser zoom

### 2.5 — Deleted Document Still Displays Until Page Reload
- After clicking "delete" and confirming, the document still appears in the UI
- It only disappears after a full page reload
- **Fix:** After successful deletion, immediately remove the document from the UI without requiring a page refresh (optimistic UI update or re-fetch)

### 2.6 — Page Refresh Forces Re-Login (Session Persistence)
- When the page is reloaded, the user is kicked back to the login screen
- They have to sign in again and navigate all the way back to where they were
- **Fix:** Maintain session persistence across page refreshes. User should return to the same page they were on.
- **NOTE:** This was also flagged in the May 6 email to Jacob as issue #3. Still not fixed.

### 2.7 — Make Section Scrollable
- The Contracts & Compliance section needs to be scrollable
- Anticipate 15-20 files per opportunity — the section will get cluttered
- **Fix:** Set a fixed height for the section and make the content scrollable. The section size should remain consistent regardless of how many files are added.

---

## SECTION 3: SALE SUMMARY

**Priority: CRITICAL**
**Impact: Inconsistent UI, missing edit functionality**

### 3.1 — Replace "Change Order" Button with "Edit" Button
- The Sale Summary section currently has a "Change Order" button
- This should be replaced with an "Edit" button — consistent with the Contracts & Compliance, Accounting & Deposits, and Permits & Utility sections that all have their own Edit buttons
- **Fix:** Remove the "Change Order" button. Add an "Edit" button that, when clicked, opens the Sale Summary edit popup (same pattern as the other sections)

---

## SECTION 4: SCHEDULE OF VALUE

**Priority: CRITICAL (HIGHEST)**
**Impact: Data loss, calculation errors — will cause major problems for clients**

### 4.1 — Real-Time Auto-Calculation Creates Errors During Input
- When entering a dollar amount in a schedule of value row, the "unbalanced amount" recalculates with every keystroke
- Example: Contract is $4,795. User enters "3" — unbalanced immediately shows $4,792 (deducting $3). User enters next digit "7" making "37" — unbalanced shows $4,758. This continues with every digit.
- This is extremely confusing, especially for TPS's users who are not tech-savvy
- **Fix:** Do NOT auto-calculate the unbalanced amount in real-time during input. Keep the unbalanced amount static at its current value until the user finishes entering numbers and saves. Recalculate only on save/blur (when the input field loses focus or the form is saved).

### 4.2 — Changing Contract Value Deletes All SOV Line Items (MOST CRITICAL)
- When the contract value is changed (e.g., from $4,795 to $5,000 due to a change order), ALL existing schedule of value line items (phases/rows) are deleted
- This is the single most critical bug. Clients will lose all their SOV data whenever a contract amount changes.
- **Fix:** Changing the contract value must NEVER delete existing SOV line items. When contract value changes:
  - Keep all existing phases/rows/line items intact
  - Update only the contract value display
  - Recalculate the unbalanced amount (contract value minus sum of existing line items)
  - Recalculate "remaining to bill" accordingly
- Jacob: If there's a technical reason this is happening (e.g., the SOV is re-initialized when contract value changes), please propose a resolution. But at minimum, line items must be preserved.

---

## SECTION 5: ACCOUNTING & DEPOSITS

**Priority: HIGH**
**Impact: Unnecessary UI clutter**

### 5.1 — Remove Accounting Documents Upload Section
- The "Accounting Documents" upload field in the Accounting & Deposits section is no longer needed
- Same reasoning as the Contracts section removals (2.1 and 2.2)
- **Action:** Delete/remove this field entirely

---

## PRIORITY RANKING (Fix Order Recommendation)

| Priority | Item | Section | Why |
|----------|------|---------|-----|
| 1 | 4.2 — SOV line items deleted on contract change | Schedule of Value | **DATA LOSS** — destroys client work |
| 2 | 1.1-1.4 — Salesforce job count mismatch | Dashboard | **DATA INTEGRITY** — 39 jobs missing |
| 3 | 4.1 — Auto-calc during input | Schedule of Value | **USABILITY** — causes input errors |
| 4 | 2.6 — Session persistence (re-login on refresh) | Contracts & Compliance | **UX BLOCKER** — repeated from May 6 email |
| 5 | 2.5 — Deleted doc still displays | Contracts & Compliance | **UX BUG** — confuses users |
| 6 | 3.1 — Change Order to Edit button | Sale Summary | **UI CONSISTENCY** |
| 7 | 2.3 — File name text overflow | Contracts & Compliance | **UX BUG** |
| 8 | 2.4 — Delete button not visible | Contracts & Compliance | **UX BUG** |
| 9 | 2.7 — Scrollable section | Contracts & Compliance | **UX IMPROVEMENT** |
| 10 | 2.1 — Remove compliance package field | Contracts & Compliance | **CLEANUP** |
| 11 | 2.2 — Remove contract document section | Contracts & Compliance | **CLEANUP** |
| 12 | 5.1 — Remove accounting documents upload | Accounting & Deposits | **CLEANUP** |

---

## TOTAL: 12 Fixes

- **CRITICAL (must fix before Sunday):** Items 1-8
- **HIGH (should fix before Sunday):** Items 9-12

---

## NOTES FOR JACOB

1. Fiona will audit ALL of these fixes during the Sunday meeting. Every item will be checked.
2. The session persistence issue (2.6) was already flagged in the May 6 urgent email. This is the second time it's being raised.
3. The SOV data loss bug (4.2) is the most dangerous issue — if this goes to production, clients will lose their billing schedule data every time a contract changes. This must be the #1 priority. Chris experienced this live on May 8 and said "there's no way" they can work like this. The entire strategy session had to be cut short.
4. The auto-calculation bug (4.1) was also experienced live by Chris on May 8. His words: "you have to write it down before you put numbers in there because when I write a five, watch that number unbalanced. It changes it. So that could be the cause of a lot of mistakes." The recommended fix is to calculate on blur/save rather than on each keystroke — this is standard UX for financial input fields.
5. The Salesforce migration gap (Section 1) means 39 jobs are unaccounted for. This needs investigation — are they failing to sync, or is there a filter excluding them? Additionally, contract amounts that changed in Salesforce after initial migration are not reflected in the CRM (confirmed: La Sierra is off by $2,510).
6. Chris has a follow-up SOV data entry session scheduled for **Tuesday May 13 at 8:00 AM PT** with Fiona and Angela. All SOV-related fixes (4.1 and 4.2) are blocking that session.
7. Chris plans to have Angela enter SOV data for ALL 289 jobs. These bugs will multiply across every single entry if not fixed.

---

**Document created by Nova — Project Coordinator**
**On behalf of Fiona**
