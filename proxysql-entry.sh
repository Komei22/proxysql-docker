#!/bin/bash
if [ -z "$MYSQL_HOST" ]; then
  echo >&2 'Error: You need to specify $MYSQL_HOST'
  exit 1
fi

if [ -z "$MYSQL_USER" ]; then
  echo >&2 'Error: You need to specify $MYSQL_USER'
  exit 1
fi

if [ -z "$MYSQL_USER_PASSWORD" ]; then
  echo >&2 'Error: You need to specify $MYSQL_USER_PASSWORD'
  exit 1
fi

/usr/bin/proxysql --initial -f -c /etc/proxysql.cnf
