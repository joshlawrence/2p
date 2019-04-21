#!/bin/bash
SONGLIST="allsongs.txt"
VERSION="v.$(date +'%F')"

# if SONGLIST exists, empty the file. fail if not found.
test -f "$SONGLIST" && >"$SONGLIST" || { echo "Could not find $SONGLIST!" >&2; exit 1; }

# file header
cat << EOF > "$SONGLIST"
ALL SONGS - ${VERSION}
------------------------
EOF

# print the first line of each file to the SONGLIST
for i in songs/*.md; do
    TITLE=$( awk NR==1 "$i" |sed 's/#[[:space:]]//' )
    printf "%s\n" "$TITLE" | sort >> "$SONGLIST"
done
