#!/bin/bash

log "SETUP: Basic Environment" ":h1"

setenforce  0 # disable selinux

## Installing Prerequisites
log "Installing initial prerequisites", ":u"
log "1. ntp"

yum install -y -q ntp
log "Startin NTP Service..."

systemctl enable ntpd.service
systemctl start ntpd.service

log "2. yum-plugin-priorities"
yum install -y -q yum-plugin-priorities

log "3. epel-release package"
yum install -y -q http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

log "4. rdo-release - OpenStack Packages"
yum install -y -q http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm

log "5. openstack-selinux"
yum install -y -q openstack-selinux

## Upgrading Packages

log ":br"
log "Upgrading packages" ":u"

yum -yq upgrade

log ":br"

## MySQL Setup

log "Installing MySQL Database", ":u"

yum install -y -q mariadb mariadb-server MySQL-python

log "Starting MySQL..."
systemctl enable mariadb.service
systemctl start mariadb.service
log "Setting up MySQL...Using Root Password: $MYSQL_ROOT_PASS"
mysqladmin password "$MYSQL_ROOT_PASS"

log ":br"

log "Installing Messaging Server .... RabbitMQ" ":u"
yum install -y -q erlang rabbitmq-server
echo 0 > /selinux/enforce

log "Starting RabbitMQ"
systemctl enable rabbitmq-server.service
systemctl start rabbitmq-server.service

rabbitmqctl change_password guest "$RABBIT_PASS"
