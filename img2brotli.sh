#!/usr/bin/env bash

export PROJECT_DIR=$PWD
export TOOLS_DIR=$PWD/tools
export OUTPUT_DIR=$PWD/output

if [[ -z "$(which python)" ]]; then
    echo "Install python!"
    echo "sudo apt-get install python"
    
elif [[ -z "$(which forever)" ]]; then
    echo "Install brotli!"
    echo "sudo apt-get install brotli"
    
elif [[ -z "$(find input/system.img)" ]]; then
    echo "where is system image ?!"
    echo "paste system.img on current directory"
    
else
    git fetch origin master
    git reset --hard origin/master
    mkdir input 
    mkdir output
    mv system.img input/
    cd input/
    mkdir compress
    python $TOOLS_DIR/img2sdat/img2sdat.py system.img -o compress -v 4 -p system
    cd compress 
    brotli system.new.dat -2
    mv system.new.dat.br $OUTPUT_DIR
    cd $PROJECT_DIR
fi    

if [[ -z "$(find $OUTPUT_DIR/system.new.dat.br)" ]]; then
    echo "compress script failed check screen for error and rerun"
    
else
    echo "img2brotli completed successfully."
    echo "find brotli compressed image in output dir."
