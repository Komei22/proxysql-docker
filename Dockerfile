FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y lsb-release wget mysql-client
RUN wget -O - 'http://repo.proxysql.com/ProxySQL/repo_pub_key' | apt-key add -
RUN echo deb http://repo.proxysql.com/ProxySQL/proxysql-1.4.x/$(lsb_release -sc)/ ./ | tee /etc/apt/sources.list.d/proxysql.list
RUN apt-get update
RUN apt-get install proxysql

ADD proxysql.cnf /etc/proxysql.cnf

COPY set_mysql_info.sh /usr/bin/set_mysql_info.sh
RUN chmod a+x /usr/bin/set_mysql_info.sh

COPY proxysql-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 6032 6033
