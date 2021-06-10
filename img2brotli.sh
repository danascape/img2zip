#!/usr/bin/env bash

# Copyright (C) 2020 Saalim Quadri (danascape)
# SPDX-License-Identifier: GPL-3.0-or-later

# Setup variables
PROJECT_DIR="$PWD"
TOOLS_DIR="$PWD/tools"
OUTPUT_DIR="$PWD/output"

# Arguements check
if [ -z "${1}" ]; then
	echo -e "Usage: bash img2brotli.sh <Path to system.img>"
	exit 1
fi

# Packages
if [[ -z "$(which python)" ]]; then
	echo "python is not installed"
	echo "Install it by using 'sudo apt-get install python'"
	exit 1
elif [[ -z "$(which brotli)" ]]; then
	echo "brotli is not installed"
	echo "Install it by using 'sudo apt-get install brotli'"
	exit 1
fi

# Create directories
mkdir input
mkdir output

# Copy system image
cp "$1" input/system.img

# Do the sorcery
cd input/
mkdir compress
python "$TOOLS_DIR/img2sdat/img2sdat.py" "system.img" -o "compress" -v "4" -p "system"
cd compress
brotli system.new.dat -2
mv "system.new.dat.br" "$OUTPUT_DIR"
cd "$PROJECT_DIR"

# Check if its done
if [[ -z "$(find "$OUTPUT_DIR/system.new.dat.br")" ]]; then
	echo "compress script failed check screen for error and rerun"

else
	echo "img2brotli completed successfully."
	echo "find brotli compressed image in output dir."
fi
