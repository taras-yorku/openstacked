#!/bin/bash

export DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi


source "$DIR/../common/functions.sh"


KEYSTONE_DBPASS="root"
sub_vars "TEST \\n ${KEYSTONE_DBPASS} or $KEYSTONE_DBPASS"

TEST="testing variable"
STACKED="stacked is stoked"
f=`read_file "$DIR/random.txt"`
puts "$f"


if isFunction log;
then
  log "Found Log Function. Using logging system." ":pre" "LOG"
  log "Testing Heading 1" ":h1"
  log "Testing Heading 2" ":h2"
else
  echo "not found"
fi
