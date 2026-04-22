# 5 Interesting Things — 2026-04-22

## 1. Axios Supply Chain Attack Caught and Pinned (SEC-91)

**Source:** [#engineering-releases](https://yourcounterpart.slack.com/archives/C08L5NDM0GZ)

Axios `1.14.1` was identified as carrying a potential supply chain attack. The team pinned the dependency back to `1.13.6` and shipped a hotfix (SEC-91). Worth following up on: it's unclear if a full audit was done of what `1.14.1` may have touched before the pin, and whether a formal post-mortem was published.

---

## 2. Two Production Incidents in 10 Days — One RCA Still Pending

**Source:** [#general_all](https://yourcounterpart.slack.com/archives/CJ95MNR5H)

- **April 9–10:** Overnight outage — submissions stopped being processed. Declared stable at 10:30am CST the next day.
- **April 20:** A Netlify configuration change broke the frontend (Ron Alexssen linked the RCA thread from Eli Evans, who confirmed it was a Netlify-side change). Full post-mortem promised "later this week" — still pending.

Two incidents in 10 days is a pattern worth examining. The Netlify one suggests infra config changes may lack sufficient staging validation or change control.

---

## 3. New Bug: Runoff/ERP Revert Permanently Blocks Midterm Transactions (UW-506)

**Source:** [Linear — UW-506](https://linear.app/counterpart/issue/UW-506/runoff-and-erp-revert-support)

Created today, High priority, assigned to Leonardo Vanzella. After processing a Runoff or Cancel/ERP and then reverting it, the policy is stuck — midterm transactions are blocked as if the policy is still in Runoff/ERP state. This is a child of the active Reversal Transaction initiative ([UW-281](https://linear.app/counterpart/issue/UW-281/implement-reversal-transaction)), meaning the revert feature shipped before this edge case was accounted for.

---

## 4. UW Agent System Architecture + "Agent-Ready Codebase" Initiative Heating Up

**Sources:**
- [UW Agent System — Architecture Proposal (Draft)](https://www.notion.so/341b9be2b0f381cfb446e06a2ab6eaab)
- [Research Agent Deepdive](https://www.notion.so/346b9be2b0f3819b9dc9ed2e2fcf367c) — Julian Prokay, April 17
- [Agent-Ready Codebase: Top 5 Priorities](https://www.notion.so/344b9be2b0f381628277cba67acb87ae) — updated today

The team is actively designing an AI agent system for underwriting. Key architectural decision: using Postgres `FOR UPDATE SKIP LOCKED` as a distributed task queue. The Research Agent Deepdive was published last week and the Agent-Ready Codebase priorities doc was updated today — this is moving from design into active implementation planning.

---

## 5. Three Competing Salesforce EmailMessage Apex Triggers Firing in Undefined Order (EMP-1085)

**Source:** [Linear — EMP-1085](https://linear.app/counterpart/issue/EMP-1085/salesforce-claims-consolidate-emailmessage-triggers-into-single)

The Claims Salesforce org has three separate Apex triggers on `EmailMessage` with no guaranteed execution order:
1. `EmailMessage.trigger` → `EmailTrackingLinker.link()`
2. `EmailMessageTrigger.trigger` → tracking linker, FNOL threading override, adjuster service
3. A third trigger for first-read status

This is an 8-point High priority issue currently In Progress. It represents a latent correctness risk — claims email routing and adjuster assignment may behave unpredictably depending on which trigger fires first. Consolidation into a single handler is underway.
