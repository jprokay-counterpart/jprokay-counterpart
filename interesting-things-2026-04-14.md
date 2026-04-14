# 5 Interesting Things — April 14, 2026

---

## 1. Vanta Compliance: Critical Deadlines Hitting This Week

Several overdue and imminently-due items for the SOC 2 / HIPAA / 23 NYCRR 500 audit were flagged today with hard deadlines.

**Overdue now:**
- Dereck Ramos and Dwayne Audinett have not accepted the HIPAA Workstation Security Policy, Incident Response Plan HIPAA Addendum, or HIPAA Compliance Policy — and have not completed HIPAA security awareness training.
- Branch protection not enforced for admins on `counterpart-inc/counterpart-context-architecture` and `counterpart-inc/aspen-billing`.
- 2 unresolved container package vulnerabilities.

**Due imminently:**
- **April 15 (tomorrow):** MFA not enabled on an AWS account for user `dominique`.
- **April 15:** 3 months of logs must be available online for immediate analysis.
- **April 16:** 3 critical GitHub Dependabot vulnerabilities must be remediated or monitoring deactivated.

**Source:** [#vanta-workstreet Slack thread](https://workstreet-usa.slack.com/archives/C070MTBDV4H/p1776109759288189)

---

## 2. Sentry: Escalating ValidationError on `/api/agents/professional-services/predict`

A `ValidationError` on the professional services prediction endpoint has been escalating — now at **1,097 events** since it first appeared in April 2025. The error indicates callers are sending a non-string value for `company_name`.

```
[{'type': 'string_type', 'loc': ('body', 'payload', 'company_name'), 'msg': 'Input should be a valid string'}]
```

State: **Escalating** — this has been open for over a year and is growing.

**Source:** [Sentry GENAI-DJANGO-1Y](https://counterpart.sentry.io/issues/6501120316/?environment=prd)

---

## 3. Sentry: Critical GenAI Endpoint Spike + 500s on Auto-Decline Classify

Two separate critical alerts fired today in `#ai-lab-dev-alerts`:

- **Critical: GenAI Endpoint Spike Detection** fired at ~5am and again at ~9am PDT. The 5am alert has 4 replies and two `:this-is-fine-fire:` reactions.
- **InternalServerError 500** on `/api/agents/auto-decline/classify` — a brand-new instance appeared at 8:49am (state: *New*), plus an existing issue with 19 events first seen Feb 10 is still ongoing.

These two patterns together suggest the spike in traffic to the GenAI endpoints may be triggering auto-decline classify failures.

**Sources:**
- [Sentry Alert: GenAI Spike](https://counterpart.sentry.io/alerts/rules/details/417325/?alert=145)
- [Sentry GENAI-DJANGO-F9 (new)](https://counterpart.sentry.io/issues/7411315656/?environment=prd)
- [Sentry GENAI-DJANGO-BB (ongoing)](https://counterpart.sentry.io/issues/7256019853/?environment=prd)
- [#ai-lab-dev-alerts Slack](https://yourcounterpart.slack.com/archives/C097W7ZCS1J)

---

## 4. Sentry: Slow DB Query on `ai_trace` Sync — 465 Events and Counting

A slow DB query on the `/api/traces/{trace_id}/sync` endpoint has been firing continuously since **March 18** and is now at **465 events** (up from 423 earlier today — still actively accumulating).

The query scans the full `ai_trace` table joining multiple fields. This is likely missing an index on a frequently-filtered column (e.g. `trace_id`, `application_id`, or `company_id`).

**Source:** [Sentry GENAI-DJANGO-DQ](https://counterpart.sentry.io/issues/7343253422/?environment=prd)

---

## 5. INT-333: Endorsements Still Not Attaching (High Priority, Active Today)

A high-priority bug was added to the Internal Programs triage queue today: endorsements are not attaching. Multiple team members have commented on it this morning — Ron Alexssen, michelle, and Artur Matos are actively engaged.

This issue has a long history. A related thread from March 2026 (TEC-5548) dealt with TRIA endorsements not being removed when GL coverage is dropped, and the fix was to make the endorsement non-mandatory. The current resurgence suggests the auto-attach/auto-remove logic for endorsements continues to have edge cases across coverage types.

**Sources:**
- [#internal-programs-linear Slack](https://yourcounterpart.slack.com/archives/C0A8VTLDBR9/p1776175730355729)
- [Linear INT-333](https://linear.app/counterpart/issue/INT-333)
