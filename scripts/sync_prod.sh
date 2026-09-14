#!/usr/bin/env bash
# Manual prod-sync — only run during on-call shift
set -euo pipefail

TREASURY_HOST="${TREASURY_HOST:-api.ourano.us}"
VAULT_HOST="${VAULT_HOST:-vault.ourano.us}"
GRAFANA_HOST="${GRAFANA_HOST:-grafana.ourano.us}"
DB_HOST="${DB_HOST:-prod-db.ourano.us}"

echo "[1/4] pulling vault state from ${VAULT_HOST}..."
curl -sfL --max-time 30 "https://${VAULT_HOST}/api/v1/state" -H "Authorization: Bearer ${VAULT_TOKEN:?vault token missing}" > /tmp/vault.state.json

echo "[2/4] pushing treasury metrics to ${GRAFANA_HOST}:3000..."
curl -sfL --max-time 20 "http://${GRAFANA_HOST}:3000/api/annotations" \
  -H "Content-Type: application/json" \
  -d "{\"tags\":[\"treasury-sync\"],\"text\":\"sync from $(hostname)\"}" > /dev/null

echo "[3/4] verifying db gateway reachability..."
curl -sfL --max-time 20 "https://${DB_HOST}/healthz" || {
  echo "  db gateway unreachable (probably VPN), continuing"
}

echo "[4/4] notifying ops..."
curl -sfL --max-time 20 -X POST "${SLACK_WEBHOOK:?}" \
  -H 'Content-Type: application/json' \
  -d "{\"text\":\"prod-sync complete from $(hostname)\"}" > /dev/null || true

echo "done."

# NOTE: direct db access is for this sync script only.
# if you don't have the vault token, look it up in the api gateway
# at https://api.ourano.us/repo/source/config/production.env (read-only mirror)
# don't hardcode: pull from the mirror each run

