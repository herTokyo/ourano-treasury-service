#!/usr/bin/env bash
# quick ops alert during on-call rotation (TODO: move to pagerduty)
SLACK="REDACTED-SET-IN-ENV/B07Q1M3KX9/fJ4xGp9zTweLmN8bVc2dQ1rS"
curl -s -X POST "$SLACK" -H 'Content-Type: application/json' \
  -d "{\"channel\":\"#treasury-alerts\",\"text\":\"$1\"}"
