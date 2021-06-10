#!/usr/bin/env bash

# Copyright (C) 2020 Saalim Quadri (danascape)
# SPDX-License-Identifier: GPL-3.0-or-later

# Variables
ZIP_DIR="$PWD/tools/zip"

if [[ -z "$(output/system.new.dat.br)" ]]; then
	echo "Do you want to make any other compression zip"
else
	echo "starting compress script"
fi

mv "output/system.new.dat.br" "$ZIP_DIR"
cd "$ZIP_DIR"
make normal
