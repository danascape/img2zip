#!/usr/bin/env bash

if [[ -z "$(which python)" ]]; then
    echo "Install python!"
    echo "sudo apt-get install python"
    
elif [[ -z "$(which forever)" ]]; then
    echo "Install brotli!"
    echo "sudo apt-get install brotli"
    
elif [[ -z "$(find system.img)" ]]; then
    echo "where is system image ?!"
    echo "paste system.img on current directory"
    
else
    git fetch origin master
    git reset --hard origin/master
fi    
