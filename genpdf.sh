#!/bin/bash

# variables
PANOPTS=( --pdf-engine=xelatex -V 'fontsize=14pt' -V 'papersize:letter' -V 'geometry:portrait' )

# export all files in the songs directory to pdf
for file in songs/*; do
    i=$(basename "$file" .md)
    pandoc "${PANOPTS[@]}" "$file" -o "pdf/$i.pdf"
done