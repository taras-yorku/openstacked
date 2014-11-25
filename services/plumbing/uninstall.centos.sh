#!/bin/bash

log "Basic Environment" ":h1"

## REMOVE MySQL (MariaDB)
systemctl stop mariadb.service
systemctl disable mariadb.service

yum remove -y -q mariadb mariadb-server MySQL-python
rm -rf /var/lib/mysql

## REMOVE Rabbit MQ
systemctl stop rabbitmq-server.service
systemctl disable rabbitmq-server.service

yum remove -y -q erlang rabbitmq-server


## Remove OPENSTACK packages
yum remove -y -q openstack-selinux
