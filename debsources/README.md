# Dev notes

Build the image:
```
docker build -t debsources .
```

Run the container:
```
docker run -i -t -v /path/to/debsources:/opt/debsources debsources bash
```

Make debsources up-to-date in the container:
```
service postgresql start
cd /opt/debsources
bin/debsources-dbadmin --createdb postgresql://docker:docker@localhost:5432/debsources
bin/debsources-update
bin/debsources-run-app --host 0.0.0.0
```
