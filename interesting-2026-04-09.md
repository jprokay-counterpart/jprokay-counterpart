# 5 Interesting Things to Focus On

_Synthesized 2026-04-09 from Sentry, Linear, Slack, and Notion_

---

## 1. N+1 Query — Day 10, Still No Linear Ticket

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

**2,401 events/24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/` — the highest user-count open Sentry issue, now ten days running since it first appeared in the March 30 digest. The fix (`select_related` / `prefetch_related`) has been known the entire time. The April 8 digest called it "invisible by definition."

The interesting question today is structural: does this issue have a Linear ticket? Issues that live only in Sentry with no ticket assignee are nobody's explicit job. If it doesn't, creating one and assigning it is a five-minute action that changes the accountability picture entirely. If it does have a ticket, why is it still open ten days later?

---

## 2. Dual Auth Failures — The Side-by-Side Comparison Has Never Happened

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — MCP `invalid_token` / `Field required` post-March 20 deploy
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Seven digests have noted that these two failures may share a root cause. Seven digests have also noted that nobody has actually compared the two traces. This is now the most concrete action available on this item: pull the Sentry trace for `COUNTERPART-FRONTEND-148` and the DP1-3222 error logs side by side, look at the token lifecycle in both cases, and answer the question in one sitting. If they share a root cause, a single fix closes both. If they don't, at least the investigation is off the table and both tracks can move independently.

---

## 3. Salesforce Cutover — The `ignore_signals` Test Needs to Exist Before Cutover, Not After

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

The April 8 digest established that `ignore_signals` coverage is *testable right now*. The framing for today: if the Salesforce cutover is imminent and that test doesn't exist yet, writing it is the single most valuable pre-launch action available. The test is specific — exercise the `BrokerInboundSyncService` sync endpoint and assert that no welcome email signals fire. If it passes, confidence goes up. If it fails, you've caught the bug before it reaches production brokers. The window between "testable" and "cutover" is not infinite.

---

## 4. Policy Binder — Has It Shipped? If So, Backend Agents Scope Needs to Start Now

**Sources:**
- [Slack #agentic-underwriting-action-pod](https://yourcounterpart.slack.com/archives/C09E3N47W2J/p1773342856521479)
- [Slack #data-eng](https://yourcounterpart.slack.com/archives/C05N9KSDM5K/p1773114744252699)
- [Linear TEC-5427](https://linear.app/counterpart/issue/TEC-5427/support-mods-and-schedule-factors-should-not-be-global)

As of the April 7 digest, Tiffany was finishing QA on the policy binder and Ben was queued to flip the flag. That was two days ago. The binder may already be live. If it is, that's a significant milestone — and the natural moment to stop and formally define what "backend agents" actually means before the next build lands without a scope. Newton called this "the most important near-term AI platform workstream" on March 9. TEC-5427 (mods displaying incorrectly across quote versions) is still the open blocker for a clean multi-quote experience. The question worth asking today: has the binder shipped, and if so, is there a scope doc for what comes next?

---

## 5. LiteLLM Supply Chain Audit — 15 Days Without a Close-Out Is Itself a Finding

**Sources:**
- [Slack #ai-security](https://yourcounterpart.slack.com/archives/C_ai-security) (March 25)
- [LiteLLM Supply Chain Attack writeup](https://www.comet.com/site/blog/litellm-supply-chain-attack/)

Chad Nierenhausen flagged the LiteLLM Python supply chain attack on March 25. Required actions: audit all codebases for direct and transitive LiteLLM dependencies, rotate any API keys that could have been exfiltrated. This item has appeared in digests since April 3 without resolution. Today is day 15 since the flag was raised.

The framing shift for today: in a security audit context, an item that stays open 15 days without a documented close-out is not "probably handled" — it's an open finding. The absence of evidence isn't evidence of absence for key rotation. The close-out should document who ran the audit, what repos were checked, what the dependency graph showed, and whether any rotations were performed. If that documentation exists somewhere and just hasn't surfaced in this context, finding and linking it would close this out. If it doesn't exist, creating it is overdue.

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
