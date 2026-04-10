# 5 Interesting Things to Focus On

_Synthesized 2026-04-10 from Sentry, Linear, Slack, and Notion_

---

## 1. N+1 Query — Day 11, No Longer Feels Urgent (That's the Problem)

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

**2,401 events/24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/` — still the highest user-count open Sentry issue, and still unresolved at day 11. The fix is a one-line `select_related` / `prefetch_related` change that has been documented as such since March 30. The reason to flag this again isn't that it's getting worse — it's that eleven days of inaction is long enough to permanently normalize it. This is the clearest, lowest-effort, highest-impact action available: a single Django ORM change that closes the top open Sentry issue by user count.

---

## 2. Dual Auth Failures — Shared Root Cause Still Uninvestigated After Eight Days

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — MCP `invalid_token` / `Field required` post-March 20 deploy
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Eight consecutive days of digests have flagged these two auth failures as potentially sharing a root cause — token expiry, an auth middleware regression, or an OAuth scope change — and eight days of digests show no evidence anyone has actually compared them side by side. Nacho investigated the MCP side (DP1-3222 still open). The frontend 401s appear to be on a separate track. The opportunity cost here is concrete: if these share a root cause, one fix closes both. The coordination cost of a 30-minute cross-team comparison is trivially low relative to that upside.

---

## 3. Cross-Sell Quote Blockers — Disappeared Without Closure, Now 4 Days Missing

**Source:** [Notion Meeting Notes — Cross-Sell Quote Indication](https://www.notion.so/329b9be2b0f38064b3bffbf63e4bd654)

Three blocking issues preventing retail agents from binding end-to-end through the wholesaler portal dropped off the digest on April 7 without resolution:

1. White-label branded URL / logo / theme not resolving correctly
2. Surplus fees and license numbers missing from coverage pages and PDF invoices
3. Pro-rating using submission date instead of effective date

The last known action was a connectivity call during the week of March 24. These items have now been missing from tracking for four days. Items that disappear from digests without explicit closure don't go away — they become nobody's job. A direct status check (resolved, deprioritized, or still open) is worth the five minutes it takes to ask.

---

## 4. Salesforce Cutover — `ignore_signals` Coverage Is Testable Today

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

The architectural inversion (Django Admin read-only for broker data; Salesforce as write origin via `BrokerInboundSyncService` at `/salesforce-api/brokers/sync/`) has been in every digest since March 31. The go/no-go gate is `ignore_signals` coverage — a gap here fires welcome emails at users on every sync. This has been identified as the highest-stakes pre-launch risk across ten days of digests, but no evidence of test coverage has ever appeared. This is not an unknowable risk: a targeted unit test exercising the sync endpoint and asserting zero email signals fire would either confirm the gate is closed or surface the gap before cutover. Writing that test is the most concrete pre-launch action available.

---

## 5. Kubernetes EKS v1.31 Upgrade — 15 Days Since Runbook Update, No Status

**Source:** [Notion — Kubernetes EKS Auto+v1.31 Upgrade Runbook](https://www.notion.so/counterpart/307b9be2-b0f3-807e-bd5f-e4641ab156a7)

The EKS upgrade runbook was last updated March 26 — 15 days ago — which typically signals an imminent or in-progress operation. The runbook covers cert-manager v1.20.0 steps, CRD handling, and a CoreDNS version change (v1.11.1 → v1.11.3). This item surfaced in the March 30 digest and then disappeared as larger items crowded it out. Three open questions worth answering: Has the upgrade already run? If not, what's the current schedule? And which services need prep work before the node roll? EKS upgrades are the infrastructure event where surprises reliably come from services nobody thought to check in advance.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
