#!/usr/bin/env bash

export PROJECT_DIR=$PWD
export TOOLS_DIR=$PWD/tools
export OUTPUT_DIR=$PWD/output

# Arguements check
if [ -z "${1}" ]  ; then
    echo -e "Usage: bash img2brotli.sh <Path to system.img>"
    exit 1
fi

if [[ -z "$(which python)" ]]; then
    echo "Install python!"
    echo "sudo apt-get install python"

elif [[ -z "$(which brotli)" ]]; then
    echo "Install brotli!"
    echo "sudo apt-get install brotli"

else
    echo "Dependencies Satisfied"
fi
    mkdir input
    mkdir output
    mv "$1" input/
    cd input/system.img
    mkdir compress
    python "$TOOLS_DIR/img2sdat/img2sdat.py" "system.img" -o "compress" -v "4" -p "system"
    cd compress
    brotli system.new.dat -2
    mv "system.new.dat.br" "$OUTPUT_DIR"
    cd "$PROJECT_DIR"

if [[ -z "$(find "$OUTPUT_DIR/system.new.dat.br")" ]]; then
    echo "compress script failed check screen for error and rerun"

else
    echo "img2brotli completed successfully."
    echo "find brotli compressed image in output dir."
fi
