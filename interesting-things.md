# 5 Interesting Things — April 17, 2026

---

## 1. MPL 2.0 Launches Monday 4/20 at 7AM PST

The MPL 2.0 production push is locked in for Monday morning. The team spent this week burning down blocking bugs in QA. Two active issues to watch:

- **INT-343**: Professional Service table intermittently pushing null to the rating engine — blocking pricing on new accounts ([Linear](https://linear.app/counterpart/issue/INT-343/professional-service-pushing-null-to-rating-from-uas))
- **INT-228**: Third-Party App Extractor — **you're the owner**, targeting end of month, flagged as non-blocking

Sources: [#mpl_data_entry](https://yourcounterpart.slack.com/archives/C093WFZC90D/p1776355029300359) · [#2026q1-mpl-relaunch](https://yourcounterpart.slack.com/archives/C0A53348AM7/p1776279454038609)

---

## 2. Datapool-Serverless: 1,700 Sentry Events in 7 Days

The data on-call checklist flagged `datapool-serverless` as RED with 25+ issues. Top offenders:

| Issue | Events |
|---|---|
| [DocumentNotFound /company/digital-risk](https://counterpart.sentry.io/issues/6220760168/) | 674 |
| [DocumentNotFound /company/industry](https://counterpart.sentry.io/issues/6220986204/) | 655 |
| [DocumentNotFound /company/credit_summaries](https://counterpart.sentry.io/issues/6222112667/) | 136 |
| [SearchError: Access token is invalid](https://counterpart.sentry.io/issues/7036019173/) | 71 |

The DocumentNotFound pattern across multiple company data routes suggests a systemic upstream data gap rather than isolated failures.

Source: [#data on-call checklist](https://yourcounterpart.slack.com/archives/C012XQQPB51/p1776090027734589)

---

## 3. Experian API Pipeline Failing Repeatedly Since April 9

The `restricted.prd_silver experian_api` Databricks pipeline has been failing almost every run since April 9 — over a week of recurring failures. Listed as an action item but no resolution confirmed yet.

> "restricted.prd_silver experian_api pipeline failing repeatedly (multiple times daily since Apr 9)"

Source: [#data on-call checklist](https://yourcounterpart.slack.com/archives/C012XQQPB51/p1776090027734589)

---

## 4. UA MCP + GenAI Port Conflict — Both Shipped Last Week

Two related MCP infrastructure changes landed in production:

- **PR #8418** — Fixed `answer_question` returning incorrect boolean (was returning an error code despite successful updates). [GitHub](https://github.com/counterpart-inc/counterpart/pull/8418)
- **PR #8372** — Moved GenAI from port 8001 → 8003 to resolve conflict with UAS MCP. [GitHub](https://github.com/counterpart-inc/counterpart/pull/8372)

These were both quiet deploys with no broad announcement. Worth knowing if you're working against either MCP service.

Source: [DM from Derrick Franco](https://yourcounterpart.slack.com/archives/D077JG4C9EV/p1776091500578249) · [#engineering](https://yourcounterpart.slack.com/archives/GL3NQSQ82/p1776179775004439)

---

## 5. Looker DRS5 Tiers Anomaly — "0" Column Spiked to 43

The data on-call report flagged Looker DRS5 Tiers as RED for the week of April 6:

> "Most recent week (2026-04-06): '0' column = 43 (threshold <5). Previous weeks were ∅ and 3."

No resolution or explanation was confirmed in the checklist. This could indicate a scoring/tier calculation issue that emerged around the same time as the April 9 search quota outage.

Source: [#data on-call checklist](https://yourcounterpart.slack.com/archives/C012XQQPB51/p1776090027734589)
