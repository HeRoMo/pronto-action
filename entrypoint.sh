#!/bin/sh

# cd ${GITHUB_WORKSPACE}
echo ${GITHUB_WORKSPACE} # TODO: Delete

# Action Inputs
export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}
export COMMIT=${INPUT_COMMIT:-origin/master}
export RUNNER=${INPUT_RUNNER:-rubocop}
export PRONTO_TARGET_PATH=${INPUT_PATH:-.}
export FORMATTERS=${INPUT_FORMATTERS:-github_status github_pr}

export PRONTO_PULL_REQUEST_ID="$(jq --raw-output .number "${GITHUB_EVENT_PATH}")"
export PRONTO_GITHUB_ACCESS_TOKEN="${GITHUB_TOKEN}"
COMMAND="bundle exec pronto run ${GITHUB_WORKSPACE}/${PRONTO_TARGET_PATH} -c ${COMMIT} -r ${RUNNER} -f ${FORMATTERS}"
echo "PRONTO_PULL_REQUEST_ID: ${PRONTO_PULL_REQUEST_ID}"
echo "COMMAND: ${COMMAND}"
$COMMAND
