# proxysql-docker

## Build&Run

```
# build
docker build -t <container name> .
# run
docker run -it -d -p 6032:6032 -e MYSQL_HOSTNAME=<mysql hostname> <container name>
```

## Environment variables
- MYSQL_HOSTNAME
  - backend mysql hostname

## Proxysql remote admin connection

```
mysql -u remote_admin -premote_admin -h 127.0.0.1 -P6032 --prompt='Admin> '
```
