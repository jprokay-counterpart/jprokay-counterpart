# 5 Interesting Things — April 30, 2026

---

## 1. 🎉 Counterpart Raises $50M Series C

Counterpart closed a $50M Series C round, backed by SpaceX investors. The announcement went live yesterday (April 29) with a broker email blast, a Forbes feature, and a LinkedIn post.

- [Slack announcement in #marketing](https://yourcounterpart.slack.com/archives/C02KD22UFNG/p1777492138020299?thread_ts=1777492138.020299&cid=C02KD22UFNG)
- [Blog post](https://blog.yourcounterpart.com/blog/counterpart-raises-50m-series-c/)
- [Forbes feature](https://www.forbes.com/sites/boazsobrado/2026/04/28/insurance-is-failing-small-businesses--spacex-backers-bet-50m-on-ai/)

---

## 2. 🔥 Production: warm_policy_cache KeyError Storm (~5,000+ events today)

At least 10 separate Sentry issues all trace back to the same culprit — `glacier.policy.tasks.warm_policy_cache` — throwing `KeyError: UUID(...)` errors. The storm started ~23 hours ago and is still firing. No owner assigned to most of them.

Top issues by event count:

| Issue | Events |
|---|---|
| [ASPEN-DENTAL-CE](https://counterpart.sentry.io/issues/ASPEN-DENTAL-CE) | 2,104 |
| [ASPEN-DENTAL-PE](https://counterpart.sentry.io/issues/ASPEN-DENTAL-PE) | 1,552 |
| [ASPEN-DENTAL-PD](https://counterpart.sentry.io/issues/ASPEN-DENTAL-PD) | 1,253 |
| [ASPEN-DENTAL-CW](https://counterpart.sentry.io/issues/ASPEN-DENTAL-CW) | 466 |
| [ASPEN-DENTAL-D8](https://counterpart.sentry.io/issues/ASPEN-DENTAL-D8) | 177 |

Worth investigating whether a single missing UUID is the root cause across all of these.

---

## 3. ⚠️ Sentry: "Coverage effective date is None" — 8,578 events at the rate endpoint

[ASPEN-DENTAL-RD](https://counterpart.sentry.io/issues/ASPEN-DENTAL-RD) has fired 8,578 times in the past 23 hours at `/api/v1/policy/{account_id}/rate/`. A related cluster of the same error hits midterm-change, endorsements, and new-grad endpoints. Seer rates actionability as **medium**.

Related issues:
- [ASPEN-DENTAL-RB](https://counterpart.sentry.io/issues/ASPEN-DENTAL-RB) — GL level, 1,996 events
- [ASPEN-DENTAL-XM](https://counterpart.sentry.io/issues/ASPEN-DENTAL-XM) — new-grad answers, 668 events
- [ASPEN-DENTAL-RY](https://counterpart.sentry.io/issues/ASPEN-DENTAL-RY) — midterm-change, 252 events

---

## 4. 🐛 Lambda Cold-Start OOM After genai-api-client Migration

After the `genai-api-client` migration was deployed ([DP1-3294](https://linear.app/counterpart/issue/DP1-3294/build-shared-genai-context-manager-in-datapool-library)), the `grepsr-file` and `grepsr-validation` Lambda functions began timing out on every cold start. Root cause: importing `DefaultApi` loads a 17,800-line file into a 128 MB Lambda, exhausting memory before any request reaches the GenAI server.

The fix (increasing Lambda memory) is tracked in [DP1-3418](https://linear.app/counterpart/issue/DP1-3418/increase-memory-for-grepsr-and-genai-lambda-functions-using-genai-api) and is currently **In Progress** (Ignacio Grosso).

---

## 5. 🤖 Claims MCP Foundation — Sprint 2 Underway

The Emerging Products team is building an MCP gateway that gives Claude agents authenticated, read-only access to Salesforce claims data. Sprint 2 is fully scoped with 8 active tickets:

- [EMP-1056](https://linear.app/counterpart/issue/EMP-1056) — Trusted end-user identity + Salesforce account linking
- [EMP-1057](https://linear.app/counterpart/issue/EMP-1057) — OAuth PKCE `/authorize` + `/callback` endpoints
- [EMP-1058](https://linear.app/counterpart/issue/EMP-1058) — AES-256-GCM encrypted token vault
- [EMP-1059](https://linear.app/counterpart/issue/EMP-1059) — Per-user Salesforce REST client with token refresh
- [EMP-1060](https://linear.app/counterpart/issue/EMP-1060) — Connect `get_claim` tool to live Salesforce sandbox
- [EMP-1061](https://linear.app/counterpart/issue/EMP-1061) — Read-only gateway policy enforcement middleware
- [EMP-1062](https://linear.app/counterpart/issue/EMP-1062) — Salesforce Connected App allowlist
- [EMP-1064](https://linear.app/counterpart/issue/EMP-1064) — Seed sandbox with persistent demo claim (`CLM-DEMO-001`)

The GWS Gmail integration spike ([EMP-1033](https://linear.app/counterpart/issue/EMP-1033)) was also completed today, unblocking the agentic adjuster email workflow.
