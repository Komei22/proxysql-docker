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

/usr/bin/proxysql --initial -c /etc/proxysql.cnf

sleep 1s  # wait running proxysql process

/usr/bin/set_mysql_info.sh

ps -lC proxysql | awk 'NR>1 {print $4}' | xargs kill -15

/usr/bin/proxysql -f -c /etc/proxysql.cnf
