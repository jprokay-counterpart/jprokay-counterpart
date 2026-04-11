# 5 Interesting Things to Focus On

_Synthesized 2026-04-11 from Slack and Notion_

---

## 1. UW File Audit — 7/9 Fail, 3 Accounts Need Immediate Action Today

**Source:** [#weekly-audit-results — Week of April 6–10](https://yourcounterpart.slack.com/archives/C0AM0U8T16Z/p1775857179141409)

Yesterday's audit of 9 accounts returned 7 FAILs, 0 compliant — and three that require action before end of day:

1. **Schultheis & Panettieri LLP** (Brad Bahler): Policy expired 2026-03-31. Binder and policy PDF were issued 2026-04-08 on a lapsed term — live E&O exposure. Intended effective date is 2026-08-04 (day after the Travelers FI expiration). Contact broker **Ian Newcomer (CRC Group)** immediately and reissue.
2. **Victory Bar LLC** (Jake O'Donnell): Zero-day policy term — effective = expiration = 2026-04-22. Policy PDF already generated and sent to insured. Intended expiration is almost certainly 2027-04-22.
3. **Guardian Capital RE LLC** (Jake O'Donnell): Named insured mismatch — broker Steven Finkelstein requested Tasis Holdings LLC in writing on 2026-04-06; policy was bound to Guardian Capital RE LLC on 2026-04-09. Policy may be covering the wrong entity.

The systemic finding is the one worth escalating beyond these three: all 9/9 accounts audited this week had non-standard policy terms (range: 0–30 days, zero 12-month terms). This mirrors the pattern flagged in the 2026-03-27 audit. Two audits, same pattern, no root cause documented.

---

## 2. The 401 `/startapplication` Error Is Fixed — After 12 Days

**Sources:**
- [#engineering-releases — UAS v2026.04.10-01](https://yourcounterpart.slack.com/archives/C08L5NDM0GZ/p1775861875371769)
- [Sentry COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148)

The `AxiosError 401` on `/startapplication` (425 events, 14 users) that appeared in every digest since March 30 was fixed in yesterday's release by Dayrimell Tejada (BRS-220): an auth check is now added before the `getBrokerProfile` call. This closes one of the two dual-auth failures that have been noted as potentially sharing a root cause. The MCP `invalid_token` issue (Linear DP1-3222) remains open — the shared-root-cause investigation that was flagged for 8 days is now less useful, but DP1-3222 itself still needs resolution.

---

## 3. Policy Revert Bug — Wrong Effective Date, Found This Morning

**Source:** [#underwriting-pod-dev](https://yourcounterpart.slack.com/archives/C0A6ZLSN9A7/p1775905106091469)

The policy revert feature (UW-191) shipped yesterday in v2026.04.10-01. By 4am today, Leo Vanzella and Ben had already found a bug: the revert event is using the **target event's effective date** instead of the **next replaced event's effective date**. This is a date calculation error on a just-shipped transaction type that affects policy financial records. The fix is identified and the thread is active — but it's worth tracking whether a hotfix goes out today or whether affected policies in production need to be corrected manually.

---

## 4. XSS Security Sweep — 6 Fixes Shipped, Frontend and Backend

**Source:** [#engineering-releases — UAS v2026.04.10-01](https://yourcounterpart.slack.com/archives/C08L5NDM0GZ/p1775861875371769)

Yesterday's release included a coordinated sweep of XSS vulnerabilities across the stack by Hazy (BRS-256, 262, 263, 264, 265, 269):

- Frontend: `html-react-parser` replaced with `DOMPurify` in `StartApplication`; unsanitized `dangerouslySetInnerHTML` removed from `AutoCompleteField`, `LogicalModals`, and `BrokerEmail`; guideline error HTML sanitized before tooltip injection in `QuestionRender.tsx`
- Backend: `error_text` in `UnderwritingGuidelinesSerializer` now sanitized with `bleach`

Six fixes across that many components in one release suggests this came from a systematic audit rather than individual bug reports. The interesting question is whether the audit is complete or whether more components are in the queue.

---

## 5. 2026Q2 Data Engineering Roadmap — Published Yesterday

**Source:** [Notion — 2026Q2 Initiative (Data Eng Initiatives)](https://www.notion.so/33db9be2b0f3805ea45ec79ef8bdc930)

The Q2 roadmap for the data engineering team was published/updated yesterday with six named initiatives:

- **Context Architecture** (~Nacho, Rodrigo, collab. Derrick, Chris S)
- **AI Agent Evaluation Framework** (~Larissa, Elias, collab. Julian) — uses the same AI Background Agent infrastructure; eval framework v2 doc attached
- **AI Background Agent** (~Rodrigo, Thiago, collab. DevOps, DevSecOps) — triggers agent skills from application submit (pre-underwrite → save report to UAS); includes AWS Bedrock and Guardrails review, plus agent observability via Sentry and Metrics
- **Similar Companies 2.0** (~Elias, Larissa, collab. DS team) — embeddings + hybrid search; evaluation of current vs. new approach
- **Datapool 2.0** (~Thiago, Nacho) — OFAC, TruthMD dentist profiles, ZeroHR compliance scanning, real-time insurance policy updates per state; integration testing with lambdas (~Gabriel)
- **Underwriting Agent 2.0** (~Newton) — MPL team SKILL build + MCP expansion

Linear projects and monthly milestones are still listed as TODOs. The roadmap is live but not yet wired into Linear — worth flagging to anyone who needs to allocate capacity against these in Q2.

---

_Sources: [Slack](https://yourcounterpart.slack.com) · [Notion](https://notion.so) · [Sentry](https://counterpart.sentry.io) · [Linear](https://linear.app/counterpart)_

> **Note:** Sentry and Linear required re-authentication this session and were not queried live. Items 2 and 3 are sourced from Slack release notes. To reconnect: open the auth URLs provided in chat and paste the callback URL back.
