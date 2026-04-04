# 5 Interesting Things to Focus On

_Synthesized 2026-04-04 from Sentry, Linear, Slack, and Notion_

---

## 1. Two Auth Failures Running in Parallel — Possible Shared Root Cause

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — Production MCP `invalid_token` / `Field required` errors
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Two auth failures have been live simultaneously for several days: brokers hitting 401s before they can start an application, and the production underwriting guidelines MCP returning `invalid_token` after the March 20 deploy. Nacho investigated an OAuth scope issue on the MCP side but DP1-3222 is still open. These may share a root cause — token expiry, an auth middleware change, or an OAuth scope regression — and are worth comparing before treating as independent tracks.

---

## 2. N+1 Query Hammering 87 Users — Five Days Running

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

This issue has appeared in every digest since March 30 and is still unresolved: **2,401 events in 24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/`. It's the highest user-count open issue in Sentry and a straightforward `select_related` / `prefetch_related` fix. Five days of drift on a known, fixable performance issue is notable.

---

## 3. Salesforce Source-of-Truth Cutover — `ignore_signals` Is the Landmine

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

Django Admin goes read-only for broker data; Salesforce becomes the write origin via the new `BrokerInboundSyncService`. Four feature flags gate the cutover sequence. The highest-risk pre-go-live item is signal suppression — a gap in `ignore_signals` will spam users with welcome emails on every sync. This is the highest-stakes coordination item currently in flight.

---

## 4. LiteLLM Supply Chain Attack — Audit Confirmation Pending

**Sources:**
- [Slack #ai-security](https://yourcounterpart.slack.com/archives/C_ai-security) (March 25)
- [LiteLLM Supply Chain Attack writeup](https://www.comet.com/site/blog/litellm-supply-chain-attack/)

Chad Nierenhausen flagged a Python supply chain attack targeting LiteLLM on March 25. Required actions: (1) audit all codebases for direct and transitive LiteLLM dependencies, (2) rotate any API keys that could have been exfiltrated. This item has not resurfaced in subsequent digests — likely handled, but worth confirming the audit closed and key rotations completed. Given the number of LLM provider keys in play, an unconfirmed exposure here would be high severity.

---

## 5. Backend Agents Scope Is Undefined While Builds Accumulate

**Sources:**
- [Slack #data-eng](https://yourcounterpart.slack.com/archives/C05N9KSDM5K/p1773114744252699) (March 9 — Newton: "backend agents are the most important near-term AI platform workstream")
- [Slack #agentic-underwriting-action-pod](https://yourcounterpart.slack.com/archives/C09E3N47W2J/p1773342856521479)
- [Linear TEC-5427](https://linear.app/counterpart/issue/TEC-5427/support-mods-and-schedule-factors-should-not-be-global) — mods displaying incorrectly across quote versions

The field team is already requesting auto-UW summarization via Slack, the policy binder is nearly production-ready (Tiffany finishing QA, Ben flipping the flag), and TEC-5427 is blocking a clean multi-quote experience. Yet the AI platform scope — UAS MCP, Backend Agents, Observability, Evaluations — has no formal definition. Without it, ad-hoc builds will keep landing without architectural coherence.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
