#!/bin/bash

mkdir -p dist
rm -r dist

rose-pine-bloom -t templates -o dist/ --accents

cd dist
for basevariant in "."/*; do
    for accent in "$basevariant"/*; do
        for file in "$accent"/*; do
            mv $file $accent/$(basename $basevariant)-$(basename $accent).${file##*.}
        done
        mv $accent $(basename $basevariant)-$(basename $accent)
        echo $(basename $basevariant)-$(basename $accent)
        tar -cvzf $(basename $basevariant)-$(basename $accent).tar.gz $(basename $basevariant)-$(basename $accent)
        rm -rf $(basename $basevariant)-$(basename $accent)
    done
done

# cleanup
rm -r rose-pine
rm -r rose-pine-dawn
rm -r rose-pine-moon
