# Email Draft — Jacob CRM Fixes Round 2 (URGENT)

**To:** Jacob
**CC:** Marky (mark@aivate.net)
**From:** Fiona
**Subject:** URGENT — 12 Critical CRM Fixes Before Sunday Audit
**Status:** DRAFT — Awaiting Fiona's approval

---

Hi Jacob,

This is a follow-up to my May 6 email. I've completed another round of auditing and I also had a live strategy call with Chris and Angela yesterday (May 8) where we attempted to use the CRM for actual SOV data entry. The session had to be cut short because of bugs. I need you to watch the three screen recordings below, read through every issue listed in this email, and get these fixed before our Sunday audit.

**Watch all three recordings:**
1. Dashboard errors + Contracts & Compliance bugs: https://www.loom.com/share/f7d70674aaa9497fb874fc13ee5404f2
2. Sale Summary + Schedule of Value bugs: https://www.loom.com/share/f94f143f73814f43aabafa7ef8904389
3. Additional SOV + Contracts fixes: https://www.loom.com/share/332f1abd53bf498cba91467a20e6829e

Here are the 12 issues, in priority order.

---

**FIX #1 (MOST CRITICAL) — Schedule of Value: Changing contract value deletes all SOV line items**

When the contract value is changed in the sales summary (e.g., from $4,795 to $5,000), ALL existing schedule of value line items get wiped out. Every phase, every row — gone. Chris and Angela hit this live yesterday. Chris said, "That we can't do this. No way," and "we'll just waste hours because every time we change something it's going to erase everything we just did." We had to stop the session.

This is the single most dangerous bug in the CRM right now. Angela is supposed to enter SOV data for all 289 jobs. If this isn't fixed, every time a contract amount changes, she loses all her work.

Fix: Changing the contract value must never delete existing SOV line items. Only update the contract value, recalculate the unbalanced amount, and recalculate remaining to bill. Keep all existing phases and rows intact.

**FIX #2 (CRITICAL) — Dashboard: Salesforce job count mismatch**

The dashboard shows 250 total jobs. Salesforce has 289 active jobs. That's 39 jobs missing from the CRM. The reconciliation status is also mismatched, and the contract amount vs. build section shows only 201 projects. The jobs section category breakdown (6, 20, 1, 67, 8, 49) doesn't appear to total correctly either.

On top of the count issue, individual job amounts are wrong. For example, La Sierra shows $76,140 in the CRM but $78,650 in Salesforce — a $2,510 difference. Angela confirmed this is because the proposal was revised after the initial migration, and the CRM didn't capture the update.

Fix: Investigate why 39 jobs are missing. Ensure all 289 active jobs from Salesforce are in the CRM. All dashboard counts must match. Also investigate whether contract amounts are syncing on an ongoing basis or only at initial migration — post-migration changes in Salesforce need to be reflected.

**FIX #3 (CRITICAL) — Schedule of Value: Auto-calculation during input causes errors**

When entering a dollar amount in the SOV, the unbalanced amount recalculates with every single keystroke. So if the unbalanced is $3,795 and the user types "3", it immediately shows $3,792. Then they type "7" making "37", and it shows $3,758. This creates confusion and mistakes — especially for the TPS team who are not used to this kind of tool. Chris called it out yesterday: "You have to write it down before you put numbers in there because when I write a five, watch that number unbalanced. It changes it. So that could be the cause of a lot of mistakes."

Fix: Do not auto-calculate during input. Keep the unbalanced amount static until the user saves or leaves the field (on blur or on save). This is standard practice for financial input fields.

**FIX #4 (CRITICAL) — Page refresh forces re-login**

This was already flagged in my May 6 email as issue #3. It is still not fixed. When anyone refreshes the page, they get kicked back to the login screen. They have to sign in again and navigate all the way back to where they were. During the audit, I had to re-login and click through multiple screens just to get back to the same job card.

Fix: Maintain session persistence across page refreshes. The user should stay logged in and return to the same page.

**FIX #5 (CRITICAL) — Deleted document still displays until page reload**

After deleting a document in Contracts & Compliance and confirming the deletion, the document still shows in the UI. It only disappears after a full page reload — which then triggers the re-login issue above. So to actually see a file get deleted, the user has to reload, re-login, navigate back, and then confirm it's gone.

Fix: After successful deletion, immediately remove the document from the UI without requiring a page refresh.

**FIX #6 (CRITICAL) — Sale Summary: Replace "Change Order" button with "Edit" button**

The Sale Summary section has a "Change Order" button. This should be replaced with an "Edit" button, matching the pattern used in Contracts & Compliance, Accounting & Deposits, and Permits & Utility sections. The Edit button should open the Sale Summary edit popup, same as the other sections.

**FIX #7 (CRITICAL) — Contracts & Compliance: File name text overflow**

When a file is uploaded, the file name text extends beyond the Contracts & Compliance section box. I have to zoom out just to read it. The text needs to wrap within the section boundaries.

Fix: Apply text wrapping (overflow-wrap / word-break) to file names so they stay within the section box.

**FIX #8 (CRITICAL) — Contracts & Compliance: Delete button not visible at 100% zoom**

The delete button for uploaded files extends outside the Contracts & Compliance section box. At 100% browser zoom, the button is not visible or clickable.

Fix: Ensure the delete button is always visible and accessible within the section box at standard zoom.

**FIX #9 (HIGH) — Contracts & Compliance: Make section scrollable**

We anticipate 15 to 20 files per opportunity in this section. Right now, adding more files makes the section grow and the page look cluttered.

Fix: Set a fixed height for the Contracts & Compliance section and make the content scrollable. The section size should remain consistent regardless of how many files are added.

**FIX #10 (HIGH) — Contracts & Compliance: Remove Compliance Package field**

The "Compliance Package" field is no longer needed. Remove it entirely.

**FIX #11 (HIGH) — Contracts & Compliance: Remove Contract Document section**

The "Contract Document" section at the bottom of Contracts & Compliance is no longer needed. Remove it entirely.

**FIX #12 (HIGH) — Accounting & Deposits: Remove Accounting Documents upload**

The "Accounting Documents" upload field in the Accounting & Deposits section is no longer needed. Remove it entirely.

---

**Deadlines:**

- Sunday — I will audit every single one of these 12 items during our meeting. Each one will be tested.
- Tuesday, May 13 at 8:00 AM PT — I have a follow-up SOV data entry session scheduled with Chris and Angela. Fixes #1 and #3 (both SOV-related) MUST be working by then. If they're not, we'll have to cancel or cut the session short again, and that directly impacts the client's confidence in this project.

**Why this matters:**

Chris plans to have Angela enter SOV data for all 289 active jobs. These bugs will multiply across every single entry if they're not resolved. We are weeks away from go-live. The client's team is actively trying to use this tool and running into walls. Every broken session erodes their trust in the system we built.

Fixes #1 through #8 are critical and must be done before Sunday. Fixes #9 through #12 are high priority and should also be done before Sunday if possible.

Please confirm once you've reviewed this and let me know your plan for getting through these.

Thank you,
Fiona
