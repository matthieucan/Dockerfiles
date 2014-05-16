FROM debian:wheezy
MAINTAINER Matthieu Caneill <matthieu.caneill@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ADD etc /etc

RUN apt-get update && apt-get install -y postfix dovecot-common
