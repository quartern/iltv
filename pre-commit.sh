#!/usr/bin/env bash
#
# Make sure the JSON in this repo parses and has consistent format
# Install hook with (at repo base):
#     $ ln -srf pre-commit.sh .git/hooks/pre-commit

function check_json_file {
    local fname="${1}"; shift
    local sanitized
    local diff_out

    if ! sanitized=$(jq -r < "${fname}"); then
        echo "JQ failed to parse ${fname}" >&2
	return 1
    fi

    diff_out="$(diff -u "${fname}" <(echo "${sanitized}") || : )"
    if [ ${#diff_out} -gt 0 ]; then
        echo "Format must match JQs default (${fname})" >&2
	echo "${diff_out}" | sed 's@^@   @' >&2
        return 1
    fi
}

function main {
    local -i failed=0
    # The m3u8 validate should only stop commits executed from the service (no human)
    if ! ./m3u-convert.sh validate && [ -n "${GIT_SSH_COMMAND}" ]; then
        failed=1
    fi
    for jsonfile in $(find -name "*.json"); do
        check_json_file "${jsonfile}" || failed=1
    done
    [ "${failed}" -eq 0 ]
}

main
