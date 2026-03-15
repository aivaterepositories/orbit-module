# 📋 Cob → Fiona: Salesforce Integration Blockers
**Date:** 2026-03-15
**From:** Cob
**To:** Fiona
**Re:** TPS — Salesforce ↔ CRM Integration (Closed Won trigger + field mapping)

---

Hey Fiona,

Starting the Salesforce integration work now. Before I can build the Closed Won → CRM trigger and field mapping, I need the following confirmed. Please review and push back your answers when you can.

---

## 1. ~~Salesforce API Access~~ ✅ RESOLVED

Cob met with Chris on 2026-03-15 and obtained Salesforce API credentials directly (Instance URL, Client ID, Client Secret). This is unblocked.

---

## 2. Closed Won → CRM Trigger — Confirm the Flow

The spec says Closed Won deals should add data to the CRM. I need to confirm exactly how this should work:

- [ ] **Does a Closed Won deal create a NEW Job in the CRM?** Or does it update an existing one that was already manually created?
- [ ] **Is there already a CRM Job ID → Salesforce Opportunity ID mapping table?** If yes, where? If no, I'll need to build one.
- [ ] **Should this be a real-time webhook** (Salesforce pushes to CRM the moment a deal is marked Closed Won), or a **scheduled sync** (e.g., every 15–30 minutes)?
- [ ] **Who in Salesforce will be marking deals as Closed Won?** (Chris? Wayne? Jeff?) — Helps me understand volume and frequency.

---

## 3. Salesforce Field Mapping — Account + Opportunity → CRM Project

I need a confirmed list of which Salesforce fields map to which CRM fields. Can you pull up a sample **Closed Won Opportunity** in Salesforce and confirm the following?

| # | Salesforce Field | CRM Field | Confirmed? |
|---|-----------------|-----------|------------|
| 1 | Opportunity Name | Job Name | ⬜ Confirm |
| 2 | Opportunity ID | SF Opportunity ID (mapping key) | ⬜ Confirm |
| 3 | Amount / Contract Amount | Job Contract Amount (Sales Summary) | ⬜ Confirm |
| 4 | Account Name | Client Name on Job Card | ⬜ Confirm |
| 5 | Close Date | Job reference date | ⬜ Confirm |
| 6 | Owner (Sales Rep) | Assigned Sales Rep in CRM | ⬜ Confirm |
| 7 | *(TBD — from Account)* | Site Address / Job Location | ⬜ What field? |
| 8 | *(TBD — from Account)* | POC Name / Contact | ⬜ What field? |
| 9 | *(TBD — from Account)* | Phone / Email | ⬜ What field? |

> **What I need from you:** Screenshot or export of a real Closed Won opportunity in Salesforce showing all visible fields. Even a quick Loom walkthrough works. This is the fastest way for me to finalize the mapping without going back and forth.

---

## 4. Change Order → Salesforce Update (Separate but Related)

Per the spec, when a Change Order reaches Stage 4, the CRM should update the parent Salesforce opportunity's contract amount. Quick questions:

- [ ] **What is the exact field name in Salesforce** for the contract amount? (e.g. `Amount`, `Contract_Value__c`, custom field?)
- [ ] **Should the CO note/activity be logged on the Salesforce Opportunity?** Per spec: yes — just confirming this is still the case.

---

## Summary — What I Need From You

| Item | Format | Urgency |
|------|--------|---------|
| ~~Salesforce API credentials~~ | ✅ Resolved — Cob has these | — |
| Confirm Closed Won trigger flow (questions above) | Reply in this file or message me | 🔴 Critical |
| Salesforce field mapping screenshot/Loom | Loom or screenshot | 🔴 Critical |
| Contract amount field name in Salesforce | Quick reply | 🟡 High |
| Confirm CO note/activity logging | Quick reply | 🟡 High |

---

Once I have these, I can finalize the integration design and start building. The data fetch from Salesforce is already done — this mapping + trigger confirmation is the last piece blocking me.

— Cob

---
*Synced via orbit-sync.sh | Pull latest: `./orbit-sync.sh pull`*
