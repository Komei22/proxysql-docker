#!/bin/bash
mysql -uadmin -padmin -h 127.0.0.1 -P6032 -e "INSERT INTO mysql_servers (hostgroup_id, hostname, port) VALUES (0, '$MYSQL_HOST', 3306);"
mysql -uadmin -padmin -h 127.0.0.1 -P6032 -e "INSERT INTO mysql_users (username, password, active, default_hostgroup) VALUES ('$MYSQL_USER', '$MYSQL_USER_PASSWORD', 1, 0);"
mysql -h 127.0.0.1 -P6032 -uadmin -padmin -e "LOAD MYSQL SERVERS TO RUNTIME; SAVE MYSQL SERVERS TO DISK; LOAD MYSQL USERS TO RUNTIME; SAVE MYSQL USERS TO DISK;"

mysql -h 127.0.0.1 -P6032 -uadmin -padmin -e "UPDATE global_variables SET variable_value='$MYSQL_USER' WHERE variable_name='mysql-monitor_username';"
mysql -h 127.0.0.1 -P6032 -uadmin -padmin -e "UPDATE global_variables SET variable_value='$MYSQL_USER' WHERE variable_name='mysql-monitor_password';"
mysql -h 127.0.0.1 -P6032 -uadmin -padmin -e "LOAD MYSQL VARIABLES TO RUNTIME;SAVE MYSQL VARIABLES TO DISK;"
