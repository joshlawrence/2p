#!/bin/bash
SONGLIST="allsongs.txt"
VERSION="v.$(date +'%F')"

test -f "$SONGLIST" && >"$SONGLIST" || { echo "Could not find $SONGLIST!" >&2; exit 1; }

cat << EOF > "$SONGLIST"
ALL SONGS - ${VERSION}
------------------------
EOF

find songs -type f -name "*.txt" -print |sed -e "s/^songs\///" \
    | sort >> "$SONGLIST"
