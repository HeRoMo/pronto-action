#!/bin/sh

cd ${GITHUB_WORKSPACE}

# Action Inputs
export GITHUB_TOKEN=${INPUT_GITHUB_TOKEN}
export RUNNERS=${INPUT_RUNNERS:-rubocop}
export FORMATTERS=${INPUT_FORMATTERS:-github_status github_pr}
export COMMIT=${INPUT_COMMIT:-origin/master}

export PRONTO_PULL_REQUEST_ID="$(jq --raw-output .number "${GITHUB_EVENT_PATH}")"
export PRONTO_GITHUB_ACCESS_TOKEN="${GITHUB_TOKEN}"
echo "EXEC pronto run -r ${RUNNERS} -f ${FORMATTERS} -c ${COMMIT}"
bundle exec pronto run -r "${RUNNERS}" -f "${FORMATTERS}" -c ${COMMIT}
exit $?
