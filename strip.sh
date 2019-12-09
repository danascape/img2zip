#!/usr/bin/env bash

export ANYDEVICE_DIR=$PWD/tools/Anydevice

if [[ -z "$(output/system.new.dat.br)" ]]; then
    echo "Do you want to make any other compression zip"
else 
    echo "starting compress script"
fi
   mv "output/system.new.dat.br" "$ANYDEVICE_DIR"
   cd "$ANYDEVICE_DIR"
   make normal
