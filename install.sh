#!/bin/bash

export STACKED_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$STACKED_DIR" ]]; then STACKED_DIR="$PWD"; fi

source "$STACKED_DIR/lib/passwords.sh"
source "$STACKED_DIR/lib/functions.sh"


# source "$STACKED_DIR/services/plumbing/install.centos.sh"
source "$STACKED_DIR/services/keystone/install.centos.sh"
