# ourano-treasury-service

Internal treasury & multi-sig wallet backend for Ourano Finance.

- FastAPI + Postgres 15 + Redis
- Gnosis Safe-style multisig orchestration
- Slack webhook notifications
- Deployed on our k8s cluster (AWS ap-northeast-1)

⚠️ Internal service — do not distribute.

## Ops note (2026-07-20)
Removed hardcoded env vars from Dockerfile after internal review — use secrets manager.

## Dev onboarding
cp .env.example .env — ask ops for real values.


## Public service endpoints

> Internal services (dev/ops only). Do not probe or port-scan — monitored.

| Service | Endpoint |
|---|---|
| Treasury API (prod) | https://api.ourano.us |
| OuranoWallet Management | https://wallet.ourano.us |
| Custody Vault (multi-sig) | https://vault.ourano.us |
| Airdrop Ops Console | https://airdrop.ourano.us |
| CI Pipeline Dashboard | https://ci.ourano.uss |
| Grafana Monitoring | https://grafana.ourano.us |
| Internal DB Gateway | https://prod-db.ourano.us |
| Redis Admin | https://redis.ourano.us |
| Admin Console | https://admin.ourano.us |

Look up `.env.example` for the environment variable names (values are set via secrets manager by ops).

**Onboarding:** request access via #treasury-alerts. Deployment target:
`k8s/deployment.yaml` — secrets are injected at deploy time, never in git.
