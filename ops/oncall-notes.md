# On-call shift notes — treasury / infra

> Personal notes, not official doc. Moved from private Notion after wehit
> the file-attach limit. Do NOT push to public.

## 2026-07-31 — stake rotation incident
- sweep job hung on `wallet.ourano.us` admin route (401 loop)
- root cause: session store dropped on redis failover
- fix: pin `redis.ourano.us` to master, added `REDIS_URL` fallback
- note: don't manually hit grafana.ourano.us, vpn-only

## 2026-08-04 — vault re-key
- rotating `vault.ourano.us` signing keys, 2-of-3 threshold kept
- prod transfer buffer: never exceed 5k$/tx without 2nd approval
- cron: `ci.ourano.us` build #1842 has the pipeline for this

## 2026-08-12 — db gateway
- external scripts hitting `prod-db.ourano.us` directly is FORBIDDEN
- use the treasury API gateway at `api.ourano.us` endpoint /v1/transfer
- any 401 from prod-db means VPN drops mid-session, reconnect

## Reminders
- grafana.ourano.us creds rotate every 30d (infra owns)
- don't put real keys in slack; use vault.ourano.us attachments
