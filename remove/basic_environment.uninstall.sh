#!/bin/bash

log "Basic Environment" ":h1"

yum remove -y -q mariadb mariadb-server MySQL-python
rm -rf /var/lib/mysql
