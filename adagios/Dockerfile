FROM ubuntu:trusty
MAINTAINER Matthieu Caneill <matthieu.caneill@savoirfairelinux.com>

ENV DEBIAN_FRONTEND noninteractive

# sources
RUN apt-get update
RUN apt-get install -y curl
RUN curl http://download.opensuse.org/repositories/home:/kaji-project/xUbuntu_14.04/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/kaji-project/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/kaji.list
RUN curl http://download.opensuse.org/repositories/home:/ReAzem:/sfl-shinken-plugins/xUbuntu_14.04/Release.key | apt-key add -
RUN echo 'deb http://download.opensuse.org/repositories/home:/ReAzem:/sfl-shinken-plugins/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/shinkenplugins.list

RUN apt-get update && apt-get upgrade -y

# utils
RUN apt-get install -y python-simplejson coffeescript gettext make python-pip git lynx emacs

# packages
RUN apt-get install -y supervisor shinken-common shinken-module-graphite shinken-module-livestatus shinken-module-pickle-retention-file-generic shinken-module-simple-log shinken-module-booster-nrpe shinken-module-logstore-sqlite

RUN mv /etc/shinken/logstore_sqlite.cfg/logstore_sqlite.cfg /etc/shinken/modules/
RUN sed -i 's/logstore-sqlite/logsqlite/g' /etc/shinken/modules/logstore_sqlite.cfg
RUN sed -i 's/Simple-log/simple-log/g' /etc/shinken/brokers/broker.cfg
RUN sed -i 's/Graphite/graphite/g' /etc/shinken/brokers/broker.cfg
RUN sed -i 's/SimpleLog/simple-log/g' /etc/shinken/brokers/broker.cfg
RUN sed -i 's/BoosterNrpe/NrpeBooster/g' /etc/shinken/brokers/broker.cfg

# plugins
RUN apt-get install -y nagios-plugins
RUN apt-get install -y check-http2

# We need an old version of Django for Adagios
RUN pip install django\<1.5 python-geoip python-geoip-geolite2
RUN ln -s /usr/bin/django-admin /usr/bin/django-admin.py
RUN pip install git+git://github.com/pynag/pynag.git

# run permissions for user `shinken`
RUN chmod u+s /usr/lib/nagios/plugins/check_icmp
RUN chmod u+s /bin/ping
RUN chmod u+s /bin/ping6

RUN chown -R shinken: /etc/shinken

ADD etc /etc

EXPOSE 8000

CMD ["/usr/bin/supervisord"]
