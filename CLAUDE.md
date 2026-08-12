# Claude Code — Project Instructions

## Trello Integration (ALWAYS USE)

When Fiona asks to create Trello cards (EOD reports, timesheets, task cards, etc.):

1. **DO NOT ask if Trello access is available** — it IS configured.
2. **Load credentials** from `.orbit-credentials/nova-integrations.yaml`
3. **Load workflow details** from `_bmad/_memory/project-coordinator-sidecar/project-patterns.md`
4. **Use the Trello REST API** directly via curl to create cards, add comments, set custom fields, etc.

### KA EOD / Timesheet Cards — Standard Workflow

- **Board:** Fiona's Project Board (ID: `6a0e4b4d878d54c4d582abc4`)
- **List:** Delegated (ALWAYS — never Completed or To Do)
- **Label:** Khalifeh & Associates (blue)
- **Custom Field "Assigned to":** Jayson
- **Card name format:** "KA Timesheet & EOD — [Month Day, Year]"
- **Description:** Timesheet breakdown only (hours by category)
- **Comment:** Full EOD report in WhatsApp-friendly format (Jayson copies and pastes to WhatsApp)
- **EOD format:** *bold* headers, → sub-bullets, — dividers, no emojis, no markdown tables
- **Sections:** TODAY'S ACCOMPLISHMENTS (numbered), TOMORROW'S PLAN (numbered), BLOCKERS / OUTSTANDING (bullets)
- **Close with:** "That's it for today. Thank you!"
- **Also save** the markdown EOD file in `_bmad/_memory/project-coordinator-sidecar/khalifeh-eod-report-[date].md`

## Proposals & Analysis Reports — PDF Delivery

When Fiona asks to draft proposals, analysis reports, or any client-facing documents:

1. **Always deliver as PDF** — never leave as HTML only.
2. **Build the HTML** with a flowing document layout (not fixed slide boxes) so Puppeteer paginates naturally.
3. **Use `page-break-inside: avoid`** on cards, tables, flow diagrams, pricing boxes, signature blocks, and note boxes.
4. **Use `page-break-after: avoid`** on section headings so they don't orphan at the bottom of a page.
5. **Generate the PDF** using Puppeteer with:
   - `format: 'Letter'`
   - `printBackground: true`
   - `displayHeaderFooter: true` with footer showing company name + page numbers
   - Proper margins (top: 48px, bottom: 56px)
6. **Follow the Aivate proposal style** — dark slate/blue headers, amber accents, Open Sans font, gradient cover page. Reference `tps-change-order-mapping-proposal.html` or `tps-materials-upgrade-proposal.html` for the design system.
7. **Email credentials** are in `.orbit-credentials/nova-integrations.yaml` — use `nodemailer` via Gmail SMTP (`fiona@aivate.net`) when asked to send.
