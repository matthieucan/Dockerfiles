# Dev notes

Build the image:
```
docker build -t debsources .
```

Run the container (with the correct path to your Debsources repo):
```
docker run -i -t -p 5001:5000 -v /path/to/debsources:/opt/debsources debsources bash
```

Make debsources up-to-date in the container:
```
service postgresql start
cd /opt/debsources
bin/debsources-dbadmin --createdb postgresql://docker:docker@localhost:5432/debsources
bin/debsources-update
bin/debsources-run-app --host 0.0.0.0
```

And then navigate in your browser to `http://localhost:5001`.

Note: about the configuration: in order for this instance to take
config.local.ini into account, you must be sure you don't have any
config[.local].ini in your /opt/debsources/etc.
