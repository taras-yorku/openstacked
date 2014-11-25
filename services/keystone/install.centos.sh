#!/bin/bash

CURRENT_DIR="${BASH_SOURCE%/*}"

## CONSTANTS
KEYSTONE_SQL_INSTALL="$CURRENT_DIR/support/install.sql"
KEYSTONE_CONF_INSTALL="$CURRENT_DIR/support/keystone.conf"
KEYSTONE_CONF_PATH="/etc/keystone/keystone.conf"

log "Installing Keystone module" ":h1"

log "1. Processing keystone install sql file"

read_file "$KEYSTONE_SQL_INSTALL"  | m4 -DKEYSTONE_DBPASS=$KEYSTONE_DBPASS -DKEYSTONE_DBUSER=$KEYSTONE_DBUSER | mysql -u root -p$MYSQL_ROOT_PASS

log "2. Installing Keystone Package"
yum -y -q install openstack-keystone python-keystoneclient

log "3. Setting up Keystone config file"
ADMIN_TOKEN=`openssl rand -hex 10`
MYSQL_CONNECTION="mysql://${KEYSTONE_DBUSER}:${KEYSTONE_DBPASS}@controller/keystone"
log "4. Overriding $KEYSTONE_CONF_PATH"
read_file "$KEYSTONE_CONF_INSTALL" | m4 -DADMIN_TOKEN=$ADMIN_TOKEN -DMYSQL_CONNECTION=$MYSQL_CONNECTION > $KEYSTONE_CONF_PATH

log "5. Creating generic certificates and keys and restrict access to the associated files"

keystone-manage pki_setup --keystone-user keystone --keystone-group keystone
chown -R keystone:keystone /var/log/keystone
chown -R keystone:keystone /etc/keystone/ssl
chmod -R o-rwx /etc/keystone/ssl

log "6. Populating the identify database"
su -s /bin/sh -c "keystone-manage db_sync" keystone

log "7. Starting Keystone service"

systemctl enable openstack-keystone.service
systemctl start openstack-keystone.service

log "8. Setting up crontab for user 'keystone' to purge expired tokens every hour"
(crontab -l -u keystone 2>&1 | grep -q token_flush) || \
  echo '@hourly /usr/bin/keystone-manage token_flush >/var/log/keystone/keystone-tokenflush.log 2>&1' \
  >> /var/spool/cron/keystone

### TENANTS USERS AND MORE ###
log "Setting up tenants, users, and roles." ":h1"
