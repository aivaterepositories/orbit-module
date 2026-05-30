# Project Patterns - Nova's Memory

**Last Updated:** 2026-05-29

This file stores learned patterns from managing projects across sprints. Nova uses this to improve coordination and prevent common issues.

## Communication Protocols

### Email Protocol
When sending emails on Fiona's behalf:
1. **First contact with any recipient:** Always introduce myself as "Nova, Fiona's assistant"
2. **Sign-off format:** "Nova (On behalf of Fiona)"
3. **Tone:** Professional, clear, and action-oriented
4. **Process:** Draft email → Fiona reviews → Send upon approval

### Email Credentials
- **Account:** fiona@aivate.net
- **SMTP:** Gmail (smtp.gmail.com:587)
- **App Password:** vknm hvsb wglu baan

### Google Calendar Integration
- **Credentials file:** `.orbit-credentials/google-calendar-tokens.json` (gitignored — read at runtime)
- **Project:** Calendar by Nova (Project ID: calendar-by-nova)
- **Scope:** https://www.googleapis.com/auth/calendar
- **Token endpoint:** https://oauth2.googleapis.com/token
- **Calendar API base:** https://www.googleapis.com/calendar/v3
- **Fiona's timezone:** Asia/Manila (GMT+8)
- **Usage:** Refresh access token using refresh_token + client credentials before each API call. Always schedule events using Asia/Manila timezone so they display correctly on Fiona's calendar.
- **Note:** Client ID, Client Secret, and Refresh Token stored in credentials file — not in this repo.

### Trello + Fathom Integration

**Credentials file:** `.orbit-credentials/nova-integrations.yaml` (gitignored — read at runtime)

#### Trello — Fiona's Project Board (Primary)
- **URL:** https://trello.com/b/f2r0lkt5
- **Workspace:** KA Workspace
- **Default List:** To Do (for new tasks from call processing)
- **Lists:** To Do, Do Today, Doing, Delegated, Stuck, Completed, KB
- **Labels:** Khalifeh & Associates (blue), Temp Power Systems (red), LA Elite Rentals (orange), Dos Gringos Construction (green), RNR Property Solutions (purple), Bedrock Investment Property (yellow), Aivate Internal (sky), FIG (pink)
- **Usage:** After call transcripts, auto-create task cards in **To Do** with the appropriate project label. Delegated tasks go in **Delegated** list.

#### Trello — Khalifeh & Associates (Legacy/Standalone)
- **URL:** https://trello.com/b/RxrX57P8/khalifeh-and-associates
- **Timesheet Card:** `69eff51847e987ce823de238` (Timesheet and EOD Report — update daily with time allocation from KA EOD)
- **Recurring Task — Submit Timesheet (Biweekly):**
  - Every other Friday, create card on Fiona's Project Board
  - Card name: "Submit Timesheet"
  - List: To Do
  - Label: Khalifeh & Associates (blue)
  - Custom Field "Assigned to": Jayson
  - Due date: That Friday
  - Schedule: May 22, Jun 5, Jun 19, Jul 3, Jul 17, Jul 31... (every 2 weeks from May 22, 2026)
- **Daily Timesheet & EOD to Fiona's Project Board (Standard Format):**
  - Reference card: https://trello.com/c/2WK1zsxn (May 27, 2026 — use as template)
  - After updating the KA legacy timesheet card, also create a new card on Fiona's Project Board
  - **List: Delegated** (ALWAYS — EOD reports always go in the Delegated list, never Completed or To Do)
  - Label: Khalifeh & Associates (blue)
  - Custom Field "Assigned to" (ID: `6a0e8674edb9ed8aaa399943`): Jayson (ID: `6a0e8674edb9ed8aaa399945`)
  - Card name format: "KA Timesheet & EOD — [Month Day, Year]"
  - **Description:** Timesheet breakdown only (hours by category)
  - **Comment:** Full EOD report in WhatsApp-friendly format — Jayson copies this and pastes directly to WhatsApp
  - EOD format: Use *bold* for headers, → for sub-bullets, — as dividers, no emojis, no markdown tables
  - Sections: TODAY'S ACCOMPLISHMENTS (numbered), TOMORROW'S PLAN (numbered), BLOCKERS / OUTSTANDING (bullets)
  - Close with: "That's it for today. Thank you!"

#### Fathom Accounts
- **Aivate account:** TPS, LA Elite, Dos Gringos, RNR, Bedrock, Aivate Internal
- **Scale Virtually account:** Dos Gringos, RNR, Bedrock, and other SV clients
- **FIG account:** Fiona is EA to Cory (CEO). Sometimes calls aren't recorded in Fathom — check Gemini Notes as fallback. **Do NOT auto-process FIG calls unless Fiona explicitly asks.**
- **KA account:** No Fathom for KA. KA uses Microsoft Teams for meetings (see Teams Notes below).
- **API base:** `https://api.fathom.ai/external/v1`
- **Auth header:** `X-Api-Key`

### AI Notetaker Integration
- **Workflow:** Fiona finishes call → tells Nova "process my [client] call" → Nova pulls transcript → extracts action items → creates Trello cards with correct label
- **Notetakers by account:**
  - **Aivate:** Fathom (API connected)
  - **Scale Virtually:** Fathom (API connected)
  - **FIG:** Fathom (API connected) + Gemini Notes via Google Drive (fallback when Fathom doesn't record)
  - **KA:** Microsoft Teams Notes (copy-paste from Fiona — no API, Graph API requires Azure AD admin setup)
- **Gemini Notes:** Accessed via Google Drive MCP (solutions@aivate.net). FIG team shares notes from cory@freedomcm.net, karla@freedomcm.net. No API — Google doesn't offer one for Gemini Notes.
- **Teams Notes:** No API access. Fiona will copy-paste Teams transcripts for KA meetings with Brandon/Jack. Nova extracts action items and creates Trello cards.

### Call Processing Rules
- **SV call filtering:** Skip internal-only meetings (pdev client services, pdev daily standups, calls with only Scale Virtually team members and no clients). IMPORTANT: Always check transcript speakers, not just calendar invitees — impromptu calls may have clients who weren't on the invite.
- **No-show calls:** Do NOT create tasks from no-show client calls. These often turn into internal debriefs/training sessions with no actionable client tasks.
- **Delegated tasks:** Prefix with [Person Name] in the card title. Place in Delegated list. Include "Assigned to:" in the description.
- **Client-to-label mapping (SV account):**
  - Walker McCallon / Dos Gringos → Dos Gringos Construction (green)
  - Kel King / LA Elite Rentals / DOS / Don → LA Elite Rentals (orange)
  - Haruna Oyola / Willie Oyola / RNR → RNR Property Solutions (purple)
  - Jeremy Watson / Bedrock → Bedrock Investment Property (yellow)
  - Internal SV team only (Jesylou, Marc, Ace, Alex, Bhel, CK, Ella, pdev@) → SKIP
- **Client-to-label mapping (FIG account):**
  - Cory (CEO) / FIG calls → FIG (pink)

### Fiona's Calendar Booking Link
- **URL:** https://calendar.google.com/appointments/schedules/AcZssZ2duyv6vS3CvA2vf_Ond637NJ90m65px2j-I3N3pD5W68BPlnSt47VAJUb94zKuwvsYJGxKIxyL
- **Use for:** Scheduling calls with Fiona

### L10 Meeting Automation
**Weekly L10 Reminder Email**
- **Schedule:** Every Friday
- **Recipients:** fiona@aivate.net, mark@aivate.net, cob@aivate.net
- **Meeting Time:** Saturday, 6:00–7:30 AM Manila time
- **KPI & Rock Sheet:** https://docs.google.com/spreadsheets/d/1ONKQrzvOVd7w82KDH6E2wgajsCq0s_-TWhBEk-39yKs/edit?usp=sharing
- **Issue List:** Same sheet (separate tab)
- **Reminder Content:**
  1. Update KPIs (on/off track)
  2. Update Rocks (on track / off track / at risk)
  3. Add items to Issue List for discussion

### Known Contacts
| Name | Email | Notes |
|------|-------|-------|
| Marky | mark@aivate.net | Team member - introduced 2026-02-05 |
| Cob | cob@aivate.net | Team member - added 2026-02-08 |
| Chris Yates | cyates@temppower.com | TPS client - introduced 2026-02-12 |
| Wayne | wayne@temppower.com | TPS Project Manager - introduced 2026-02-12 |
| Sandra Morales | smorales@temppower.com | TPS — Contracts & Compliance |
| Angela Vaughn-Richey | angela@temppower.com | TPS — Accounting & Billing |
| Kel King | Kelking372@gmail.com | LA Elite Rentals Owner - introduced 2026-02-12 |
| Dos Espina | espinajasvenzon@gmail.com | LA Elite Rentals — Manager on Duty. Reinstated 2026-02-26. Receives all VA follow-up tasks. |
| Jesse (Jesylou Jopio) | *(TBD)* | Fiona's supervisor at Scale Virtually. Assigns clients to Fiona for process engineering. NOT part of Aivate. |
| Brayden Wynn | *(bouncing — domain issue)* | Client at Collett. Assigned via Scale Virtually / Jesse. |
| Nick Kavali | *(TBD)* | Client — Broker at WePartner Commercial. Commercial office leasing, Roswell GA. IPEC 2026-03-20. |
| Shelly Evans | *(TBD)* | Client — Broker at WePartner Commercial. Works with Nick Kavali. IPEC 2026-03-20. |
| Haruna Oyola | haruna@rnrpropertysolutions.com | Client — COO at RNR Property Solutions. Property management & fix-and-flip. CST. Assigned via Scale Virtually Apr 2026. |
| Willie Oyola | *(TBD)* | Client — Co-owner/Operator at RNR Property Solutions. Works with Haruna Oyola. |
| Jeremy Watson | jeremy@bedrockinvestmentproperty.com | Client — Founding Partner/CEO at Bedrock Investment Property. Turnkey RE investment (hundreds of properties, 13 PMs, 9 states). VIP Influencer. EST. Assigned via Scale Virtually Apr 2026. PROCESS w/ MVA, Multi Role (2 VAs), $4,000 SUF. |
| Walker McCallon | wmccallon@dosgringosllc.com | Client — Co-owner at Dos Gringos Construction LLC. Fix-and-flip, high-equity acquisitions, Kansas City. CST. PROCESS w/ MVA, Single Role, $1,000 SUF. Partner: Alejandro (Alex). Three-person team (Walker, Alex, Walker's wife). IPEC completed May 20, 2026. Next PEC: May 22. |
| Colton | *(TBD)* | Dos Gringos — In-house real estate agent, runs networking/deal acquisitions. Gets overwhelmed with deal flow. VA will eventually support him with underwriting pre-screening. |
| Jack Khalifeh | jack@khalifehassociates.com | Employer — Principal of Khalifeh & Associates Inc. MEP Engineering Consulting, 40 yrs. PST. Fiona is employed directly by KA (transitioned from Scale Virtually process engineering). |
| Brandon | *(TBD)* | Employer — Operations at Khalifeh & Associates Inc. Works with Jack. |
| Clint Isaac Isa, PE | clint.isa@aecom.com | AECOM — Senior Manager, Transportation, US West. Phone: 310-612-4176. Contact for sub-consulting on federal/military projects. Introduced via USWCC Matchmaking May 2026. |
| Candice Grant | candice.grant@aecom.com | AECOM — Project Controls Analyst, Transportation US West / Ports & Marine Americas. Phone: +1-714-330-7802. Contact for sub-consulting on federal/military projects. Introduced via USWCC Matchmaking May 2026. |

## Internal Aivate Projects

### Cavite Local Outreach MVP
- **Status:** Planning
- **Owner:** Fiona
- **Assigned:** Marky (automation build)
- **Document:** `aivate-local-outreach-cavite-mvp.md`
- **Goal:** Outreach to local businesses in Cavite, book store visits, close deals
- **Weekly Target:** 50 outreaches, 4-6 replies, 2-3 visits, 1-2 closes

## Report Templates

### EOD / SOD Report Format (WhatsApp-friendly)
- Format for WhatsApp readability — no markdown tables, no emojis
- Header: just "*End of Day Report — [Day], [Date]*" or "*Start of Day Report — [Day], [Date]*"
- No name, no company name in header
- Use *bold* for section headers
- Use → for sub-bullets (e.g. LinkedIn connections)
- Use — as section dividers
- Sections:
  1. *TODAY'S ACCOMPLISHMENTS* — numbered items with bullet details
  2. *TOMORROW'S PLAN* — numbered list
  3. *BLOCKERS / OUTSTANDING* — bullet list, no emojis
- Close with: "That's it for today. Thank you!"
- Spelling: John (not John), AR Aging report, KA share

### KA Invoice Format (Aivate-branded)
- **Business name:** Aivate (Fiona's registered business in the Philippines)
- **Format:** Fiona's own invoice generator — used for Philippine tax filing
- **Invoice includes:** Aivate branding, work email, phone number, billing period, total hours
- **Breakdown:** Daily time allocation with generic service categories:
  - Admin, Marketing, Client Services, Project Documentation, Financial Operations, Business Development, Proposal Development, Operations Setup, Vendor Registration, Training
- **Process:** Nova prepares timesheet data in invoice-ready format (daily breakdown with categories) → Fiona generates invoice via her own tool → sends to Brandon
- **Approved by:** Brandon (emailed May 22, 2026)
- **Pay period example:** May 8–21, 2026 (48 hours)

## Patterns Learned

### Initialization
- First time loading Nova for this project
- No patterns established yet

## Sprint History

*No sprints completed yet*

## Team Velocity Patterns

*Will be populated as sprints complete*

## Common Blockers

*Will be documented as they're encountered and resolved*

## Best Practices Discovered

*Team-specific practices will be captured here*

---

Nova will automatically update this file as project patterns emerge.
