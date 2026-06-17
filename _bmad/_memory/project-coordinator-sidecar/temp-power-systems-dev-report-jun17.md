# Temp Power Systems CRM — Materials Report Patch Notes

**Prepared by:** Nova (Project Coordinator)
**Date:** June 17, 2026
**Report Type:** Delivery / Patch Notes — Materials Report module
**Client Contacts:** Chris Yates (cyates@temppower.com), Wayne McCoy (wayne@temppower.com)
**Status:** Shipped — delivered to client. More feedback expected; further patches to follow.

---

## Summary

This round addressed the Materials Report / materials-procurement module: 5 bug
fixes and 4 feature updates, all delivered. These items originated from Wayne's
Materials Report workflow feedback. This is the most recent TPS delivery; the next
batch of feedback is anticipated and will be logged as a follow-up patch.

---

## Bug Fixes

### FIX #1 — Need-by date showing the wrong day
**Fixed.** The system was accidentally shifting dates back by one day in certain
views. Corrected so that entering June 10 shows as June 10 everywhere. No more
mismatched dates between the project view and the Materials Report.

### FIX #2 — ETA not saving when status is "On Order"
**Fixed.** Previously, when editing a material that already had an ETA saved, the
date field appeared blank and hitting save would erase it. Corrected — ETAs now
load properly and stay saved.

### FIX #3 — Everyone sees California time now
**Fixed.** Dates and the "Overdue" flag were showing differently depending on the
user's location. Now, regardless of location, all dates display in California
(Pacific) time. Wayne and Fiona will always see the same date for the same record.

### FIX #4 — Notes now visible without clicking Edit
**Fixed.** Notes used to be hidden unless you clicked into the Edit screen. They now
show directly in the materials list inside each project — readable at a glance with
no extra clicks.

### FIX #5 — Materials dropdown now scrollable
**Fixed.** When searching for a material, the full list of matches now scrolls
properly. All items are reachable via mouse wheel or keyboard arrows.

---

## Feature Updates

### UPDATE #1 — Type quantities directly
**Done.** The old up/down arrow stepper is gone. You can now type the number you
need straight into the field.

### UPDATE #2 — Type your own Unit of Measure
**Done.** Instead of picking from a limited dropdown, you can now type whatever unit
makes sense.

### UPDATE #3 — Change order status right from the Materials Report
**Done.** No need to open each job individually to update a material's status. There
is now a dropdown on each row in the Materials Report — click and change it right
there.

### UPDATE #4 — Simplified status labels
**Done.** Status options renamed as requested:
- "Needs to Order" now says **Pending**
- "Procured or On Order" now just says **On Order**
- **Ready** and **Unknown** stay the same

---

*Logged to Nova project memory on 2026-06-17. Next: awaiting the next round of
Materials Report feedback for the follow-up patch.*
