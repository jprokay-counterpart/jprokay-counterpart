# 5 Interesting Things to Focus On
_Generated 2026-04-26_

---

## 1. Auth Bug Affecting 231 Users — Nearly Ready to Ship
**Source:** Linear · [BRS-355](https://linear.app/counterpart/issue/BRS-355/broker-services-expired-sessions-fire-unauthenticated-api-requests) · Status: Ready for Release

When a broker's session expires, the app silently fires API requests without an `Authorization` header instead of redirecting to login — causing a flood of unhandled 401 rejections across `/api/brokers/profile` and `/api/brokers/dashboard_quotes/`. **12,278 events, 231 users affected** as of April 24. The fix is marked Ready for Release but hasn't shipped yet — worth nudging to get this out the door.

---

## 2. MPL 2.0 Launch — Did Thursday Happen?
**Source:** Slack · [#2026q1-mpl-relaunch](https://yourcounterpart.slack.com/archives/C0A53348AM7/p1776706248320199)

On April 20 the team declared MPL 2.0 _must_ launch by Thursday (April 24) with a channel-wide `<!channel>` alert. Two blockers were called out: a CMS validation timeout blocking the final forms batch, and E2E testing gated behind that fix. Stanley Wang also opened [a PR](https://github.com/counterpart-inc/counterpart/pull/8550) to patch historical mapping keys before launch. It's now past Thursday — worth confirming whether MPL 2.0 shipped or is still pending.

---

## 3. Broker Portal saveAnswer Errors — Still in Triage
**Source:** Linear · [BRS-357](https://linear.app/counterpart/issue/BRS-357/broker-portal-unhandled-promise-rejection-when-saveanswer-network) · Status: Triage

Rapid interactions on the application coverage page fire concurrent `saveAnswer` POST requests; when one gets cancelled by the browser, an `AxiosError: Network Error` (status 0) surfaces as an unhandled promise rejection. **2,055 occurrences, 129 users affected** since March 10. This one is still in Triage with no recent activity — it's a reliability issue on a core user flow that deserves prioritization.

---

## 4. Agentic UW Assistant — Endorsement Workflow Design Under Discussion
**Source:** Slack · [#agentic-underwriting-assistant](https://yourcounterpart.slack.com/archives/C0AT9R6442V/p1776804240812609)

On April 21 the team debated how much autonomy the Claude-powered endorsement tool should have. The key question: should the AI ask for confirmation before processing a mid-term address change, or should REs have already cleared UW implications before forwarding? Justin Park proposed a cleaner split — broker/RE handles UW questions first, _then_ hands off to the AI — which has real implications for how the workflow is built. This is an open design decision worth aligning on before more of the workflow is coded.

---

## 5. Similar Companies 2.0 — Re-embedding Underway
**Source:** Linear · [DS1-6754](https://linear.app/counterpart/issue/DS1-6754/re-generate-company-documents-and-embeddings) · Status: In Progress (Urgent)

The data science team is re-generating company documents and embeddings as part of the Q2 Similar Companies 2.0 project. Work is reading from Databricks/Snowflake (no direct prod DB access), reprocessing similar companies using heuristics and a Looker report, then comparing results. The code from this ticket will also serve as the reference implementation for future Django signal-triggered re-encoding. Started April 25 — active right now.
