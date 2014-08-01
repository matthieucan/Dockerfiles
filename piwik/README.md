Docker recipe for Piwik
=======================

## Build:
```
$ docker build -t piwik .
```

## Run

* Let's create volume-only containers, to maintain our data:

For our MariaDB tables:
```
$ docker run -i -t -v /var/lib/mysql --name piwik_mysql_data piwik /bin/install-mysql.sh
```
For our Piwik configuration:
```
$ docker run -i -t -v /etc/piwik --name piwik_piwik_etc piwik /bin/true
```

* And now run a container like a boss:
```
$ docker run -d -p 8081:80 --volumes-from piwik_mysql_data --volumes-from piwik_piwik_etc piwik
```

Your MariaDB database and your Piwik configuration are safely stored
in volume-only Docker containers, check
[the Docker documentation](https://docs.docker.com/userguide/dockervolumes/#backup-restore-or-migrate-data-volumes)
to learn how to backup them.

## Usage

Navigate to http://localhost:8081/piwik
replacing localhost by your server's IP address if you're not testing
Piwik at home.

You can now proceed to the installation.
The database is "piwik", the user is "piwik" and the password is "piwik".

That's all folks!
