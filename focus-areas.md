# 5 Things to Focus On

_Generated 2026-03-31_

---

## 1. 🔴 N+1 Query Hammering 87 Users (Sentry)

**Source:** [COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

The top user-impacting issue in Sentry right now: an N+1 query on the
`/admin/application/application/{object_id}/growth_opportunities/` endpoint
has fired **2,401 events** affecting **87 users** in the last 24 hours and is
still firing as of minutes ago. Seer rates this as medium actionability — it's
a real fix, not just noise. Good candidate for a `select_related` / `prefetch_related`.

---

## 2. 🔴 401 Errors Blocking `/startapplication` for 14 Users (Sentry)

**Source:** [COUNTERPART-FRONTEND-148](https://counterpart.sentry.io/issues/COUNTERPART-FRONTEND-148)

An `AxiosError: Request failed with status code 401` is hitting the application
start flow — 425 events, 14 users, still active. This is a conversion funnel
issue: brokers trying to start an application are getting auth failures. Worth
checking whether a session/token expiry edge case or a recent auth middleware
change is responsible.

---

## 3. 🏗️ Salesforce Source of Truth — Architecture Inversion in Progress (Notion)

**Source:** [PR/FAQ: Salesforce Sales Source of Truth](https://www.notion.so/321b9be2b0f381348cf3fd5385097f2f)

A major architectural decision is in draft: **Django Admin becomes read-only
for broker data; Salesforce becomes the write origin.** Key callouts:

- New `BrokerInboundSyncService` endpoint (`/salesforce-api/brokers/sync/`)
  receives Apex callouts from Salesforce on create/update
- Four feature flags gate the cutover sequence
- Known risks: duplicate office/team name collisions, side-effect suppression
  (`ignore_signals`) must be airtight before go-live or welcome emails spam users
- Licensing was explicitly cut from scope to avoid delaying commercial outcomes

If this is in your area, the pre-cutover data requirements checklist (SyncID
backfill, split-brain resolution) is the critical path item.

---

## 4. 🚧 Cross-Sell Quote Indication — Key Blockers Identified (Notion)

**Source:** [Meeting Notes — Cross-Sell Quote Indication](https://www.notion.so/329b9be2b0f38064b3bffbf63e4bd654)

From the March 19 meeting, the cross-sell initiative has active blockers:

- **White-label portal experience** — branded URLs, logos, and themes not yet
  resolved for the wholesaler/retailer model
- **Surplus fees + license display** — must appear everywhere: coverage page,
  total due, and PDF invoices
- **Pro-rating** uses submission date instead of effective date (known issue)
- Agent connectivity call happening Tuesday — someone flagged wanting to join

These are blocking retail agents from binding end-to-end through the wholesaler portal.

---

## 5. ⚙️ Kubernetes EKS v1.31 Upgrade — Runbook Active (Notion)

**Source:** [Kubernetes EKS Auto+v1.31 Upgrade Runbook](https://www.notion.so/307b9be2b0f3807ebd5fe4641ab156a7)

Updated 5 days ago, this runbook covers the EKS Auto upgrade to v1.31
including CoreDNS (v1.11.1-eksbuild.8 → v1.11.3-eksbuild.1). The runbook
notes uncertainty around what EKS Auto handles automatically for CoreDNS.
If this upgrade is in-flight or imminent, worth verifying cluster backup
completion and validating the CoreDNS cutover plan before proceeding.

---

_Sources: Sentry (counterpart.sentry.io), Notion workspace_
