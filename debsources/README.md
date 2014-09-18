# Dev notes

```
docker build -t debsources .

docker run -i -t -v /path/to/debsources:/opt/debsources debsources bash

cd /opt/debsources
(python setup.py install)
mkdir /etc/debsources
cp etc/config.local.ini /etc/debsources/config.ini
service postgresql start
bin/debsources-dbadmin --createdb postgresql://docker:docker@localhost:5432/debsources
bin/debsources-update
bin/debsources-run-app --host 0.0.0.0
```
