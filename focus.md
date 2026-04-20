# 5 Things to Focus On — April 20, 2026

---

## 1. MPL 2.0 Launch Is at a Go/No-Go Decision Point

**Source:** [Slack #2026q1-mpl-relaunch](https://yourcounterpart.slack.com/archives/C0A53348AM7/p1776201297711009)

Two active bugs are blocking launch:

- **[INT-343](https://linear.app/counterpart/issue/INT-343/professional-service-pushing-null-to-rating-from-uas)** — Professional Service table intermittently pushing `null` to the rating engine, blocking MPL 2.0 pricing on new accounts.
- **[INT-342](https://linear.app/counterpart/issue/INT-342/professional-title-error-req-error-v1)** — Allied Health conditional was accidentally removed, blocking pilot car submissions. Alberto is fixing.

The team locked in two options: Thursday AM push (if all critical bugs resolved by Wednesday EOD) or Monday AM push at the absolute latest. These two bugs are what stand between you and shipping.

---

## 2. N+1 Query Explosion on Admin Application Pages

**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

An N+1 query on `/admin/application/application/{object_id}/growth_opportunities/` has hit **60 users and 1,373 events in the last 23 hours** — and was seen less than a minute ago. This is the highest-volume performance issue in the system right now and is almost certainly slowing down underwriter workflows every time the growth opportunities tab loads.

---

## 3. Rating Engine Is Returning 403 Forbidden in Production

**Sources:** [COUNTERPART-BACKEND-DJANGO-9AF](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-9AF) · [COUNTERPART-BACKEND-DJANGO-51W](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-51W) · [COUNTERPART-BACKEND-DJANGO-36V](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-36V)

Three separate Sentry issues (6 users, ~24 total events) show `403 Client Error: Forbidden` from the production rating engine Lambda (`vux6m0gc96.execute-api.us-west-2.amazonaws.com/production/calculate-premium`). They all surface on the score/guidelines page. This may be an expired or misconfigured IAM credential — worth ruling out quickly since premium calculation is core to quoting.

---

## 4. Agent-Ready Codebase: Top 5 Priorities

**Source:** [Notion — Agent-Ready Codebase: Top 5 Priorities](https://www.notion.so/344b9be2b0f381628277cba67acb87ae) *(Julian Prokay, April 16, 2026)*

You published this 4 days ago. The short version: the codebase isn't ready for agents or non-engineers to work with effectively. The five investments, ordered so each enables the next:

1. **One-command dev environment** — `make dev` to spin everything up; no credential gymnastics
2. **Split the mega-files** — `quote/models.py` is 10,647 lines; `application/models.py` is 4,860 lines
3. **Per-app CLAUDE.md docs** — only 2 exist today; agents working in `quote` have no domain context
4. **Service integration test layer** — no middle ground between unit tests and slow Playwright E2E
5. **Sentry custom spans** — we pay for Sentry but have zero custom spans; agents can't self-diagnose

This is the strategic scaffolding for everything else you want to do with AI in the product.

---

## 5. UW Agent System Architecture Proposal (Draft)

**Source:** [Notion — UW Agent System Architecture Proposal](https://www.notion.so/341b9be2b0f381cfb446e06a2ab6eaab) *(Julian Prokay, April 13, 2026)*

A draft proposal for moving the auto-underwriting capability out of Cowork (Anthropic's general-purpose AI workspace) and into a native Counterpart integration. The core argument: the UW logic works well and underwriters who've adopted it find it valuable, but Cowork's adoption curve is steep for people who just want to underwrite — not learn a new AI platform. The proposal outlines building the agent capability directly into the product with a dedicated MCP server, giving underwriters the AI assistance without the context-switching.

This is your next big architectural decision on the AI side of the product.
