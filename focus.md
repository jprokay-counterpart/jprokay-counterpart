# 5 Things to Focus On

_Generated 2026-03-30 from Slack, Notion, and Linear_

---

## 1. Production MCP Cannot Connect (DP1-3222)

**Source:** [Slack #2026q1-underwriting-guidelines-agent](https://yourcounterpart.slack.com/archives/C09TB9LC739/p1774036208289639) · [Linear DP1-3222](https://linear.app/counterpart/issue/DP1-3222/prod-mcp-cannot-connect)

The production underwriting guidelines MCP server broke after a deploy on March 20 — users are getting `invalid_token` / `Field required` auth errors. You were pinged directly. Nacho took point on debugging an OAuth scope issue, but the ticket is still open. Worth confirming this is fully resolved in prod before more agents depend on it.

---

## 2. Agentic UW Pod: Policy Binder + Multi-Quote Mods Bug

**Source:** [Slack #agentic-underwriting-action-pod](https://yourcounterpart.slack.com/archives/C09E3N47W2J/p1773342856521479) · [Linear TEC-5427](https://linear.app/counterpart/issue/TEC-5427/support-mods-and-schedule-factors-should-not-be-global)

Three live items from the March 12 pod recap:
- **Policy binder** is nearly production-ready — Tiffany is finishing QA validation, then Ben flips it on. Close to the finish line.
- **Multi-quote mods display bug** (TEC-5427): mods set on one quote version incorrectly show on other versions. Ben is investigating; likely requires a rating call on version switch.
- **Snapshot-on-approval** was flagged as increasingly important for audit clarity — worth getting on the backlog formally.

---

## 3. Backend Agents for Auto-UW Summarization

**Source:** [Slack #data-eng](https://yourcounterpart.slack.com/archives/C05N9KSDM5K/p1773114744252699)

Newton flagged on March 9 that **backend agents are the most important near-term AI platform workstream** — the field team is already asking for auto-UW to summarize referrals and approvals via Slack. This needs to be scoped as part of the broader auto-action architecture before ad-hoc builds pile up. The AI platform discussion was revisiting four topics: UAS MCP, Backend Agents, Observability, and Evaluations.

---

## 4. Salesforce MCP Integration

**Source:** [Slack #emerging-products](https://yourcounterpart.slack.com/archives/C089Q68S484/p1772566746527019)

You were CC'd on this discussion (March 3). Vinicius scheduled a follow-up call on Salesforce MCP, describing it as "an important topic" that may need several meetings before a final solution is chosen. No decision has been surfaced yet — worth checking where this landed and whether a path forward has been agreed.

---

## 5. Kubernetes EKS Auto+v1.31 Upgrade Runbook

**Source:** [Notion — Kubernetes EKS Auto+v1.31 Upgrade Runbook](https://www.notion.so/counterpart/307b9be2-b0f3-807e-bd5f-e4641ab156a7)

This runbook was updated 4 days ago (March 26), suggesting the upgrade is either in progress or imminent. Includes cert-manager v1.20.0 steps and CRD handling. If you're involved in infra, worth a read to know what's live or coming — and whether any services you own need prep work.
