# 5 Interesting Things to Focus On

_Synthesized 2026-04-07 from Sentry, Linear, Slack, and Notion_

---

## 1. N+1 Query — Now 8+ Days Unresolved, Normalization Risk Is Real

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

This issue first appeared in digests on March 30 and has been in every one since. **2,401 events/24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/`. It remains the highest user-count open Sentry issue. The fix is known — `select_related` / `prefetch_related` — and is not a complex change. At 8+ days the real risk is psychological: the longer a known-fixable issue stays open, the more it becomes invisible background noise. This is the easiest win available and the one most at risk of never shipping.

---

## 2. Dual Auth Failures — Status Still Unconfirmed After 5 Days

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — MCP `invalid_token` / `Field required` post-March 20 deploy
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Both broker 401s on `/startapplication` and MCP `invalid_token` errors have appeared in every digest since April 2 with no confirmed resolution. Nacho investigated an OAuth scope issue on the MCP side but DP1-3222 is still open. With agents depending on MCP connectivity and brokers unable to start applications, both paths are actively user-impacting. The potential shared root cause — token expiry, OAuth scope regression, auth middleware change — makes this worth a coordinated status check rather than two parallel investigations.

---

## 3. Salesforce Cutover — `ignore_signals` Is Still the Go/No-Go Gate

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

The architectural inversion — Django Admin becoming read-only for broker data, Salesforce becoming the write origin via `BrokerInboundSyncService` — has been the most consequential coordination item in recent digests. Four feature flags gate the sequence. The single highest-risk pre-launch item remains signal suppression: `ignore_signals` must be airtight or every Salesforce sync will fire welcome emails to existing brokers. This item has persisted across every digest from March 31 through today. If you're in the broker sync code path, the SyncID backfill and `ignore_signals` coverage are the critical path items.

---

## 4. LiteLLM Supply Chain Attack — Explicit Close-Out Still Missing

**Sources:**
- [Slack #ai-security](https://yourcounterpart.slack.com/archives/C_ai-security) (March 25)
- [LiteLLM Supply Chain Attack writeup](https://www.comet.com/site/blog/litellm-supply-chain-attack/)

Chad Nierenhausen flagged the LiteLLM Python supply chain attack on March 25. Required actions were: audit all codebases for direct and transitive LiteLLM dependencies, and rotate any API keys that could have been exfiltrated. The item has not resurfaced in any digest — which probably means it was handled — but "probably" is the wrong standard for a supply chain compromise affecting LLM provider keys. Counterpart holds a significant number of LLM provider credentials. An explicit close-out documenting who ran the audit, what it found, and which keys were rotated is appropriate here.

---

## 5. Backend Agents Scope — Policy Binder Is Ready, Everything Else Isn't

**Sources:**
- [Slack #data-eng](https://yourcounterpart.slack.com/archives/C05N9KSDM5K/p1773114744252699) (March 9 — Newton: "backend agents are the most important near-term AI platform workstream")
- [Slack #agentic-underwriting-action-pod](https://yourcounterpart.slack.com/archives/C09E3N47W2J/p1773342856521479)
- [Linear TEC-5427](https://linear.app/counterpart/issue/TEC-5427/support-mods-and-schedule-factors-should-not-be-global)

The policy binder is near production-ready (Tiffany finishing QA, Ben flipping the flag) and the field team is already requesting auto-UW summarization via Slack. But TEC-5427 — mods displaying incorrectly across quote versions — is still blocking a clean multi-quote experience, and the broader AI platform scope (UAS MCP, Backend Agents, Observability, Evaluations) has no formal definition. An unscoped but actively-built workstream is how technical debt accumulates fastest. The binder shipping is a natural moment to stop and define what "backend agents" actually encompasses before the next build lands.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
