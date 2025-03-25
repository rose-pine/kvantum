#!/bin/bash

mkdir -p themes
rm -r themes

rose-pine-bloom -t templates -o themes/ --accents

for basevariant in "themes"/*; do
    for accent in "$basevariant"/*; do
        for file in "$accent"/*; do
            mv $file $accent/$(basename $basevariant)-$(basename $accent).${file##*.}
        done
        mv $accent themes/$(basename $basevariant)-$(basename $accent)
    done
done

# cleanup
rm -r themes/rose-pine
rm -r themes/rose-pine-dawn
rm -r themes/rose-pine-moon
