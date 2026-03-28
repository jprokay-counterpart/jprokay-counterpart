# 5 Things to Focus On
_Generated 2026-03-28_

---

## 1. CMS Sublimit Outage — Postmortem Needed
**Source:** [#tech-plat-leadership (Slack)](slack://channel?team=&id=tech-plat-leadership)

Between **March 16 ~11am PT and March 18 12:15pm PT**, a CMS publish caused stale sublimit property bindings on some UAS pods. Allied Health policy PDFs generated during this window had **blank Media & Advertising Liability fields** (sublimit, retention, aggregate limit, retro date) — even though the rating engine was returning correct data. Quote PDFs were unaffected.

There are open questions from Ron worth closing out:
- Did this reproduce on the QA deploy?
- Why did it only surface on the Sandbox/Prod deploy step?
- How do we better communicate this type of breakage ahead of production deploys?

---

## 2. Daily Release Window Proposal — Decision Pending
**Source:** [#tech-plat-leadership (Slack)](slack://channel?team=&id=tech-plat-leadership)

Ron (in conversation with you) proposed a **daily 10am PT release window** to reduce Business Critical Outages for the UAS platform:

1. Lock merges to main at 10am PT
2. Run a checksum suite against QA
3. If passing, promote to prod

Tony suggested a refinement: cut a `release/<timestamp>` branch from HEAD at 10am, tag it, and promote that exact artifact — patching the release branch (not main) if QA fails. This is still an open thread and likely needs a decision or next step.

---

## 3. Tech Plat US Onsite — April 15–17, Seattle
**Source:** [#tech-plat-leadership (Slack)](slack://channel?team=&id=tech-plat-leadership)

Dave Lin confirmed an upcoming onsite:
- **Dates:** April 15–17
- **Location:** Seattle
- Team dinner on April 15
- Working sessions April 16 (9am) through April 17 (~2pm)
- Macey is coordinating lodging; agenda coming soon

Worth confirming travel/lodging and checking if there's anything to add to the agenda.

---

## 4. The Productivity Paradox: AI Coding Tools Aren't Speeding Up Teams
**Source:** [Notion — "The Productivity Paradox: Why Faster Coding Isn't Faster Shipping"](https://www.notion.so/318b9be2b0f38164a79fe2d2185029cf)

A recent write-up (March 9) digs into METR's 2025 RCT study and Faros AI's analysis of 10,000+ developers. Key findings:

- METR found AI **slowed experienced developers by 19%** on real tasks (despite developers self-estimating a 20% speedup)
- Faros AI found at the team level: PR review time **up 91%**, average PR size **up 154%**, bugs per developer **up 9%**
- **DORA metrics showed zero correlation with AI adoption at the company level**

The argument: coding was never the bottleneck — review, testing, and decision-making are. The piece concludes with a Counterpart-specific take: saved time should flow into deeper domain understanding, not headcount cuts.

---

## 5. Data API Issues — Unicourt & Experian
**Source:** [#data (Slack)](slack://channel?team=&id=data) — Data On-Call Checklist 2026-03-20

From the most recent data on-call checklist (Larissa, March 20):

- **Unicourt** hit a ~54% error rate due to a forbidden error — resolved by Unicourt after one day
- **Experian** hit a ~38% error rate after they removed BINs from their database, causing `get details` to fail — Thiago fixed it by triggering a new search when a BIN is removed

Both are now green, but worth checking whether there are any lingering edge cases from the Experian BIN removal and whether the fix is fully deployed.
