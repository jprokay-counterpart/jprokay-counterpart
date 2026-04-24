# 5 Things to Focus On — 2026-04-24

---

## 1. MPL 2.0 + ISOGL Production Launch is Go

**Source:** [INT-266 — Move to Production (MPL 2.0 + ISOGL + Program Questions)](https://linear.app/counterpart/issue/INT-266/move-to-production-mpl-20-isogl-program-questions-checklist)

This checklist just flipped to **In Progress** today. It's the culminating production push for the MPL 2.0 + ISOGL initiative — covering questions (v1), program configuration, and rating tables. Several related issues shipped or merged in the last 24 hours (INT-385: EBL/HNOA default fix; INT-369: read-only answers-context crash; INT-340: question consolidation cancelled). Worth confirming which checklist steps are still open and whether there are any blocking dependencies before marking items complete.

---

## 2. Foundational AI Agent Framework: Superclass + Transport Spike

**Sources:**
- [DP1-3304 — Agent "Superclass"](https://linear.app/counterpart/issue/DP1-3304/agent-superclass) *(In Progress — High)*
- [DP1-3363 — Spike: orchestrator-to-agent transport POC](https://linear.app/counterpart/issue/DP1-3363/spike-orchestrator-to-agent-transport-poc) *(Backlog — High, created today)*
- [DP1-3312 — Intent Agent (quarantined planner LLM)](https://linear.app/counterpart/issue/DP1-3312/intent-agent-quarantined-planner-llm) *(Backlog)*

The Background Agent Framework POC milestone has two concurrent high-priority threads. The Superclass (Pydantic AI mini-framework with versioning, observability, prompt templating) is actively being built. Today a new spike landed asking whether the orchestrator-to-agent transport should be **queue-based async** (KEDA scaling), **in-process async**, or **sync HTTP** — a foundational architectural decision that will shape everything downstream. The Intent Agent (quarantined, no-tools planner with Spotlighting against prompt injection) is waiting on these decisions.

---

## 3. HIPAA Posture Investigation is Blocking the Agent Gateway

**Source:** [DP1-3320 — [DevOps] HIPAA posture investigation for Agent Gateway](https://linear.app/counterpart/issue/DP1-3320/devops-hipaa-posture-investigation-for-agent-gateway)

The 26Q2 Agent Gateway will handle inbound requests from brokers referencing claims and PHI. A HIPAA posture investigation (BAA with DevOps in flight) is sitting in **Backlog** with no assignee. Until this is resolved, the gateway can't safely handle real broker traffic. This is a quiet blocker to the entire Agent Gateway project — worth getting someone on it now rather than later in the quarter.

---

## 4. High-Priority Bug: `'LIMIT'` Error in `/score/` + New Slow DB Query

**Sources:**
- [INT-388 — 'LIMIT' when doing /score/](https://linear.app/counterpart/issue/INT-388/limit-when-doing-score) | [Sentry: COUNTERPART-BACKEND-DJANGO-510](https://counterpart.sentry.io/issues/6113364804/?referrer=Linear)
- [BRS-354 — Slow DB Query](https://linear.app/counterpart/issue/BRS-354/slow-db-query) | [Sentry: COUNTERPART-BACKEND-DJANGO-CV1](https://counterpart.sentry.io/issues/7438497833/?referrer=Linear)

A recurring SQL-related error (`'LIMIT'`) is hitting the scoring endpoint — escalated to **High / In Progress** today. A separate slow DB query from Sentry also just entered triage today (BRS-354). Two DB-layer issues surfacing on the same day during a major production launch is worth watching closely.

---

## 5. Broad XSS Security Hardening Landed Across the Broker Portal

**Sources:** [#engineering-releases](https://yourcounterpart.slack.com/archives/C08L5NDM0GZ) | [SEC-91 — axios supply chain pin](https://counterpart.sentry.io)

The recent releases shipped a significant security sweep:

- **DOMPurify** added to sanitize `dangerouslySetInnerHTML` in `StartApplication`, `AutoCompleteField`, `LogicalModals`, `QuestionRender.tsx`, `BrokerEmail`, and `UnderwritingGuidelinesSerializer` (backend via `bleach`)
- **Unsafe `as` casts** replaced with type guards to prevent TypeScript error masking
- **axios pinned to 1.13.6** to block the supply chain attack that shipped in 1.14.1

This is a meaningful hardening milestone. Worth verifying whether any other `dangerouslySetInnerHTML` usages or `parse()` calls remain unsanitized in the codebase — the sweep was broad but may not be exhaustive.
