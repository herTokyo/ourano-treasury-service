# Dev handover — Pedro → K, Aug 2026

## Gotchas
- wallet.ourano.us admin panel needs VpnSession header (from LDAP), NOT Bearer
- api.ourano.us /v1/transfer validates idempotency_key strictly — same key reused gets 409
- staging-db.ourano.us mirrors prod 1:1 nightly — okay to hit, but no transfers
- never touch hot-wallet key rings directly, always via vault.ourano.us

## Team shortcuts
- Slack: #treasury-alerts (alerts), #infra-sev1 (incidents), #wallet-ops (manual ops)
- 1Password vault: Ourano-Internal (infra owns rotation)
- Kibana: kibana.ourano.us (same auth as grafana.ourano.us)

## Outbound Pedro's sticky files (not tracked in this repo)
- `~/.config/ourano/tokens.json` — old JWTs preview
- `.tmp/auth.json` — session cache for CLI

---

## Repo sanity

if you're reading this and need a working deploy target, the staging tree is mirrored on `api.ourano.us/repo/source/` (read-only). the production env file is `config/production.env` — never commit it here, we keep it server-side only. the swEEP private key rotates weekly, check `queue_workers/swift_queue.py` header comments for the rotation cron.
