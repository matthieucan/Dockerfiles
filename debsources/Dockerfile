FROM debian:jessie
# jessie is needed for libjs-highlight
MAINTAINER Matthieu Caneill <matthieu.caneill@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# PACKAGES
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y supervisor
RUN apt-get install -y \
    apache2 \
    libapache2-mod-fcgid \
    libapache2-mod-wsgi \
    libjs-highlight \
    python-debian \
    python-flask \
    python-flup \
    python-magic \
    tango-icon-theme \
    debmirror \
    exuberant-ctags \
    postgresql-9.3 \
    python-matplotlib \
    python-psycopg2 \
    python-sqlalchemy \
    sloccount \
    python-nose \
    python-flaskext.wtf

# dev tools
RUN apt-get install -y lynx emacs

# SETUP

### DEBSOURCES
RUN apt-get install -y git
RUN cd /opt && git clone git://anonscm.debian.org/qa/debsources.git
ADD config.local.ini /opt/debsources/etc/
RUN chmod o+r /opt/debsources/etc/config.local.ini

### POSTGRES
# needs to run postgres to create a user
USER postgres
RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker debsources &&\
    /opt/debsources/bin/dbadmin --createdb postgresql://docker:docker@localhost:5432/debsources
USER root
    
RUN apt-get install -y dpkg-dev


# OTHER
ADD etc /etc
RUN rm /etc/apache2/sites-enabled/000-default.conf

EXPOSE 5000


# docker run -i -p=5001:5000 -v=/home/matthieu/work/debian/debsources/testdata/mirror:/opt/testdata/mirror -t debsources bash

CMD ["/usr/bin/supervisord"]
