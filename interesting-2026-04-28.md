# 5 Interesting Things — April 28, 2026

---

## 1. Urgent Production Bug: MPL Tab Missing in Mods (Prod Only)

**Source:** Linear — [INT-410](https://linear.app/counterpart/issue/INT-410/the-mpl-tab-is-not-showing-up-in-mods-just-in-prod) (Urgent) + [INT-409](https://linear.app/counterpart/issue/INT-409/mods-needs-mpl-tab) (High), filed this morning

Two linked issues landed in the Internal Programs queue within 15 minutes of each other. The MPL tab is not appearing in the mods view — **production only**. Alberto diagnosed the root cause: production reads from V1 questions directly instead of from program configuration, while QA has the V1 questions available on both paths. The fix is to prefer program configuration when it's active for the application. This is blocking MPL 2.0 submissions in prod today.

---

## 2. Friday Demo: Midterm Change Gateway Flow (Your Branch, Created Today)

**Source:** Linear — [DP1-3381](https://linear.app/counterpart/issue/DP1-3381/midterm-change-discovery-gateway-demo) (High, created today)

A new High-priority ticket dropped today scoped specifically for the Friday demo: a working midterm change request going through the gateway and returning a response. Explicitly **no orchestrator, no Absurd, no queue** — demo scope only. The gateway's pipeline infrastructure (PR #476 / DP1-3307) already supports registering custom handlers, so the work is self-contained. The branch name is already assigned to Julian. Given the demo is ~48 hours away, this is the most time-sensitive item in the queue right now.

---

## 3. Two of Your Own PRs Have Gone Stale — And One More Is Waiting for You

**Source:** Slack — [#bluelabel-github-notifications](https://yourcounterpart.slack.com/archives/C08BRAYM1EE/p1777392541944529), [#tech-frontend-crew](https://yourcounterpart.slack.com/archives/C08R9MCVDD2/p1777316160303479)

The daily review reminders show two PRs authored by you sitting without a merge:

- **[#8483](https://github.com/counterpart-inc/counterpart/pull/8483)** `fix(INOPS-548): Prevent selecting AI Suggested header and separator in dropdowns` — **12 days old, 5 days stale**, waiting on you for self-review/merge.
- **[#8591](https://github.com/counterpart-inc/counterpart/pull/8591)** `perf(DP1-3309): list_applications correctness + index + N+1 fixes` — **3 days old, stale**, waiting on you.

In addition, Romário tagged you directly in #tech-frontend-crew on **[PR #8603](https://github.com/counterpart-inc/counterpart/pull/8603)** yesterday afternoon.

---

## 4. UAS ZIP Pipeline Being Replaced with Lightweight JSON Fetch — Follow-on to the OOM Fix

**Source:** Linear — [TEC-5757](https://linear.app/counterpart/issue/TEC-5757/uas-consume-json-index-from-cms-replace-zip-flow) (High, created today by Leonardo)

Last week's UAS v2026.04.24-01 release included a memory fix (DO-863) that switched ZIP handling to use temporary files to prevent OOMKilled pod crashes. This new ticket goes a step further: **eliminate the ZIP download entirely** and replace it with a direct JSON fetch from the CMS using `FileSchema.cms_s3_file_path`, which already exists in the schema. The PDF service would take ownership of fetching ODT files from S3 directly — UAS only passes the S3 URL and rendering context. This is a meaningful simplification of the CMS ingestion path and reduces both memory footprint and operational complexity.

---

## 5. Your Eval Proposal Was Reviewed and Diagrammed — Fixture Schema Is Next

**Source:** Linear — [DP1-3404](https://linear.app/counterpart/issue/DP1-3404/review-julians-eval-proposal-and-design-diagram) (Done today) → [DP1-3330](https://linear.app/counterpart/issue/DP1-3330/fixture-schema-and-capture-system) (Todo, 5 pts, M2)

Larissa completed the review of your AI agent eval proposal today (DP1-3404 is marked Done), and has designed the Miro architecture diagram based on it. That closes out M1 of the AI Agent Eval Framework. The next milestone — **M2: Eval Framework Foundation** — opens with DP1-3330: designing and implementing per-agent fixture schemas (`GatewayFixture`, `OrchestratorFixture`, `AgentFixture`, `WorkflowFixture`) plus a `@capture_fixture` decorator with multi-step workflow capture support. At 5 points it's the largest single item in the eval project. Worth coordinating with Larissa on how the Miro diagram maps onto the fixture types before starting implementation.

---

_Sources: Linear ([linear.app/counterpart](https://linear.app/counterpart)), Slack ([yourcounterpart.slack.com](https://yourcounterpart.slack.com)), GitHub ([github.com/counterpart-inc/counterpart](https://github.com/counterpart-inc/counterpart))_
