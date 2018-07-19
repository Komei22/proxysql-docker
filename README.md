# simple-roxysql-docker

simple-proxysql-docker collect statistics of a mysql databse.

## Build&Run

```
# build
docker build -t <container name> .
# run
docker run -it -d -p 6032:6032 -e <environment variables> hostname> <container name>
```

## Environment variables for mysql
- $MYSQL_HOSTNAME
  - backend mysql hostname
- $MYSQL_USER
  - mysql username
- $MYSQL_USER_PASSWORD
  - MYSQL_USER's password

## Proxysql remote admin connection

```
mysql -uremote_admin -premote_admin -h 127.0.0.1 -P6032 --prompt='Admin> '
```
