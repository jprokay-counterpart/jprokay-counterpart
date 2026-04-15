# 5 Interesting Things — April 15, 2026

---

## 1. Admitted Rating Engine Is Effectively Down

**Source:** Sentry — [COUNTERPART-BACKEND-DJANGO-904](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-904), [COUNTERPART-BACKEND-DJANGO-903](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-903), [COUNTERPART-BACKEND-DJANGO-925](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-925)

The `admitted-rating-engine` service is unreachable — `Max retries exceeded` errors are cascading across at least 5 issues, all rooted in `workflow.submission.submit_core_task`. This means new policy submissions are failing to calculate premiums. The issues are assigned to Leonardo Vanzella. Worth checking if this is a pod crash, a network policy change, or a deployment regression.

---

## 2. N+1 Query Hitting 82 Users on Growth Opportunities Page

**Source:** Sentry — [COUNTERPART-BACKEND-DJANGO-BRX](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-BRX)

An N+1 query on `/admin/application/application/{object_id}/growth_opportunities/` fired 2,200 times in the past 24 hours, affecting 82 users. Seer rates it medium actionability. Given the user count and volume this is the highest-impact DB issue currently active — likely a missing `select_related` or `prefetch_related`.

---

## 3. `DiffLevel` Bug at Bind Policy — Assigned to You

**Source:** Sentry — [COUNTERPART-BACKEND-DJANGO-4EM](https://counterpart.sentry.io/issues/COUNTERPART-BACKEND-DJANGO-4EM)

A `TypeError: 'DiffLevel' object is not subscriptable` is hitting the bind policy admin view (`/admin/application/application/{object_id}/bind_policy`). 4 users affected, 9 events, **assigned to Julian**, Seer rates it **high** actionability. This is directly in your queue and should have a clear fix.

---

## 4. Your UW Agent Architecture Proposal Is Out for Review

**Source:** Notion — [UW Agent System — Architecture Proposal (Draft)](https://www.notion.so/341b9be2b0f381cfb446e06a2ab6eaab)

You published this two days ago (April 13) and status is **Draft — For Review**. It proposes migrating auto-underwriting out of Cowork into a purpose-built UW app with structured API calls, a dedicated UI, and skill invocation via the agent framework. The 2026 Q2 initiative page references reviewing this proposal under the AI Agent Evaluation Framework track — so the clock is ticking on getting feedback and moving it to final.

---

## 5. Your MCP Similar-Company Implementation Is Being Evaluated for Consolidation

**Source:** Notion — [TDD 0001: Similar Company 2.0 \[WIP\]](https://www.notion.so/342b9be2b0f380f28cb9e2dfa42de4eb)

A new TDD (updated yesterday) proposes consolidating three different "similar companies" implementations into a single `CompanyEmbedding` model backed by pgvector HNSW cosine similarity. One of the three is **your heuristic SQL+Python approach in the UAS MCP server** — the only one currently used in production for underwriting. Worth reviewing the proposed data model to make sure your 6-dimension scoring logic (industry, company size, geography, coverage overlap, recency, broker affinity) and outcome enrichment are carried forward in the new design.

---

_Sources: Sentry ([counterpart.sentry.io](https://counterpart.sentry.io)), Notion workspace_
