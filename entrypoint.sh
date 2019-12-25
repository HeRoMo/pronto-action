#!/bin/sh

cd "$GITHUB_WORKSPACE"

export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}

export PRONTO_PULL_REQUEST_ID="$(jq --raw-output .number "$GITHUB_EVENT_PATH")"
export PRONTO_GITHUB_ACCESS_TOKEN="${GITHUB_TOKEN }"
pronto run -r rubocop rails_best_practices brakeman -f github_status github_pr -c origin/master
