FROM debian:jessie
MAINTAINER Matthieu Caneill <matthieu.caneill@savoirfairelinux.com>

ENV DEBIAN_FRONTEND noninteractive

# Sources
RUN apt-get update
RUN apt-get install -y curl

RUN curl http://debian.piwik.org/repository.gpg | apt-key add -
RUN echo 'deb http://debian.piwik.org/ piwik main' >> /etc/apt/sources.list.d/piwik.list

RUN apt-get update && apt-get upgrade -y

# Packages
RUN apt-get install -y piwik mariadb-server mariadb-client supervisor

ADD install-mysql.sh /usr/bin/

# Apache config
RUN cp /usr/share/piwik/config/apache.conf /etc/apache2/sites-enabled/piwik.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf
RUN sed -i 's/\# Alias \/piwik \/usr\/share\/piwik/Alias \/piwik \/usr\/share\/piwik/' /etc/apache2/sites-enabled/piwik.conf

# Scripts
ADD install-mysql.sh /bin/
RUN chmod +x /bin/install-mysql.sh

ADD etc /etc

EXPOSE 80

CMD ["/usr/bin/supervisord"]
