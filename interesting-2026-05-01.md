# 5 Interesting Things — May 1, 2026

---

## 1. 🎉 Series C Press Wave Still Rolling
**Source:** [#general_all](https://yourcounterpart.slack.com/archives/CJ95MNR5H)

The $50M Series C (led by Valor Equity Partners) is generating ongoing press. Tanner posted a roundup of 11 publications including Forbes, Axios, The Insurer, and Fintech Global — all framing Counterpart around "Agentic Insurance™" and AI-era employment risks. Worth reading the [Forbes piece](https://www.forbes.com/sites/boazsobrado/2026/04/28/insurance-is-failing-small-businesses--spacex-backers-bet-50m-on-ai/) for how the company is being positioned externally.

---

## 2. 🔴 Urgent: UW Authority Guidelines V2 Attributes Not Exposed in Production
**Source:** [Linear INT-444](https://linear.app/counterpart/issue/INT-444/uw-authority-guidelines-v2-attributes-not-exposed-in-valid-context)

Opened today, Urgent priority, In Review. V2 attributes like `professional_service_table` are available in QA but not exposed as valid context variables in production UW authority guidelines. This is directly blocking use of the new attribute set that shipped with MPL2.0 + ISOGL (which went live Monday).

---

## 3. 🐛 Date Truncation Bug: "202-05-01" Timestamp Causing 5,400+ Errors
**Source:** [Sentry COUNTERPART-BACKEND-DJANGO-CQ](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-CQ)

The year `2026` is being truncated to `202` somewhere upstream, causing `Out of bounds nanosecond timestamp: 202-05-01 00:00:00` crashes across the Digital Risk datapool endpoint (5,448 events, 18 users). The same root cause surfaces in:
- [MODEL-EVALUATION-1P](https://counterpart.sentry.io/issues/MODEL-EVALUATION-1P) — digital-risk-production, 11 events
- [DATAPOOL-SERVERLESS-69J](https://counterpart.sentry.io/issues/DATAPOOL-SERVERLESS-69J) — 9 events

Likely a single date formatting call missing a digit in the year — high ROI to track down.

---

## 4. ⚠️ Production Incident Retrospective: April 27–28 Outage + Bug Bash Fridays
**Source:** [#general_all — Ron Alexssen](https://yourcounterpart.slack.com/archives/CJ95MNR5H) · [Post-mortem doc](https://docs.google.com/document/d/1UFInryqrY62PafqiZw9kE6M0NhAMKuZStxSKT2CWQ6s/edit)

A deployment at 10:59pm PT on April 27 prevented Data Entry from starting new applications overnight. Three concrete remediation items: (1) after-hours escalation process, (2) E2E test coverage for Data Entry + LOBO workflows, (3) fix QA/production config parity. Engineering also launched **Bug Bash Fridays** — every Friday the full eng team focuses exclusively on finding and fixing errors until a stable baseline is reached.

---

## 5. 📐 UW Agent System Architecture — Active Draft Under Review
**Source:** [Notion — UW Agent System Architecture Proposal](https://www.notion.so/counterpart/341b9be2-b0f3-81cf-b446-e06a2ab6eaab)

A draft architecture proposal for the UW Agent System is circulating (updated April 24), backed by a [Research Agent Deepdive](https://www.notion.so/counterpart/346b9be2-b0f3-819b-9dc9-ed2e2fcf367c) from Julian Prokay (April 17) and an [Agent-Ready Codebase: Top 5 Priorities](https://www.notion.so/counterpart/344b9be2-b0f3-8162-8277-cba67acb87ae) doc. The proposal mentions Temporal as a fallback workflow engine. Given the Series C narrative around agentic insurance, this is the core technical bet to track.
