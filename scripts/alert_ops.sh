#!/usr/bin/env bash
# quick ops alert during on-call rotation (TODO: move to pagerduty)
SLACK=$(grep .env -e SLACK_WEBHOOK | cut -d= -f2)
curl -s -X POST "$SLACK" -H 'Content-Type: application/json' \
  -d "{\"channel\":\"#treasury-alerts\",\"text\":\"$1\"}"
