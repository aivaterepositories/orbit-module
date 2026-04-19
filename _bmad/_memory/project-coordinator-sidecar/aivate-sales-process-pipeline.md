# Aivate — Sales Process Pipeline

**Version:** 1.0
**Last Updated:** April 2026
**Purpose:** The complete lead-to-closed-deal process. Every pipeline stage, transition criteria, and benchmark in one place.

---

## How to Use This Document

This is the map of your sales process. Every prospect moves through these stages. Your job is to move them forward — or disqualify them quickly so you can focus on prospects who will close.

---

## Pipeline Overview

```
Prospect → Connected → Engaged → Discovery Call → Proposal → Negotiation → Closed Won / Closed Lost
```

### Visual Summary

| Stage | What's Happening | Your Goal | Time Target |
|---|---|---|---|
| **Prospect** | Identified but not yet reached | Send connection request | < 1 day |
| **Connected** | Connection accepted on LinkedIn | Start a conversation | < 24 hours |
| **Engaged** | Actively messaging back and forth | Book a discovery call | 3-7 days |
| **Discovery Call** | Call scheduled or completed | Understand needs, recommend service | 1-3 days |
| **Proposal** | Proposal sent | Get a decision | 3-5 days |
| **Negotiation** | Discussing terms, scope, or pricing | Close the deal | 3-7 days |
| **Closed Won** | Deal signed, payment initiated | Hand off to delivery | — |
| **Closed Lost** | Deal fell through | Log reason, learn | — |

---

## Stage Details

### Stage 1: Prospect

**Definition:** You've identified a person who fits the ICP but haven't reached out yet.

**Entry criteria:**
- Matches ICP (see Ideal Client Profile document)
- Research completed (60-second scan)
- Not already in your pipeline

**Your actions:**
- Research the prospect (LinkedIn profile, website, company)
- Score them (Strong / Decent / Skip)
- Queue connection request with personalized note

**Exit criteria (move to Connected):**
- Connection request sent

**Exit criteria (remove):**
- Research reveals they don't fit ICP → Delete from pipeline
- LinkedIn profile is inactive (no activity in 6+ months) → Skip

### Stage 2: Connected

**Definition:** They accepted your connection request. You can now message them directly.

**Entry criteria:**
- Connection request accepted

**Your actions:**
- Send first message within 24 hours of acceptance
- Use templates from LinkedIn Outreach Scripts

**Exit criteria (move to Engaged):**
- They reply to your first message

**Exit criteria (move to Cold/Future):**
- No response after full follow-up sequence (Day 3, Day 7, Day 14)
- Move to Future if they fit ICP well, Dead if they don't

**Time target:** Move to Engaged within 3-7 days, or move to Cold/Future

### Stage 3: Engaged

**Definition:** You're in an active conversation. They're responding to messages.

**Entry criteria:**
- Prospect has replied at least once
- Conversation is active (messages within last 48 hours)

**Your actions:**
- Keep the conversation going — ask about their business, pain points
- Identify their primary need
- Transition to booking a discovery call
- Use conversation-to-meeting scripts from Outreach Scripts doc

**Exit criteria (move to Discovery Call):**
- Discovery call is scheduled with a confirmed date/time

**Exit criteria (move to Cold):**
- Conversation dies (no response for 7+ days despite follow-ups)

**Exit criteria (move to Future):**
- They say "not right now" but are open to future contact

**Time target:** Book a call within 3-7 days of first response

### Stage 4: Discovery Call

**Definition:** A call is scheduled or has been completed.

**Sub-stages:**
- **4a: Scheduled** — Call is booked, hasn't happened yet
- **4b: Completed** — Call happened, next step determined

**Entry criteria:**
- Confirmed date/time for a call

**Your actions (before call):**
- Pre-call prep (see Phone Call Scripts — Part 1)
- Send calendar invite with Zoom/Meet link
- Day-before reminder message

**Your actions (during call):**
- Run the discovery call framework (Phone Call Scripts — Part 2)
- Identify service match
- Handle objections
- Agree on next step

**Your actions (after call):**
- Send follow-up recap within 2 hours
- Update tracker with notes, lead score, next step

**Exit criteria (move to Proposal):**
- Prospect expressed interest in a specific service
- You have enough information to create a proposal
- Prospect agreed to receive a proposal

**Exit criteria (move to Cold/Future):**
- Prospect not a fit after call → Closed Lost (log reason)
- Prospect interested but not now → Future (set follow-up date)
- No-show on call → Reschedule once, if no-show again → Cold

**Time target:** From scheduled to proposal sent: 1-3 days

### Stage 5: Proposal

**Definition:** You've sent a formal proposal with scope, pricing, and timeline.

**Entry criteria:**
- Discovery call completed
- Prospect confirmed interest
- Proposal drafted and sent

**Creating the proposal:**
- For standard services (GHL automation, landing page, n8n workflow): You create the proposal using pricing from the Services Catalog
- For complex projects (Custom CRM, large builds): Send your call notes to Fiona. She'll help with scoping and pricing. You present the proposal.

**Proposal format:**
```
Subject: [Company Name] — Aivate Proposal

1. Summary of what we discussed
2. Recommended solution (specific service(s))
3. What's included (deliverables, bullet points)
4. Timeline (start date → delivery date)
5. Investment (total cost, payment terms)
6. Next step (what happens when they say yes)
```

**Your actions after sending:**
- Follow up within 48 hours if no response
- Ask: "Did you get a chance to review the proposal? Any questions?"

**Exit criteria (move to Negotiation):**
- Prospect replies with questions, requests changes, or wants to discuss terms

**Exit criteria (move to Closed Won):**
- Prospect accepts the proposal as-is

**Exit criteria (move to Closed Lost):**
- Prospect declines explicitly
- No response after 3 follow-ups over 2 weeks

**Time target:** Get a response within 3-5 days of sending

### Stage 6: Negotiation

**Definition:** Prospect wants to move forward but is discussing terms, scope, or pricing adjustments.

**Entry criteria:**
- Prospect has reviewed the proposal
- There are open questions or requested changes

**Common negotiation points:**
- Price (they want a discount)
- Scope (they want more or less than proposed)
- Timeline (they need it faster or want to delay start)
- Payment terms (they want different split)

**Your authority:**
- You can offer up to **10% discount** without approval
- You can adjust scope within reason (add a small deliverable, remove a feature)
- For anything beyond 10% discount or major scope changes: check with Fiona

**Your actions:**
- Address concerns directly
- Offer alternatives (e.g., smaller scope at lower price, or added value at same price)
- Push for a decision: "If we can agree on [X], are we good to go?"

**Exit criteria (move to Closed Won):**
- Both sides agree on terms
- Contract/agreement sent and signed
- First payment received or committed

**Exit criteria (move to Closed Lost):**
- Can't reach agreement on terms
- Prospect goes silent for 2+ weeks
- Prospect explicitly declines

**Time target:** Resolve within 3-7 days

### Stage 7a: Closed Won

**Definition:** Deal is done. Client is committed.

**Entry criteria:**
- Terms agreed
- Contract signed (if applicable — Fiona handles this)
- First payment received or payment terms confirmed

**Your actions:**
- Celebrate (seriously — you earned it)
- Hand off to delivery team:
  - Send Fiona the full deal details: client name, service, scope, pricing, timeline, payment terms
  - Include all your discovery call notes
  - Introduce the client to Fiona via email (warm handoff)
- Update your tracker: Closed Won, deal value, commission earned
- Ask for a referral: "Is there anyone else in your network who might need something similar?"

### Stage 7b: Closed Lost

**Definition:** Deal didn't happen.

**Entry criteria:**
- Prospect explicitly declined
- Prospect went silent despite multiple follow-ups
- Prospect not qualified (discovered during process)

**Your actions:**
- Log the reason in your tracker (every lost deal teaches you something)
- Send a graceful close message:

> "No worries at all, [Name]. Appreciate you taking the time to explore this with us. If anything changes down the road, you know where to find me. Wishing you and [Company] the best."

- If the reason was timing (not need): Move to Future, set 3-month follow-up
- If the reason was budget: Move to Future, set 6-month follow-up
- If the reason was no need: Move to Dead

---

## Qualification Framework: BANT

Use this throughout the pipeline — not just once. Your understanding of BANT deepens with each interaction.

### Budget

**What to assess:** Can they afford our services?

**How to assess:**
- "What kind of budget have you set aside for this?"
- "Have you invested in tools or services like this before? What did you spend?"
- "We typically see projects like this in the $X–$Y range. Is that in the ballpark?"

**Green:** They mention a specific budget, or they've paid for similar services before.
**Red:** "We have no budget" / they've never paid for technology services.

### Authority

**What to assess:** Can this person say yes?

**How to assess:**
- "Are you the one who makes the final call on something like this?"
- "Would anyone else need to be involved in this decision?"

**Green:** "Yes, it's my decision" / "Me and my partner decide together."
**Red:** "I'd have to run it up the chain" / multiple layers of approval.

**If they're not the authority:** Ask to loop in the decision-maker. Offer to do a brief call with both of them.

### Need

**What to assess:** Do they have a real problem we can solve?

**How to assess:** This should be obvious from the discovery call. If you can't articulate their pain point in one sentence, dig deeper.

**Green:** They describe a specific, concrete pain ("We lose leads because nobody follows up," "We spend 15 hours a week on data entry").
**Red:** Vague interest ("Just exploring," "We're curious about automation").

### Timeline

**What to assess:** When do they need this done?

**How to assess:**
- "When are you hoping to have this in place?"
- "Is there a deadline or event driving this?"

**Green:** "This quarter" / "ASAP" / specific date.
**Yellow:** "Next quarter" — real but not urgent.
**Red:** "Whenever" / "No rush" — low urgency = low close rate.

---

## Time-in-Stage Benchmarks

These are targets, not rules. If a deal is taking longer, that's a signal to either push harder or qualify harder.

| Stage | Target Time | Max Time Before Action |
|---|---|---|
| Prospect | < 1 day | 3 days (send request or remove) |
| Connected | < 7 days | 21 days (full follow-up sequence, then move) |
| Engaged | 3-7 days | 14 days (push for call or cool off) |
| Discovery Call | 1-3 days (from scheduled to post-call) | 7 days (reschedule once, then cool) |
| Proposal | 3-5 days | 14 days (3 follow-ups, then close out) |
| Negotiation | 3-7 days | 14 days (force a decision or walk away) |

### Deal Velocity Targets

| Metric | Target |
|---|---|
| Average time: Prospect → Closed Won | 21-30 days |
| Average time: Discovery Call → Closed Won | 10-14 days |
| Average time: Proposal → Closed Won | 5-10 days |

---

## Pipeline Health Metrics

Review these weekly to make sure your pipeline is healthy.

| Metric | Healthy Range | Warning Sign |
|---|---|---|
| Prospects added per week | 100-150 | < 50 (not enough top-of-funnel) |
| Connection acceptance rate | 25-35% | < 15% (profile or targeting issue) |
| Reply rate (first message) | 20-30% | < 10% (message quality issue) |
| Engaged → Discovery Call conversion | 30-50% | < 20% (qualification or transition issue) |
| Discovery Call → Proposal conversion | 50-70% | < 40% (call quality or targeting issue) |
| Proposal → Closed Won conversion | 40-60% | < 30% (pricing, objection handling, or qualification issue) |
| Overall: Prospect → Closed Won | 1-3% | < 0.5% (systemic issue) |

---

## Lost Deal Analysis

Every time you lose a deal, log the reason. Review monthly to spot patterns.

### Common Loss Reasons (and What to Fix)

| Reason | What It Means | Fix |
|---|---|---|
| No budget | Wrong prospect or poor qualification | Better ICP targeting, qualify budget earlier |
| Chose competitor | Didn't differentiate or lost on price | Improve value positioning, speed up process |
| Went silent | Lost engagement, prospect lost interest | Follow up faster, create urgency |
| Timing | Real need but not now | Schedule future follow-up, nurture relationship |
| Internal solution | They decided to build in-house | Better pitch on speed and opportunity cost |
| Decision-maker said no | Sold to wrong person | Qualify authority earlier |
| Scope mismatch | We couldn't do what they needed | Better discovery, be honest about capabilities |

---

## Document Control

| Version | Date | Changes |
|---|---|---|
| 1.0 | April 2026 | Initial pipeline document created |

---

*Your pipeline is your business. Manage it like a garden — add new prospects daily, nurture the ones that are growing, and prune the ones that aren't going anywhere. A clean, active pipeline is the difference between feast and famine.*
