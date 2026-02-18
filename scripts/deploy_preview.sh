#!/usr/bin/env bash
set -euo pipefail

PORT="${PORT:-4173}"

python3 -m http.server "$PORT" >/tmp/customerops-http.log 2>&1 &
HTTP_PID=$!

cleanup() {
  if kill -0 "$HTTP_PID" >/dev/null 2>&1; then
    kill "$HTTP_PID" >/dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

echo "Started local server on port $PORT (pid: $HTTP_PID)"
echo "Opening public tunnel..."

npx --yes localtunnel --port "$PORT"

