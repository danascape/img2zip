#!/usr/bin/env bash

export ZIP_DIR=$PWD/tools/zip

if [[ -z "$(output/system.new.dat.br)" ]]; then
    echo "Do you want to make any other compression zip"
else
    echo "starting compress script"
fi
   mv "output/system.new.dat.br" "$ZIP_DIR"
   cd "$ZIP_DIR"
   make normal
