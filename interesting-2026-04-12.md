# 5 Interesting Things to Focus On

_Synthesized 2026-04-12 from Sentry (via #sentry), Linear, Slack, and Notion_

---

## 1. New This Morning: DecodeError / "Invalid Crypto Padding" on Battlecards — State: Escalating

**Source:** [#sentry — COUNTERPART-BACKEND-DJANGO-CPT](https://counterpart.sentry.io/issues/7406030798/?referrer=slack&environment=production&alert_rule_id=10629186&alert_type=issue)

A `DecodeError` with the message `Invalid crypto padding` fired this morning at 7:34am on `/api/application/{application_id}/battlecards/` — 572 events, 1 user, state **Escalating**. This endpoint surfaces underwriting intelligence to brokers mid-application. A crypto padding error at this layer typically indicates either a corrupted or mis-encrypted payload, a key mismatch, or data written by one version of an encryption scheme being read by another after a deploy.

This is the only new Sentry alert escalating this morning. No thread or acknowledgment is visible in #sentry yet. The battlecards endpoint isn't a core binding path, but if it's throwing for one user now, the escalating state means it's likely to spread. Worth eyes on immediately.

---

## 2. Salesforce $crm__limit Context Missing → HTTP 500 on POST /api/applications/ (BRS-275)

**Source:** [#broker-services-linear — BRS-275 comment by Eliezer Mendez](https://yourcounterpart.slack.com/archives/C0A5D6G2W6A/p1775845270325689)

Linear ticket BRS-275 documents an `ExpressionError` thrown when `$crm__limit` context is missing, causing a hard HTTP 500 on `POST /api/applications/`. This is a direct side effect of the Salesforce SOT integration: the application creation endpoint is now referencing a CRM-derived context variable (`$crm__limit`) that isn't always populated — and when it isn't, the entire application POST fails.

This is the most concrete production consequence of the Salesforce rollout seen so far. Unlike the `ignore_signals` email risk (a pre-launch risk), this is a live failure path. Eliezer commented on it April 10 — no resolution is visible in the Linear channel feed. The question to answer: under what conditions is `$crm__limit` absent, and how many application submissions are silently hitting this 500?

---

## 3. XS 2.0 Architecture Decision: Mixed-Limit Excess Cannot Be a Single Tower

**Sources:**
- [#agentic-underwriting-action-pod — Underwriting Pod Meeting Recap, April 9](https://yourcounterpart.slack.com/archives/C09E3N47W2J/p1775761693980339)
- [Linear — 26Q2 Excess 2.0 Project](https://linear.app/counterpart/project/26q2-excess-20-eafaac8fd22c/overview)

The April 9 underwriting pod meeting surfaced a significant architectural constraint: **the current excess system assumes identical underlying limits across all coverage lines.** If an account has different per-line limits — e.g., $1M EPL and $2M D&O — the correct approach is to issue **separate policies per coverage line**, not combine them into a single tower. This requires form, UX, and rating-engine alignment that Ben, Tobias, Tiffany, and Morgan need to work through before any May development starts.

Two action items are now open for Ben: schedule the alignment call (Monday 1:30 CT tentative) and mock up the excess pricing modal. The XS 2.0 Linear project exists but the scope boundary — UW pod owns workflow; Ron & Michelle own coverage enablement for PL and crime — was only just decided on this call. May development is constrained until that alignment call happens.

---

## 4. Policy Revert Bug — No Hotfix Has Shipped, Affected Policies Need Status Check

**Source:** [#underwriting-pod-dev — Leo Vanzella, April 11](https://yourcounterpart.slack.com/archives/C0A6ZLSN9A7/p1775905106091469?thread_ts=1775668594.703029&cid=C0A6ZLSN9A7)

The policy revert feature shipped in v2026.04.10-01. By 4am April 11, Leo Vanzella and Ben had confirmed the bug: the revert event uses the **target event's effective date** instead of the **next replaced event's effective date**. There has been no release to #engineering-releases since that notification, and no hotfix is visible today.

Two things need answering: (1) Has a fix been merged and is it queued for release today, or is it being tracked for a later release? (2) Do any policies that went through a revert since April 10 have incorrect financial records that need manual correction now? The longer the hotfix waits, the more policies may be affected.

---

## 5. Salesforce "Person as Account" Data Model Finalized — The Design That Unlocks Q2

**Sources:**
- [Notion — Complete Salesforce Data Model](https://www.notion.so/304b9be2-b0f3-81c7-b400-d6332512d86b)
- [Notion — Salesforce SOT Q2 '26](https://www.notion.so/306b9be2-b0f3-8095-bc50-d1d7b2c510aa)
- [Notion — Salesforce Project Proposed Pillars](https://www.notion.so/310b9be2-b0f3-804c-bb57-e2bcb38e7ffe)

Four Salesforce-related Notion documents were updated on April 10 — the same day as the last release. The **Complete Salesforce Data Model** describes a finalized design: a **unified account type system** with a single `Account` object carrying five types (Person, Team, Office, Organization, Program Partner). People are modeled as accounts, not contacts — a meaningful departure from standard Salesforce conventions.

This is the underlying schema that the `BrokerInboundSyncService`, the `$crm__limit` context variable (see item 2), and the planned cutover all depend on. The fact that the design was finalized April 10 while BRS-275 (the `$crm__limit` 500 error) also surfaced April 10 suggests the data model and the integration code may be advancing faster than the test coverage. Worth confirming whether integration tests exist against this finalized model before the sync endpoint is opened to production traffic at scale.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
