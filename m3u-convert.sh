#!/usr/bin/env bash
#
# Generates an m3u version from the json and then either adds (before
# actual commit) or just validates that no material difference exists
# (used from pre-commit)

declare REPODIR
REPODIR=$(realpath -m "${BASH_SOURCE[0]}/..")

declare JSON_PATH="${REPODIR}/data/v2-data.json"
declare M3U_PATH="${REPODIR}/data/data.m3u"
declare M3U_TMP_PATH="${REPODIR}/data.m3u.new"

function json2m3u {
    printf '#EXTM3U\n'
    printf '# Last updated: %s\n\n' "$(date +"%Y-%m-%d %H:%M")"

    jq -r '
        .Categories[] |
        .Name as $catname |
        .Items[] |
        "#EXTINF:\(.Duration // -1) tvg-logo=\"\(.Poster)\" group-title=\"\($catname)\",\(.Title)\n" +
        "\(.StreamUrls[0])\n"'
}

function manifests_differ {
    ## Diff of 9 lines is imatterial because we always touch the timestamp.
    # $ diff -u data.m3u.new data/data.m3u |cat -n
    #  1	--- data.m3u.new	2026-02-11 01:29:17.553120688 -0500
    #  2	+++ data/data.m3u	2026-02-11 01:27:58.524561231 -0500
    #  3	@@ -1,5 +1,5 @@
    #  4	 #EXTM3U
    #  5	-# Last updated: 2026-02-11 01:22
    #  6	+# Last updated: 2026-02-11 01:18
    #  7
    #  8	 #EXTINF:-1 tvg-logo="ipbc_tv_11.png" group-title="Main TV",Israeli Public Broadcasting Corporation - Kan 11
    #  9	 https://r.il.cdn-redge.media/livehls/oil/kancdn-live/live/kan11/live.livx/playlist.m3u8
    local diff_lines

    read -r diff_lines < <(diff -u "${M3U_TMP_PATH}" "${M3U_PATH}" | wc -l)
    [ "${diff_lines}" -gt 9 ]
}

function validate {
    json2m3u < "${JSON_PATH}" > "${M3U_TMP_PATH}"
    if manifests_differ; then
        echo \
            "M3U Manifests differ, consider copying ${M3U_TMP_PATH#"${REPODIR}"/} to" \
            "${M3U_PATH#"${REPODIR}"/} and committing." >&2
        return 1
    fi
    return 0
}

function update {
    json2m3u < "${JSON_PATH}" > "${M3U_TMP_PATH}"
    if manifests_differ; then
        mv "${M3U_TMP_PATH}" "${M3U_PATH}"
        git -C "${REPODIR}" add "${M3U_PATH}"
    fi
}

function main {
    case "${1}" in
      validate)
        validate
        ;;
      update)
        update
        ;;
      *)
        echo "Expecting subcommands: update|validate" >&2
        return 1
        ;;
    esac
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # All errors fatal
    set -e

    main "${@}"
fi
