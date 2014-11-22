#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/functions.sh"
source "$DIR/remove/basic_environment.uninstall.sh"
