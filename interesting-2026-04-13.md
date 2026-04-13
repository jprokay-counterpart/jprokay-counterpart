# 5 Interesting Things to Focus On

_Synthesized 2026-04-13 from Sentry (live), Slack (#underwriting-pod-dev), and Notion_

---

## 1. Policy Revert Bug: Effective Date Fixed, But Sequence ID Is Now Broken

**Source:** [#underwriting-pod-dev — Ben Nickerson & Leo Vanzella, April 13 ~7am](https://yourcounterpart.slack.com/archives/C0A6ZLSN9A7/p1776090022832049?thread_ts=1775668594.703029&cid=C0A6ZLSN9A7)

Leo pushed a fix for the wrong effective date bug (UW-191) this morning. Ben retested and confirmed: **"It works!"** — but within minutes Ben found a new failure: **after reverting a midterm transaction, the sequence ID does not iterate**, which means you cannot process any subsequent midterm on that policy. Leo suspects a related transaction issue. There are also two open requirement questions: (1) should it be impossible to revert a "Policy Reverted" event? (2) should it be impossible to revert the first "New" event in the stream?

This means the feature is not ready to ship even though the original date bug is fixed. Three things now need to close before it can go to production: the sequence ID bug, the two revert guard requirements, and a new Sentry error that appeared 35 minutes ago — [COUNTERPART-BACKEND-DJANGO-CPY](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-CPY) — `PolicyRevertError: Policy must be bound before backing out changes`. That error first appeared after Leo's fix deployed.

---

## 2. Battlecards DecodeError Root Cause: Cloudflare Access Token Malformed, Not a Data Encryption Bug

**Source:** [Sentry — COUNTERPART-BACKEND-DJANGO-CPT](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-CPT) · 1,445 events · 1 user · Status: **Escalating** · Release: v2026.04.10-01

Yesterday's escalating Sentry alert has a clear root cause now visible in the event detail: `cloudflare_access.py:86` is calling `jwt.get_unverified_header(token)` and failing with `Invalid base64-encoded string: number of data characters (241) cannot be 1 more than a multiple of 4`. The Cloudflare Access JWT arriving from the user (Anisio, Brazil) is malformed — truncated or incorrectly padded. This is an auth middleware issue, not a payload encryption problem.

The issue is still unresolved and escalating. The most likely cause: either the token is being URL-decoded/re-encoded somewhere in the request path and losing its padding, or the Cloudflare Access app serving Brazilian traffic is generating non-standard JWTs. The fact that it's pinned to a single user suggests the former. The fix is in `common/integrations/cloudflare_access.py` — `_get_signing_key` should add base64 padding before parsing.

---

## 3. New: CRM-Enabled Rating Engine Failing on Missing Revenue Across Multiple Applications

**Sources:** [Sentry — ADMITTED-RATING-ENGINE-SM](https://counterpart.sentry.io/issues/ADMITTED-RATING-ENGINE-SM) · [COUNTERPART-BACKEND-DJANGO-925](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-925) (assigned: Leonardo Vanzella) · [COUNTERPART-BACKEND-DJANGO-904](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-904) (assigned: Leonardo Vanzella)

A new error cluster appeared in the last 23 hours: `Admitted Rating Engine ERROR: Missing revenue with CRM enabled. Please add answers.` The rating engine now has a CRM-gated code path that requires revenue data from the Salesforce integration — but when that data is absent, the whole premium calculation fails and the submission task retries indefinitely.

This is the second confirmed live production consequence of the Salesforce CRM rollout (alongside BRS-275). The pattern is identical: CRM-derived context expected by backend logic, not always present, hard failure with no graceful fallback. Three related Sentry issues are active and assigned to Leo. Worth checking whether this is a data population gap (CRM records incomplete) or a feature-flag sequencing issue (CRM mode enabled before sync is fully live).

---

## 4. DigitalRisk MPL Validation Failing Across 4 Services Simultaneously

**Sources:** [Sentry — MODEL-EVALUATION-1N](https://counterpart.sentry.io/issues/MODEL-EVALUATION-1N) · [DIGITAL_RISK-16](https://counterpart.sentry.io/issues/DIGITAL_RISK-16) · [DATAPOOL-SERVERLESS-701](https://counterpart.sentry.io/issues/DATAPOOL-SERVERLESS-701) · [COUNTERPART-BACKEND-DJANGO-CQ](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-CQ) (assigned: Leonardo Vanzella) · 6 users impacted

All four of these issues share the exact same error body: `mpl fields are required: limit, premium, premium_ex_mods and retention`. The error originates in the DigitalRisk service and propagates upstream through the Datapool serverless layer and into the main Django backend. First seen 12 hours ago across all four simultaneously — which strongly suggests a schema or contract change in the DigitalRisk service rather than a data problem.

This is a cross-service contract breakage that isn't getting much visibility yet. The four issues look like separate alerts but they are one event. If anything touches MPL submissions today, it will fail.

---

## 5. UW Agent System Architecture Proposal — Updated Today, Strategic Fork Point

**Source:** [Notion — UW Agent System Architecture Proposal (Draft)](https://www.notion.so/341b9be2-b0f3-81cf-b446-e06a2ab6eaab) · Updated 2026-04-13

A new Notion document was updated or created today: the "UW Agent System — Architecture Proposal (Draft)." The highlights visible from search: it proposes **separate agents** with boundary-based fixture capture points ("freeze the Research Agent's output and vary only the UW Agent's"), and the research agent finds similar bound accounts, computes per-line term benchmarks, analyzes endorsement frequency and mod patterns, and surfaces competitive intelligence.

This is the architecture that the [2026Q2 Initiative](https://www.notion.so/33db9be2-b0f3-805e-a45e-c79ef8bdc930) lists as `~Nacho, Rodrigo, collab. Derrick, Chris S` under "Context Architecture." The fact that it was updated today — while the Cowork-dependency risk is documented elsewhere — suggests a decision point is approaching on whether the UW agent ships through Cowork or as a standalone surface. Worth reading before any Q2 scoping calls.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
