#!/bin/bash
RANDOM_PASSWORD=`openssl rand -hex 10`   #  Random password to use as password
PASSWORD=root                            #  Use either $RANDOM_PASSWORD or choose one

MYSQL_ROOT_PASS=$PASSWORD                # Password fo MySQL root account
RABBIT_PASS=$PASSWORD                    #  Password of user guest of RabbitMQ
KEYSTONE_DBPASS=$PASSWORD                #	Database password of Identity service
KEYSTONE_DBUSER=keystone                 #  KEYSTONE DB User
DEMO_PASS=$PASSWORD                      #	Password of user demo
ADMIN_PASS=$PASSWORD                     #	Password of user admin
GLANCE_DBPASS=$PASSWORD                  #	Database password for Image Service
GLANCE_PASS=$PASSWORD                    #	Password of Image Service user glance
NOVA_DBPASS=$PASSWORD                    #	Database password for Compute service
NOVA_PASS=$PASSWORD                      #	Password of Compute service user nova
DASH_DBPASS=$PASSWORD                    #	Database password for the dashboard
CINDER_DBPASS=$PASSWORD                  #	Database password for the Block Storage service
CINDER_PASS=$PASSWORD                    #	Password of Block Storage service user cinder
NEUTRON_DBPASS=$PASSWORD                 #	Database password for the Networking service
NEUTRON_PASS=$PASSWORD                   #	Password of Networking service user neutron
HEAT_DBPASS=$PASSWORD                    #	Database password for the Orchestration service
HEAT_PASS=$PASSWORD                      #	Password of Orchestration service user heat
CEILOMETER_DBPASS=$PASSWORD              #	Database password for the Telemetry service
CEILOMETER_PASS=$PASSWORD                #	Password of Telemetry service user ceilometer
TROVE_DBPASS=$PASSWORD                   #	Database password of Database service
TROVE_PASS=$PASSWORD                     #	Password of Database Service user trove
