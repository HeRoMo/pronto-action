#!/bin/sh

cd ${GITHUB_WORKSPACE}

# Action Inputs
export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}
export RUNNERS=${INPUT_RUNNERS}
export FORMATTERS=${INPUT_FORMATTERS}
export COMMIT=${INPUT_COMMIT}

export PRONTO_PULL_REQUEST_ID="$(jq --raw-output .number '${GITHUB_EVENT_PATH}')"
export PRONTO_GITHUB_ACCESS_TOKEN="${GITHUB_TOKEN}"
env
bundle exec pronto run -r "${RUNNERS}" -f "${FORMATTERS}" -c ${COMMIT}
