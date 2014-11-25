#!/bin/bash

export STACKED_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$STACKED_DIR" ]]; then STACKED_DIR="$PWD"; fi

source "$DIR/functions.sh"
source "$STACKED_DIR/services/plumbing/uninstall.centos.sh"
