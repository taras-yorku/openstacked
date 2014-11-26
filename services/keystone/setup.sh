#!/bin/bash

# Load functions incase it's not loaded
CURRENT_DIR="${BASH_SOURCE%/*}"
source "$CURRENT_DIR/../../lib/functions.sh"

if [ -z "$ADMIN_TOKEN"];
  then
  read -p "Please enter the token from keystone config file: " token
  ADMIN_TOKEN=$token

  read -p "Using $ADMIN_TOKEN...continue? (Y/n) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    log "Not continuing"
    exit 1
  fi
fi

export OS_SERVICE_TOKEN=$ADMIN_TOKEN
export OS_SERVICE_ENDPOINT=http://controller:35357/v2.0
log $OS_SERVICE_TOKEN
systemctl start openstack-keystone.service

log "1. Creating admin tenant"

keystone tenant-create --name admin --description "Admin Tenant"
