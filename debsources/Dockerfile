FROM debian:jessie
# jessie is needed for libjs-highlight
MAINTAINER Matthieu Caneill <matthieu.caneill@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
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

RUN service postgresql start\
    && su postgres -c 'createuser --superuser root'

EXPOSE 5000

CMD service postgresql start \
    && bash

# docker run -i -v=/home/matthieu/work/debian/debsources:/opt/debsources -t debsources
