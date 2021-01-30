#!/usr/bin/env bash

for i in out/*.pdf; do
    lpr -o media=letter -o sides=one-sided "$i";
done
