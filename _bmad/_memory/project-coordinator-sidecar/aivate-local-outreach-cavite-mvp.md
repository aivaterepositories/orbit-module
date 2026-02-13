# Aivate Local Outreach Campaign — Cavite MVP

**Created:** 2026-02-13
**Status:** Planning
**Owner:** Fiona
**Assigned:** Marky (automation build)

---

## Campaign Overview

| Item | Details |
|------|---------|
| **Target Area** | Cavite (MVP) |
| **Weekly Volume** | 50 businesses |
| **Primary Channel** | SMS (email as backup) |
| **Language** | Taglish (Filipino-English colloquial) |
| **CTA** | Reply to text → Schedule store visit |
| **Pricing Hook** | Starting at ₱2,000 (placeholder — confirm with Marky) |
| **Goal** | Book in-person store visits to present services |

---

## Services to Offer

- Landing pages / website creation
- Order management systems
- Inventory management systems
- Course platforms / LMS
- Branding services

---

## Drip Sequence Framework

| Touch | Timing | Channel | Purpose |
|-------|--------|---------|---------|
| **Touch 1** | Day 1 | SMS | Hook + Introduce offer |
| **Touch 2** | Day 3 | SMS | Gentle follow-up |
| **Touch 3** | Day 7 | SMS | Final nudge + scarcity |
| **Touch 4** (optional) | Day 7 | Email | Longer-form if email available |

---

## Message Templates

### TOUCH 1 — Day 1 (Initial Hook)

**SMS Version:**

> Hi! Nakita namin yung [BUSINESS NAME] online — ganda ng products/services niyo! 👀
>
> Napansin lang namin na wala pa kayong website or medyo outdated na yung current niyo. We help local businesses magka-online presence starting ₱2,000 lang.
>
> Pwede kami dumaan sa store niyo to show you what we can do — kelan kayo free? 😊

**Character count:** ~290 (fits in 2 SMS segments)

---

### TOUCH 2 — Day 3 (Follow-up)

**SMS Version:**

> Hi ulit! 😊 Follow-up lang sa message namin about sa website for [BUSINESS NAME].
>
> Marami nang local businesses sa Cavite na nakapagtayo na ng sariling website — gusto niyo rin ba? Saglit lang usapan, pwede namin kayo puntahan.
>
> Just reply "G" kung interested! 👍

**Character count:** ~250

---

### TOUCH 3 — Day 7 (Final Nudge)

**SMS Version:**

> Last follow-up na 'to! 🙂
>
> Nasa Cavite area kami this week — if gusto niyo, pwede namin i-demo sa inyo paano namin matutulungan ang [BUSINESS NAME] mag-grow online.
>
> No pressure, no commitment — reply lang if interested. If hindi, no worries, good luck sa business! 💪

**Character count:** ~270

---

### TOUCH 4 — Day 7 (Email Version, if available)

**Subject:** Quick question for [BUSINESS NAME] 👋

**Body:**

> Hi!
>
> Nakita namin ang [BUSINESS NAME] habang nag-rresearch kami ng local businesses sa Cavite — and honestly, ang ganda ng products/services niyo!
>
> Napansin lang namin na:
> - [SPECIFIC GAP: e.g., "wala pa kayong website" OR "medyo outdated na yung current site niyo" OR "walang online ordering system"]
>
> We're a small team na tumutulong sa local businesses na magka-online presence — websites, landing pages, online ordering systems, etc. Starting price is ₱2,000 for a basic website.
>
> **Pwede kami dumaan sa store niyo para magpakita ng examples ng work namin — no commitment, no pressure.** Kelan kayo usually free?
>
> Just reply to this email or text us at [MARKY'S NUMBER].
>
> Salamat! 🙏
>
> — Team Aivate

---

## Metrics & Targets

### Weekly Targets (Based on 50 outreaches)

| Metric | Target | Notes |
|--------|--------|-------|
| **Outreaches sent** | 50/week | Mix of SMS + email |
| **Response rate (overall)** | 8-12% | Across all 3 touches |
| **Expected replies** | 4-6/week | From 50 outreaches |
| **Store visits booked** | 2-3/week | ~50% of replies convert to visit |
| **Closed deals** | 1-2/week | ~50% of visits convert |

### Expected Response Rate Per Touch

| Touch | Expected Response Rate | Cumulative |
|-------|------------------------|------------|
| Touch 1 (Day 1) | 3-5% | 3-5% |
| Touch 2 (Day 3) | 2-4% | 5-9% |
| Touch 3 (Day 7) | 2-3% | 7-12% |

*Note: Current rate is 2-4%. With this drip system + better copy, targeting 8-12%.*

---

## Monthly Projections

| Metric | Monthly Target |
|--------|----------------|
| **Outreaches** | 200 |
| **Replies** | 16-24 |
| **Store visits** | 8-12 |
| **Closed deals** | 4-6 |
| **Revenue (at ₱2,000 avg)** | ₱8,000-12,000 |

*Revenue will increase as upsells happen (order management, branding, etc.)*

---

## Automation Notes for Marky

### What Marky needs to set up:

1. **Lead list** — Google Maps scraping or manual list with:
   - Business name
   - Phone number
   - Email (if available)
   - Identified gap (no website / outdated / no online ordering)

2. **Drip automation tool** — Options:
   - SMS: Philippine SMS gateway (Semaphore, Itexmo, etc.)
   - Email: Mailchimp, Brevo, or Google Sheets + Apps Script

3. **Timing triggers:**
   - Day 1: Send Touch 1
   - Day 3: If no reply → Send Touch 2
   - Day 7: If still no reply → Send Touch 3 + Email (if available)
   - If reply received → Stop sequence, move to "Interested" list

4. **Tracking sheet** — Track:
   - Date sent
   - Business name
   - Channel (SMS/email)
   - Touch # sent
   - Reply received (Y/N)
   - Visit scheduled (Y/N)
   - Deal closed (Y/N)

---

## Open Items to Discuss with Marky

- [ ] Confirm starting price (₱2,000 placeholder)
- [ ] Taglish tone — add more humor?
- [ ] SMS gateway selection
- [ ] Automation tool selection
- [ ] Lead sourcing process (Google Maps scraping)

---

## Changelog

- **2026-02-13:** Initial framework created by Nova with Fiona
