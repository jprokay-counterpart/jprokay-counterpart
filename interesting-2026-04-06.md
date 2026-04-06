# 5 Interesting Things to Focus On

_Synthesized 2026-04-06 from Sentry, Linear, Slack, and Notion_

---

## 1. N+1 Query Is Now 7+ Days Unresolved — Urgency Escalating

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

This issue first appeared in digests on March 30 and has been present in every one since. **2,401 events/24h, 87 users** on `/admin/application/application/{object_id}/growth_opportunities/` — still the highest user-count open Sentry issue. It's a known `select_related` / `prefetch_related` fix, not a mystery. At seven-plus days of drift on a straightforward Django ORM change, the risk is normalization: the team stops seeing it as urgent. Worth calling explicitly: this one should already be closed.

---

## 2. Dual Auth Failures — Has Either Actually Closed?

**Sources:**
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148) — 401 errors on `/startapplication`, 425 events, 14 users
- [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect) — MCP `invalid_token` / `Field required` post-March 20 deploy
- [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639)

Two separate auth failures — broker 401s on application start and MCP `invalid_token` — have been open together since at least April 2. Both were still open as of the April 4 digest. Neither has resurfaced as resolved. These are worth a quick status check: is DP1-3222 closed? Are frontend 401s still firing? They may share a root cause (OAuth scope regression, token expiry, auth middleware change) and resolving one could unblock the other.

---

## 3. Salesforce Source-of-Truth Cutover — `ignore_signals` Is Still the Landmine

**Sources:**
- [Notion PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)
- [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

Django Admin becomes read-only for broker data; Salesforce becomes the write origin via `BrokerInboundSyncService`. Four feature flags gate the cutover sequence. The highest-risk pre-go-live item remains signal suppression — a gap in `ignore_signals` will spam users with welcome emails on every sync. This is the highest-stakes coordination item currently in flight and has appeared in every digest since March 31. If you're touching broker sync code, the `ignore_signals` correctness check and SyncID backfill are the critical path.

---

## 4. Cross-Sell Quote Blockers Dropped Off the Digest — Still Unresolved?

**Source:** [Notion Meeting Notes — Cross-Sell Quote Indication](https://www.notion.so/329b9be2b0f38064b3bffbf63e4bd654)

This item appeared through April 2 and then disappeared from subsequent digests — which may mean it was resolved, or may mean it quietly fell off the radar. Three blockers were preventing retail agents from binding end-to-end through the wholesaler portal: (1) white-label branded URL/logo/theme resolution, (2) surplus fees and license numbers missing from coverage pages and PDF invoices, (3) pro-rating using submission date instead of effective date. The agent connectivity call was flagged for "Tuesday" (March 24) — check whether that surfaced a path forward or whether these blockers are silently still open.

---

## 5. LiteLLM Supply Chain Attack Audit — Still No Confirmation

**Sources:**
- [Slack #ai-security](https://yourcounterpart.slack.com/archives/C_ai-security) (March 25)
- [LiteLLM Supply Chain Attack writeup](https://www.comet.com/site/blog/litellm-supply-chain-attack/)

Chad Nierenhausen flagged the LiteLLM Python supply chain attack on March 25. Required actions: audit all codebases for direct and transitive LiteLLM dependencies, rotate any API keys that could have been exfiltrated. This item has not resurfaced in any digest since — which probably means it was handled, but "probably" is a risk for a security item of this severity. Given the number of LLM provider keys in a platform like Counterpart, an unconfirmed exposure warrants an explicit close-out: who ran the audit, what did it find, and are the rotations documented?

---

_Sources: [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart) · [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so)_
