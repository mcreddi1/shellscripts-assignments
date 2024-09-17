#!/bin/bash

###############################################
# this script will Backup and restore a mysql database from a running Docker mysql container
# Author : Chinnapa Reddy Mora
# Version : v0.0.1
#
#Usage : sh aws-resource-list.sh <region> <service_name>
#Example: sh aws-resource-list.sh us-east-1 IAM
#################################################

# Backup
docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

# Restore
cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE