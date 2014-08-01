FROM ubuntu:trusty
MAINTAINER Matthieu Caneill <matthieu.caneill@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# sources
RUN apt-get update && apt-get upgrade -y

# packages
RUN apt-get install -y apache2 apache2-bin

RUN a2enmod ssl

RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD etc /etc
ADD website /var/www/website

EXPOSE 80
EXPOSE 443

CMD ["/usr/bin/supervisord"]
