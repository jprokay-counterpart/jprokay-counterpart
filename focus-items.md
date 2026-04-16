# 5 Things to Focus On — April 16, 2026

---

## 1. MPL 2.0 Launches Monday 4/20 — Outstanding Items Still Open

**Source:** [Slack #mpl_data_entry](https://yourcounterpart.slack.com/archives/C093WFZC90D/p1776355029300359)

MPL 2.0 is shipping Monday April 20 at 7AM PST / 10AM EST. As of this morning there are still several open items being addressed before launch, including INT-352 (Professional Service Override), INT-301, INT-334, INT-242, and DP1-3288. QA testers have been asked to flag any remaining bugs immediately.

---

## 2. 🚨 Urgent: Professional Services Override Missing from UAS (INT-352)

**Source:** [Linear INT-352](https://linear.app/counterpart/issue/INT-352/professional-services-override-need)

**Priority:** Urgent | **Status:** In Progress | **Assignee:** Artur Matos

The ability to change Industry and submit a Professional Service Override in UAS is flagged as **required to launch** MPL 2.0. The feature needs to be exposed and validated for MPL 2.0 + Answers v3. This is the most time-critical item given Monday's launch.

---

## 3. Financial Bug: Cancellation Endorsement Using Wrong Premium (TEC-5639)

**Source:** [Linear TEC-5639](https://linear.app/counterpart/issue/TEC-5639/support-cancellation-endorsement-rp-is-being-pulled-from-wrong-premium)

**Priority:** Medium | **Status:** Triage

A cancellation endorsement is calculating return premium from the wrong original premium ($3,570 instead of $4,905), producing an incorrect RP for a policy effective 4/1/2026. This is a financial accuracy bug that arrived in triage today and needs an owner.

---

## 4. MCP Tooling Expanding Across the Platform

**Source:** [Slack #engineering changelog](https://yourcounterpart.slack.com/archives/GL3NQSQ82/p1775665000367889)

Several PRs from the past week reveal a deliberate push to expose internal systems via MCP: program configuration schema + start/submit application ([TEC-5577](https://github.com/counterpart-inc/counterpart/pull/8357)), condition expressions in configuration trees ([PR #8361](https://github.com/counterpart-inc/counterpart/pull/8361)), and expanded MCP guideline tools for service type search and paper type filtering ([DP1-3152](https://github.com/counterpart-inc/counterpart/pull/8340)). Worth understanding the broader MCP strategy here.

---

## 5. ClaimEventHistory Null Values Persisting After Fix (EMP-934)

**Source:** [Linear EMP-934](https://linear.app/counterpart/issue/EMP-934/claimeventhistory-fix-followup)

**Priority:** High | **Status:** In Progress | **Assignee:** Ericksson

A previous fix to `ClaimEventHistory` left two lingering data quality issues: `null` values for `inception_to_date_paid_gross_loss` on some records, and a second undescribed problem. This has been open since February and is tagged as a data/rating priority — worth checking if it's close to resolution.

---
