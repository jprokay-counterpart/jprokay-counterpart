# 5 Things to Focus On — 2026-04-23

---

## 1. Subjectivity Breaking in MPL 2.0 — Regression Bug in Triage

**Source:** [INOPS-568 · Linear](https://linear.app/counterpart/issue/INOPS-568/subjectivity-failing-mpl-20)

The move to the new claims question in MPL 2.0 left `coverage_claims` as null for some applications, which causes subjectivity logic to throw. This is actively blocking QA on a high-priority launch milestone. It's sitting in **Triage** with no assignee — someone needs to own it.

Also related: **[INT-380](https://linear.app/counterpart/issue/INT-380/answers-v3-not-showing-in-qa)** — the Answers v3 page isn't rendering at all for several QA accounts, filed today and also unstarted.

---

## 2. Autoquote Not Returned to Broker on Digital Submission

**Source:** [BRS-334 · Linear](https://linear.app/counterpart/issue/BRS-334/update-submission-workflow-to-wait-for-autoquote)

When a broker submits digitally and the account is autoquotable, they're still seeing the "Under Review" page instead of a live quote. That's a direct revenue leak — the quote is ready but the user never sees it. This is **Urgent, In Progress** assigned to Haziel Sánchez. Worth checking if there's a specific timing/polling threshold decision pending.

---

## 3. UW Agent System Architecture Proposal — Updated Today

**Source:** [UW Agent System — Architecture Proposal (Draft) · Notion](https://www.notion.so/341b9be2-b0f3-81cf-b446-e06a2ab6eaab)

Julian Prokay's architecture proposal for the UW Agent System was updated today and is marked **Draft — For Review**. This is the foundational design doc for how AI agents plug into the underwriting workflow. If major architectural decisions are being made here, now is the time to weigh in before it gets built out.

---

## 4. Admitted CNR 65-Day Automation Fired — Compliance Notice Needed Today

**Source:** [#admitted-conditional-nonrenewal-request · Slack](https://yourcounterpart.slack.com/archives/C0AUJ7A66AJ/p1776953470833509)

The automated CNR alert system posted a live compliance notice this morning for **OC Milford Gardens LLC** (MA, effective 2026-06-27, 65 days out). Justin Park is the assigned UW. This is a real compliance deadline — MA requires 45 days minimum notice under M.G.L. c. 175, § 187C. If the CNR isn't issued, the carrier is stuck renewing at existing terms regardless of risk.

---

## 5. AI Agent Eval Framework — Large New Epic Landed Today

**Source:** [DP1-3328 · Linear (Epic: Per-Agent Eval Framework)](https://linear.app/counterpart/issue/DP1-3328/epic-per-agent-eval-framework)

A coordinated batch of ~15 issues was created today under the **AI Agent Eval Framework** project, covering a 5-layer evaluation model: Gateway intent classification → Orchestrator routing → per-agent outputs → end-to-end workflow. Highlights:

- **[DP1-3335](https://linear.app/counterpart/issue/DP1-3335/ci-integration-for-agent-evaluation)** — CI integration is flagged **Urgent** (fail CI if Gateway F1 < 0.90, workflow completion < 0.95)
- **[DP1-3344](https://linear.app/counterpart/issue/DP1-3344/shadow-mode-evaluation-pattern)** — Shadow mode eval to run agent in parallel with human underwriters on live submissions
- **[DP1-3343](https://linear.app/counterpart/issue/DP1-3343/counterfactual-testing-framework)** — Counterfactual testing (what happens when we inject a $400K claim?)

This is a big investment. Worth a sync to align on sequencing before parallel work starts.
