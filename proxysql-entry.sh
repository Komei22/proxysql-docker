#!/bin/bash
if [ -z "$MYSQL_HOSTNAME"]; then
  echo >&2 'Error: You need to specify MYSQL_HOSTNAME'
  exit 1
fi

/usr/bin/proxysql --initial -c /etc/proxysql.cnf
