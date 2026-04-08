# 5 Interesting Things to Focus On

_Synthesized 2026-04-08 from Sentry, Linear, Slack, and Notion_

---

## 1. N+1 Query — Day 9, Now Invisible by Definition

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

**2,401 events/24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/` — still the highest user-count open Sentry issue. The fix is a one-line `select_related` / `prefetch_related` change and has been documented as such since the first digest on March 30. At nine days, this issue is no longer "unfixed" in practice — it's invisible. Nobody is going to escalate it because it's been there too long to feel urgent. That's exactly when it needs to be escalated. This is the lowest-effort highest-impact action available today.

---

## 2. Cross-Sell Quote Blockers — Dropped Off the April 7 Digest Without Resolution

**Source:** [Notion Meeting Notes — Cross-Sell Quote Indication](https://www.notion.so/329b9be2b0f38064b3bffbf63e4bd654)

This item appeared through April 6 and then silently dropped from the April 7 digest. Three concrete blockers were preventing retail agents from binding end-to-end through the wholesaler portal:

1. White-label branded URL / logo / theme not resolving correctly
2. Surplus fees and license numbers missing from coverage pages and PDF invoices
3. Pro-rating using submission date instead of effective date

The connectivity call scheduled for the week of March 24 was the last known action. Items that disappear from digests without an explicit resolution are higher risk than items that stay on the list — they become nobody's job. Worth a direct status check.

---

## 3. Dual Auth Failures — The Shared Root Cause Has Never Been Investigated

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — MCP `invalid_token` / `Field required` post-March 20 deploy
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Six days of digests have noted these two failures running in parallel. Six days of digests have also noted that they *may share a root cause* — token expiry, an auth middleware regression, or an OAuth scope change. What none of the digests show is anyone having actually compared the two. Nacho investigated the MCP side (DP1-3222 still open); the frontend 401s appear to be on a separate track. The interesting angle here isn't "are these resolved?" — it's that the potential for a single fix to close both has been visible for a week and apparently not acted on.

---

## 4. Salesforce Cutover — `ignore_signals` Is Testable Right Now

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

The architectural inversion (Django Admin read-only for broker data; Salesforce as write origin via `BrokerInboundSyncService`) has been in every digest since March 31. The risk has been described consistently: `ignore_signals` must be airtight or welcome emails fire on every sync. The interesting observation for today is that this is not an unknowable risk — `ignore_signals` coverage is *testable*. A targeted test exercising the sync endpoint while asserting no email signals fire would either confirm the gate is closed or surface the gap before cutover. If that test doesn't exist, writing it is the most concrete pre-launch action available.

---

## 5. Kubernetes EKS v1.31 Upgrade — Runbook Updated March 26, Status Unknown

**Source:** [Notion — Kubernetes EKS Auto+v1.31 Upgrade Runbook](https://www.notion.so/counterpart/307b9be2-b0f3-807e-bd5f-e4641ab156a7)

This appeared in the March 30 digest and then disappeared — not because it was resolved, but because larger items crowded it out. The runbook was updated March 26 (13 days ago), which typically signals an imminent or in-progress operation. Includes cert-manager v1.20.0 steps, CRD handling, and CoreDNS version changes (v1.11.1 → v1.11.3). Three open questions worth answering: Has the upgrade already run? If not, what's the current schedule? And are there services that need prep work before the node roll? EKS upgrades are the kind of infrastructure event where surprises come from services nobody checked in advance.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
