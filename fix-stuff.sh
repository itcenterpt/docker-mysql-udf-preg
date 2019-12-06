#!/bin/bash
set -eo pipefail

mysql_upgrade -p$MYSQL_ROOT_PASSWORD

for init_file in /docker-entrypoint-initdb.d/*.sql
do
	echo "$0: running $init_file"
	mysql -p$MYSQL_ROOT_PASSWORD < "$init_file"
done
