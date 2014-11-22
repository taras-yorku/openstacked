#!/bin/bash

# Check if Function exists
isFunction() {
  result=`type -t $1 | grep -q 'function'`
  return $result;
}


# Crude Logging
log() {
  if [ "$1" = ":br" ]; then echo -e "\n\n"; return; fi

  if [ "$2" = ":h1" ]; then echo -e "\n=============================================="; fi
  if [ "$2" = ":h2" ]; then echo -e "\n++++++++++++++++++++++++++++"; fi

  PREFIX=""
  if [ "$2" = ":pre" ] && [[ -n "$3" ]]; then PREFIX="$3: "; else PREFIX=""; fi

  echo -e "$PREFIX$1"

  if [ "$2" = ":br" ]; then echo -e "\n\n"; fi
  if [ "$2" = ":u" ]; then echo -e "---------------------------------"; fi
  if [ "$2" = ":h1" ]; then echo -e "==============================================\n"; fi
  if [ "$2" = ":h2" ]; then echo -e "\n++++++++++++++++++++++++++++"; fi

}





if isFunction log;
then
  log "Found Log Function. Using logging system." ":pre" "LOG"
else
  echo "not found"
fi
