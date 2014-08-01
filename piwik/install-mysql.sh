#!/bin/bash

set -e

VOLUME_HOME="/var/lib/mysql"

mysql_install_db --user=mysql --ldata=$VOLUME_HOME
service mysql start

mysql -e "CREATE DATABASE piwik /*!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -e "CREATE USER piwik@localhost IDENTIFIED BY 'piwik';"
mysql -e "GRANT ALL PRIVILEGES ON piwik.* to piwik@localhost;"
mysql -e "GRANT FILE ON *.* TO piwik@localhost;"

echo "Installation of MariaDB: done. \o/"
