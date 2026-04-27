# 5 Interesting Things to Focus On
_Generated 2026-04-27_

---

## 1. Billing Polling Loop Is Broken for Aspen Dental — 23,500+ Errors in 24 Hours

The highest-volume Sentry error right now is a 404 flooding from the Aspen Dental billing poller. Every time the task runs it tries to look up invoices that don't exist, generating a relentless stream of noise that could be masking real billing failures.

- **Sentry:** [ASPEN-DENTAL-JJ](https://counterpart.sentry.io/issues/ASPEN-DENTAL-JJ) — `HTTPStatusError: 404 Not Found` on `GET /invoices?policy_id=...&transaction_number=1` (23,540 events, first seen 23 hours ago)
- **Culprit:** `glacier.new_grad.tasks.poll_all_pending_payments`

---

## 2. Redis Is Down in Multiple Environments — Cascading Failures Across the Stack

Multiple services are unable to connect to `counterpart-redis-master:6379`, affecting background task scheduling, Salesforce sync, and the GenAI/MCP services in QA. At 2,500+ events on the consumer error alone, this suggests a persistent infrastructure issue, not a transient blip.

- **Sentry (prod consumer):** [COUNTERPART-BACKEND-DJANGO-DR](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-DR) — `Cannot connect to redis://counterpart-redis-master:6379` (2,566 events, assigned to Leonardo Vanzella)
- **Sentry (Salesforce scheduling):** [COUNTERPART-BACKEND-DJANGO-5VE](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-5VE) — `SchedulingError: Couldn't apply scheduled task process_salesforce_sync_queue`
- **Sentry (GenAI QA):** [GENAI-MCP-2](https://counterpart.sentry.io/issues/GENAI-MCP-2) — `ConnectionError` to `counterpart-redis-master.qa.svc.cluster.local:6379` (44 events)

---

## 3. GenAI API Contract Breaking Submissions — Linear + Sentry Correlated

A null NAICS code `reason` field from the GenAI service is causing the core submission workflow to fail with a `ValidationError`. The Linear ticket was just opened today and is already In Progress, but the Sentry cluster shows this has been happening for over an hour with 36+ retries stacking up.

- **Linear:** [PRA-2622](https://linear.app/counterpart/issue/PRA-2622/support-workflow-failed-loosen-genai-api-contract) — "Support: Workflow failed (loosen Genai api contract)" — In Progress, assigned to Stanley Wang
- **Sentry (primary):** [COUNTERPART-BACKEND-DJANGO-904](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-904) — `Task Core Submission Logic failed: ... naics_codes -> 7 -> reason: none is not an allowed value` (36 events, assigned to Leonardo Vanzella)
- **Sentry (retries):** [COUNTERPART-BACKEND-DJANGO-903](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-903) — `Retry in 60s: ApplicationSubmissionSystemError` (13 events)

---

## 4. Kentucky Tax Calculation Is Wrong — Financial Accuracy Bug, High Priority

KY policies are generating incorrect invoices due to rounding errors, wrong county fee summation, and rendering bugs. This is a financial accuracy issue with clear repro steps and a real policy to point to.

- **Linear:** [TEC-5700](https://linear.app/counterpart/issue/TEC-5700/ky-taxes-are-miscalculated) — "KY Taxes Are Miscalculated" — **High Priority**, In Triage, assigned to Maria Paula Vazquez
- Affects: DO-only Admitted KY accounts; specific repro with `Address = 13011 West Highway 42 Prospect, KY 40059`, override premium $39,102

---

## 5. Magic Link Is Broken in QA — Blocking QA Testing Today

The magic link auth flow in QA redirects users back to the login page instead of logging them in. Opened and already In Progress today — but worth watching since it blocks anyone trying to QA test authenticated flows right now.

- **Linear:** [BRS-371](https://linear.app/counterpart/issue/brs-371/magic-link-broken-in-qa) — "Magic link broken in QA" — **High Priority**, In Progress, assigned to Eliezer Mendez
- Affects: `https://qa-counterpart.netlify.app/login/` — token present in URL but session not established
