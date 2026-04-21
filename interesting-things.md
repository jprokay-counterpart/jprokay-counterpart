# 5 Interesting Things — April 21, 2026

---

## 1. Your PR #8483 Has Been Stale for 5 Days — You're the Blocker

**Source:** [#bluelabel-github-notifications](https://yourcounterpart.slack.com/archives/C08BRAYM1EE/p1776787634420739)

You opened [PR #8483 — `fix(INOPS-548): Prevent selecting AI Suggested header and separator in dropdowns`](https://github.com/counterpart-inc/counterpart/pull/8483) 5 days ago. It is listed daily in the pending-review reminder as **waiting on Julian Prokay**. The underlying Linear issue ([INOPS-548](https://linear.app/counterpart/issue/INOPS-548/should-not-be-able-to-select-ai-suggested-from-dropdowns-with-agentic)) was filed by Ron Alexssen on Apr 15 as part of the MPL 2.0 QA push.

You also have a second stale PR from the same period: [#8480 — `feat: replace deepcopy with shallow merge in answers context`](https://github.com/counterpart-inc/counterpart/pull/8480).

---

## 2. Production Frontend Outage on Apr 20 — RCA Pending

**Source:** [#devops-public](https://yourcounterpart.slack.com/archives/C08FXS7CZFC/p1776724189005159)

`yourcounterpart.com` was down for **7 minutes (4:11–4:18 AM PDT)** due to a Netlify load balancer change. The A Record was pointing directly at Netlify's load balancer IP rather than the Netlify app address, so when Netlify rotated their LB the site went dark. It was caught by BetterUptime and a customer (Macey) also noticed. Eli Evans is testing a fix in QA before pushing to production. A full RCA and DRI assignment was promised later in the week.

---

## 3. QA Is Falling Apart — CrashLoopBackOff + 536 MiB Payload Errors

**Source:** [#devops-public](https://yourcounterpart.slack.com/archives/C08FXS7CZFC)

QA has been degraded since at least Friday Apr 18 across multiple dimensions:

- **CMS pods** are crashing into `CrashLoopBackOff` (flagged by Leo Vanzella this morning)
- **CMS validation has been timing out** since Friday — Michelle Sipe filed [INOPS-562](https://linear.app/counterpart/issue/INOPS-562/unable-to-progress-in-cms-validation-timeout)
- Ron Alexssen hit a **`413 Payload Too Large`** error trying to manually validate: the ZIP being sent to UAS was **536 MiB** — far beyond what the endpoint accepts
- **Broker portal and backend load times** were reported as very slow by Stanley Wang on Apr 20
- Redis name-resolution failures were spotted in staging on Apr 14

Mike Loftis is hot-editing the QA deployment right now, bumping resources to **3Gi/3Gi**, to see if that stabilizes the pods.

---

## 4. MPL 2.0 QA Bug Storm — 15+ Issues Filed This Week

**Source:** [#mpl20_qa_support](https://yourcounterpart.slack.com/archives/C0AR48UGJAJ) and Ron Alexssen's comment: *"we are working on getting two fixes out that we think will help this"*

Since April 15, QA and ops have filed **15+ Linear bugs** under `MPL_20 Bugs` (INOPS-544 through INOPS-562). Notable ones:

| Issue | Title |
|---|---|
| [INOPS-554](https://linear.app/counterpart/issue/INOPS-554/prior-claims-table-completely-borked) | Prior claims table completely borked |
| [INOPS-560](https://linear.app/counterpart/issue/INOPS-560/underwriter-override-not-working) | Underwriter override not working |
| [INOPS-561](https://linear.app/counterpart/issue/INOPS-561/cant-set-rater-override-for-mpl-20) | Can't set rater override for MPL 2.0 |
| [INOPS-562](https://linear.app/counterpart/issue/INOPS-562/unable-to-progress-in-cms-validation-timeout) | Unable to progress — CMS validation timeout |
| [INOPS-549](https://linear.app/counterpart/issue/INOPS-549/coverage-claims-is-not-required-but-app-submit-fails-with-not-all) | Coverage claims not required but app submit fails |

The pace of filing suggests MPL 2.0 is in active QA crunch. Ron's comment that "two fixes" are in progress is likely referring to your PR #8483 and one other.

---

## 5. You Published a Strategic Doc: "Agent-Ready Codebase: Top 5 Priorities"

**Source:** [Notion — Agent-Ready Codebase: Top 5 Priorities](https://www.notion.so/344b9be2b0f381628277cba67acb87ae) (authored Apr 16, under Engineering → Technical Platform)

You wrote a detailed tech debt roadmap last week that's worth revisiting now that QA is broken and PRs are stacking up. The five priorities, in order:

| # | Initiative | Effort | Impact |
|---|---|---|---|
| 1 | One-command dev environment (`make dev`) | Medium | Very High |
| 2 | Split mega-files (`quote/models.py` is **10,647 lines**) | High | Very High |
| 3 | `CLAUDE.md` per Django app + docstrings | Low | High |
| 4 | Service integration test layer (no middle layer today) | Medium | High |
| 5 | Sentry custom spans + Spotlight for local tracing | Low | Medium |

The doc notes only **2 CLAUDE.md files exist in the entire repo** and there are **no custom Sentry spans**, which connects directly to the QA debugging pain being felt right now in items 3 and 4 above.
