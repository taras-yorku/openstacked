#!/bin/bash


# Check if Function exists
function isFunction() {
  result=`type -t $1 | grep -q 'function'`
  return $result;
}

# Echo with -e
function puts() { echo -e "$1"; }

# Crude Logging
function log() {
  if [ "$1" = ":br" ]; then puts "\n\n"; return; fi

  if [ "$2" = ":h1" ]; then puts "\n=============================================="; fi
  if [ "$2" = ":h2" ]; then puts "\n++++++++++++++++++++++++++++"; fi

  PREFIX=""
  if [ "$2" = ":pre" ] && [[ -n "$3" ]]; then PREFIX="$3: "; else PREFIX=""; fi

  puts "$PREFIX$1"

  if [ "$2" = ":br" ]; then puts "\n\n"; fi
  if [ "$2" = ":u" ]; then puts "-----------------------------------------\n"; fi
  if [ "$2" = ":h1" ]; then puts "==============================================\n"; fi
  if [ "$2" = ":h2" ]; then puts "++++++++++++++++++++++++++++"; fi

}

# System Messages
function sys_log(){ log "$1" ":pre" "SYS"; }

# Read File contens
function read_file() { contents=`cat "$1"`; echo -e "$contents"; }

#### SUPPORTING Libraries
if hash m4 2>/dev/null; then sys_log "Using m4"; else yum -y -q install m4; fi
