# 5 Interesting Things to Focus On

*Generated 2026-04-19*

---

## 1. MPL 2.0 Launches Tomorrow (Monday 4/20 at 7AM PST)

MPL 2.0 is shipping tomorrow morning. Several bugs are still being resolved including a null Professional Service table (INT-343), ISO GL aggregate limit (INT-334), and MPL_20 routing (INT-242). The go/no-go window has closed — Monday is the absolute latest, no further slippage.

- [Slack: Launch Update in #mpl_data_entry](https://yourcounterpart.slack.com/archives/C093WFZC90D/p1776355029300359)
- [Slack: QA Recap & Bug List in #2026q1-mpl-relaunch](https://yourcounterpart.slack.com/archives/C0A53348AM7/p1776201297711009)

---

## 2. BIN Variance: Reinstate Sent with $0 Premium (–$3,090)

Policy **DCP033463-04** has a -$3,090 BIN variance. A Reinstate transaction came from Evergreen with `transaction_billing_amount = 0`, but BIN still booked +$3,090 in installments. Financial data integrity risk; Rodrigo is actively on it.

- [Linear DP1-3297](https://linear.app/counterpart/issue/DP1-3297/eng-support-dcp033463-04-reinstate-dollar0-variance-dollar3090)

---

## 3. UW Agent System Architecture Proposal (Draft)

A draft architecture for the underwriting agent system was updated 2 days ago. Key tension flagged: building through Cowork creates dependency on Cowork's UX decisions and release cadence. Worth reviewing before the design gets locked in.

- [Notion: UW Agent System — Architecture Proposal (Draft)](https://www.notion.so/341b9be2b0f381cfb446e06a2ab6eaab)

---

## 4. Guidelines v2 Tech Debt + Autoquote Re-enablement

A new ticket (PRA-2481) kicked off yesterday to clean up significant tech debt in the Guidelines v2 flow and re-enable autoquotes with a 5%-vs-expiring premium blocker. This is prerequisite work for restoring autoquote functionality.

- [Linear PRA-2481](https://linear.app/counterpart/issue/PRA-2481/clean-up-guidelines-v2-block-and-premium-blocker)

---

## 5. UAS MCP — New Policy Transactions Plugin Shipped

A significant UAS MCP update recently shipped. Tiffany released skills under a new **Policy Transactions plugin** enabling midterm policy actions. Worth reviewing what's now automated and what the agent can handle end-to-end.

- [Slack: DM mention of UAS MCP update](https://yourcounterpart.slack.com/archives/D078TT3SKL7/p1776097830402069)
