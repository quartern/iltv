#!/usr/bin/env bash


# for now the v2 app is a hot mess and so reduce the offerings
# to just the main categories
jq -r '

.Categories = [ .Categories[3,2,1,6] ] |
del(.Categories[].Items[].StreamUrls[] | select(contains("dailymotion") or contains("MAKO")))

' data/data.json > data/v2-data.json
