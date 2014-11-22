#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/common/passwords.sh"
source "$DIR/common/functions.sh"
source "$DIR/setup/basic_environment.sh"
