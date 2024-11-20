#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: $0 <MYSQL_USER> <MYSQL_PASSWORD> <MYSQL_DB>"
    exit 1
fi

MYSQL_USER=$1
MYSQL_PASSWORD=$2
MYSQL_DB=$3
CONTAINER_NAME="policlinic_db_1"
BACKUP_FILE="./backup.sql"

docker exec "$CONTAINER_NAME" mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" $MYSQL_DB > "$BACKUP_FILE"

echo "Backup created: $BACKUP_FILE"