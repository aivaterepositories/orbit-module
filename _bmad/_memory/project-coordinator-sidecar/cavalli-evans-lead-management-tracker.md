# WePartner Commercial — Lead Management Tracker (VA Playbook)

**Prepared by:** Fiona Flynn, Process Engineer (Scale Virtually)
**Prepared for:** Nick Kavali & Shelly Evans — WePartner Commercial
**Version:** 1.0 — Draft
**Date:** March 26, 2026

---

## Purpose

This tracker is the VA's central command center for all outreach activity. Every call, email, and interaction gets logged here. Nick and Shelly should be able to open this tracker at any time and see a complete picture of where every lead stands.

**This tracker will be built as a Google Sheet or Excel file** with the following tabs and structure. This document serves as the blueprint.

---

## Tab 1: ACTIVE LEADS (Main Tracker)

This is the primary working tab. Every prospect the VA contacts lives here.

### Column Structure

| Column | Field | Description | Example |
|--------|-------|-------------|---------|
| A | **Lead ID** | Auto-incrementing unique ID | L-001 |
| B | **Date Added** | Date the lead was first contacted | 2026-04-07 |
| C | **Business Name** | Full company name | Brightline Legal Group |
| D | **Contact Name** | Decision maker or point of contact | Sarah Chen |
| E | **Title / Role** | Their position | Office Manager |
| F | **Phone** | Direct line or cell | (770) 555-1234 |
| G | **Email** | Business email | sarah@brightlinelegal.com |
| H | **Source** | Where the lead came from | Seamless.ai / Existing List / Referral / Inbound |
| I | **Lead Status** | Current classification | HOT / WARM / COOL / COLD / FUTURE / DISQUALIFIED / CLOSED-WON |
| J | **Last Contact Date** | Most recent outreach attempt | 2026-04-07 |
| K | **Last Contact Method** | Channel used | Call / Email / SMS / Voicemail |
| L | **Last Outcome** | What happened | Connected — interested, requested email / Voicemail left / No answer |
| M | **Next Follow-Up Date** | When to reach out next | 2026-04-14 |
| N | **Next Action** | What to do next | Call back / Send email / Handoff to Nick / Wait 1 month |
| O | **Cadence Stage** | Where they are in the follow-up sequence | Initial-1 / Initial-2 / Initial-3 / Weekly / Monthly / Quarterly / Future |
| P | **Suite Interest** | Which suite they expressed interest in | Suite 200 / Suite 240 / Combined / Unknown |
| Q | **Approx. Size Need** | How much space they need | ~5,000 SF / "about 20 people" |
| R | **Current Lease Status** | Their current office situation | Owns / Renting — lease expires Aug 2026 / None / Unknown |
| S | **Business Type** | What kind of business | Law firm / Insurance / Tech / Medical / Consulting |
| T | **Employee Count** | Approximate team size (if shared) | ~15 |
| U | **Call Notes** | Detailed notes from every interaction | "Spoke with Sarah, very interested in Suite 200. Their lease on Holcomb Bridge expires in August. Has 12 attorneys. Wants private offices. Asked about pricing — routed to Nick." |
| V | **Objections / Concerns** | What pushback they had | "Concerned about parking" / "Thinks Roswell is too far" / "Needs to check with partner" |
| W | **Handoff to Nick** | Has this been handed off? | Yes — [date] / No / Pending |
| X | **Nick's Follow-Up Status** | Did Nick follow up? What happened? | Called 4/8 — tour scheduled 4/12 / No response yet |
| Y | **Disqualification Reason** | Why they were closed/DQ'd (if applicable) | "Just signed 5-year lease" / "Only 2 employees, too small" / "Not in our target area" |
| Z | **Total Attempts** | Count of all outreach attempts | 3 |

### Status Definitions (for Column I — Lead Status)

| Status | Color Code | Meaning |
|--------|-----------|---------|
| **HOT** | Red | Actively interested. Handed off to Nick. |
| **WARM** | Orange | Interested but not ready. In active follow-up cadence. |
| **COOL** | Yellow | Non-committal. Will re-engage in 1 month. |
| **COLD** | Gray | Said no. Logged reason. No further action unless Nick says otherwise. |
| **FUTURE** | Blue | Has a known timeline or lease expiry. Scheduled follow-up set. |
| **DISQUALIFIED** | Dark Gray | Not a fit. Removed from active outreach. |
| **CLOSED-WON** | Green | Tour completed → Lease signed! |
| **CLOSED-LOST** | Black | Was HOT/WARM but ultimately didn't convert. |

### Cadence Stage Definitions (for Column O)

| Stage | Meaning | Next Action |
|-------|---------|-------------|
| **Initial-1** | First call made | Wait 2 days, call again |
| **Initial-2** | Second call made | Wait ~1 week, send follow-up email |
| **Initial-3** | Final email sent | Wait for response. If none → classify |
| **Weekly** | In active weekly follow-up (WARM leads) | Alternate call/email weekly for 4 weeks |
| **Monthly** | 1-month re-engagement cycle | One call + email. If no response → SMS or drop |
| **SMS** | Final SMS sent (warm leads only) | If no response → close |
| **Quarterly** | Light quarterly touch (leads with small motivation) | Email or call once per quarter |
| **Future-Scheduled** | Waiting for their lease expiry / timeline | Follow Future Lead Cadence |
| **Handed-Off** | Passed to Nick | Track Nick's follow-up |
| **Closed** | No further action | Archive |

---

## Tab 2: DAILY LOG

A simple daily activity log that feeds the daily report to Nick.

| Column | Field | Example |
|--------|-------|---------|
| A | **Date** | 2026-04-07 |
| B | **Lead ID** | L-001 |
| C | **Business Name** | Brightline Legal Group |
| D | **Contact Name** | Sarah Chen |
| E | **Action Taken** | Call — connected |
| F | **Outcome** | Hot lead — interested in Suite 200, requested tour |
| G | **Follow-Up Set?** | Yes — 4/8, confirm Nick connected |
| H | **Handoff Sent?** | Yes — emailed Nick + Shelly 10:02 AM |

---

## Tab 3: DAILY SUMMARY (Auto-Calculated)

This tab auto-calculates daily KPIs for the daily report email.

| Metric | Formula Logic | Today |
|--------|--------------|-------|
| **Total Calls Made** | Count of Daily Log entries where Action = "Call" | [#] |
| **Conversations Had** | Count where Outcome includes "connected" | [#] |
| **Voicemails Left** | Count where Outcome = "Voicemail" | [#] |
| **Emails Sent** | Count where Action = "Email" | [#] |
| **SMS Sent** | Count where Action = "SMS" | [#] |
| **HOT Leads Today** | Count of new HOT leads created today | [#] |
| **WARM Leads Today** | Count of new WARM leads created today | [#] |
| **Handoffs to Nick Today** | Count where Handoff Sent = "Yes" | [#] |

---

## Tab 4: NICK'S PIPELINE

This is a filtered view that shows ONLY leads that have been handed off to Nick. Nick uses this tab to track his own follow-ups.

| Column | Field |
|--------|-------|
| A | **Lead ID** |
| B | **Business Name** |
| C | **Contact Name** |
| D | **Phone** |
| E | **Email** |
| F | **Suite Interest** |
| G | **Handoff Date** |
| H | **VA's Summary** (from handoff email) |
| I | **Nick's Status** | Called / Emailed / Tour Scheduled / Tour Completed / Proposal Sent / Closed-Won / Closed-Lost |
| J | **Nick's Notes** |
| K | **Tour Date** (if scheduled) |
| L | **Lead Quality Rating** (1-5) — Nick rates after follow-up |

---

## Tab 5: FOLLOW-UP QUEUE

Auto-filtered view showing leads due for follow-up TODAY and THIS WEEK. This is the VA's morning check-in tab.

| View | Filter |
|------|--------|
| **Today's Follow-Ups** | Next Follow-Up Date = Today |
| **This Week** | Next Follow-Up Date = This Week |
| **Overdue** | Next Follow-Up Date < Today AND Status ≠ Closed |

Columns shown: Lead ID, Business Name, Contact Name, Phone, Lead Status, Cadence Stage, Last Outcome, Next Action

---

## Tab 6: DISQUALIFIED / CLOSED

Archive tab for leads that are done. Keeps the Active Leads tab clean.

Move leads here when:
- Status = DISQUALIFIED, COLD (dropped), CLOSED-WON, or CLOSED-LOST
- Always include the reason in column Y (Disqualification Reason)

---

## How to Use the Tracker — Daily Workflow

### Morning (9:00 AM ET)
1. Open **Tab 5: Follow-Up Queue**
2. Review today's follow-ups — prioritize HOT and WARM
3. Note any overdue follow-ups
4. Begin calls

### During Shift (9:15 AM – 12:15 PM ET)
5. For every call/email/SMS → Log in **Tab 2: Daily Log**
6. After each interaction → Update **Tab 1: Active Leads** (status, last contact, next follow-up, notes)
7. For HOT leads → Immediately email Nick (CC Shelly), mark "Handoff Sent" = Yes, update **Tab 4: Nick's Pipeline**

### End of Shift (12:15 – 1:00 PM ET)
8. Review **Tab 3: Daily Summary** — pull numbers for daily report
9. Send daily lead report email to Nick (CC Shelly) using the format in the Lead Handoff Process doc
10. Set tomorrow's follow-up dates in Tab 1
11. Move any DISQUALIFIED or CLOSED leads to Tab 6

---

## Tracker Rules

1. **Every prospect gets logged.** Even if it was a 15-second no. We need the data.
2. **Every interaction gets a new Daily Log entry.** One row per call/email/SMS.
3. **Active Leads tab is updated in real-time.** Not at end of day.
4. **Follow-Up Date must always be set.** If a lead is active, it has a next date.
5. **Notes must be specific.** "Good call" is not acceptable. Write what they said, what they asked, what their tone was.
6. **Status must be accurate.** Don't leave a lead as WARM if they clearly said no. Reclassify in real time.
7. **Handoff to Nick must be logged.** If you emailed Nick about a lead, mark it.
8. **Nick's follow-up status should be updated.** Check with Nick if he's followed up and update Tab 4.

---

## Document Control

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-03-26 | Initial tracker blueprint — 6 tabs, full column structure, status definitions, cadence stages, daily workflow |

---

*Prepared by Fiona Flynn — Scale Virtually*
*For review by Nick Kavali & Shelly Evans — WePartner Commercial*
