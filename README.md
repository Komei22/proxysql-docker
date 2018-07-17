# proxysql-docker

## Build&Run

```
# build
docker build -t <container name> .
# run
docker run -it -d -p 6032:6032 -e MYSQL_HOSTNAME=<mysql hostname> <container name>
```

## Environment variables for mysql
- MYSQL_HOSTNAME
  - backend mysql hostname

### Set mysql information
```
docker exec -it <container name> /usr/bin/set_mysql_info.sh
```


## Proxysql remote admin connection

```
mysql -u remote_admin -premote_admin -h 127.0.0.1 -P6032 --prompt='Admin> '
```
