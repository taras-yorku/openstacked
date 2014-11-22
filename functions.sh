#!/bin/bash

# Check if Function exists
isFunction() {
  result=`type -t $1 | grep -q 'function'`
  return $result;
}


# Crude Logging
log() {
  if [ "$1" = ":br" ]; then echo "\n\n"; return; fi

  if [ "$2" = ":h1" ]; then echo "\n=============================================="; fi
  if [ "$2" = ":h2" ]; then echo "\n++++++++++++++++++++++++++++"; fi

  echo "log: $1"
  
  if [ "$2" = ":br" ]; then echo "\n\n"; fi
  if [ "$2" = ":u" ]; then echo "---------------------------------"; fi
  if [ "$2" = ":h1" ]; then echo "==============================================\n"; fi
  if [ "$2" = ":h2" ]; then echo "\n++++++++++++++++++++++++++++"; fi

}





if isFunction log;
then
  log "Found Log Function. Using logging system."
else
  echo "not found"
fi
