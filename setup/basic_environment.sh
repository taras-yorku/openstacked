#!/bin/bash

log "SETUP: Basic Environment" ":h1"

## Installing Prerequisites
log "Installing initial prerequisites", ":u"
log "1. ntp"

yum install -y ntp
log "Startin NTP Service..."

systemctl enable ntpd.service
systemctl start ntpd.service

log "2. yum-plugin-priorities"
yum install -y yum-plugin-priorities

log "3. epel-release package"
yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

log "4. rdo-release - OpenStack Packages"
yum install -y http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm

log "5. openstack-selinux"
yum install -y openstack-selinux

## Upgrading Packages

log ":br"
log "Upgrading packages" ":u"

yum upgrade

log ":br"

## MySQL Setup

log "Installing MySQL Database", ":u"

yum install -y mariadb mariadb-server MySQL-python

log "Starting MySQL..."
systemctl enable mariadb.service
systemctl start mariadb.service
log "Setting up MySQL..."
mysqladmin -u root password $MYSQ_ROOT_PASS
