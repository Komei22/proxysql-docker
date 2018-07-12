FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y lsb-release wget
RUN wget -O - 'http://repo.proxysql.com/ProxySQL/repo_pub_key' | apt-key add -
RUN echo deb http://repo.proxysql.com/ProxySQL/proxysql-1.4.x/$(lsb_release -sc)/ ./ | tee /etc/apt/sources.list.d/proxysql.list
RUN apt-get update
RUN apt-get install proxysql

ADD proxysql.cnf /etc/proxysql.cnf

EXPOSE 6032 6033
