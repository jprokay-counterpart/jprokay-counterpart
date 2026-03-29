# 5 Things to Focus On — 2026-03-29

---

## 1. LiteLLM Supply Chain Attack — Security Action Required

**Source:** [#ai-security](https://yourcounterpart.slack.com/archives/C0AF85A87K8/p1774569276216009)

A Python LLM supply chain attack targeting **LiteLLM** is actively in the wild. Chad Nierenhausen flagged this on 2026-03-26 with 15 replies in thread.

**Actions needed:**
- Confirm neither your code nor any dependency pulls in `litellm`
- Rotate any API keys (OpenAI, Anthropic, etc.) that may have been exfiltrated

Reference: https://www.comet.com/site/blog/litellm-supply-chain-attack/

---

## 2. Critical Heartbeat Loop Bugs — DB Connection Leaks

**Source:** [DM Julian → Ron](https://yourcounterpart.slack.com/archives/D07QW7UHM8C/p1774568481447979)

A code review shared on 2026-03-26 identified **critical issues** in `apps/documentation/views.py` (`_heartbeat_loop`):

1. `close_old_connections()` inside the heartbeat loop leaks a connection every 30s — remove it
2. Staleness window (2 min / 30s heartbeat) is too tight under GIL contention — widen to 3 min
3. `_update_action_if_pending` incorrectly bumps `last_heartbeat` when writing VALIDATED/FAILED
4. Heartbeat thread leaves open DB connections if `join(timeout=5)` times out

These are production reliability issues worth resolving promptly.

---

## 3. Aspen Billing BIN Variance Trend Is Worsening

**Source:** [#data Data On-Call Checklist 2026-03-27](https://yourcounterpart.slack.com/archives/C012XQQPB51/p1774650535294679)

File Feed BIN variance is on a **consistent upward trend**:

| Date | BIN Variance |
|------|-------------|
| Feb 27 | 6 |
| Mar 13 | 87 |
| Mar 20 | 87 |
| Mar 27 | **121** |

Total active Aspen Billing issues also rising: 9 → 105 → 105 → **137**. Root cause not yet identified.

Related Sentry issues: [Consecutive HTTP POST](https://counterpart.sentry.io/issues/6920637583/) (195 events), [SSLError](https://counterpart.sentry.io/issues/6934435439/) (61 events)

---

## 4. Two New Bugs in Quote Flows — Checksum Report

**Source:** [#ext-counterpart-checksum](https://yourcounterpart.slack.com/archives/C098P268317/p1774601519450129)

Checksum reported 2 new bugs on 2026-03-27 (10-reply thread, likely triaged):

1. **Edit - Shortening Policy:** "Issue Quote" button is not visible
2. **Updating PNP Dates:** Quote row is not visible

Both affect core quoting workflows. Worth confirming triage status and whether tickets are open.

---

## 5. Kubernetes EKS v1.31 Upgrade Runbook — Active WIP

**Source:** [Notion — Kubernetes EKS Auto+v1.31 Upgrade Runbook](https://www.notion.so/307b9be2-b0f3-807e-bd5f-e4641ab156a7)

The EKS v1.31 upgrade runbook was **rewritten on 2026-02-25** and last updated **3 days ago (2026-03-26)**, suggesting this upgrade is actively in progress or imminent. The runbook covers API compatibility checks, cluster health validation, and the upgrade sequence.

Worth confirming: Is this upgrade scheduled? Is sandbox (`k8s-sandbox`) being used for dry-run validation before production?
