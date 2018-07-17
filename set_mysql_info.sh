#!/bin/bash
echo "set_mysql_info.sh"
mysql -uadmin -padmin -h 127.0.0.1 -P6032 -e "INSERT INTO mysql_servers (hostgroup_id, hostname, port) VALUES (0, '$MYSQL_HOSTNAME', 3306)"
mysql -h 127.0.0.1 -P6032 -uadmin -padmin -e "LOAD MYSQL SERVERS TO RUNTIME; SAVE MYSQL SERVERS TO DISK;"
