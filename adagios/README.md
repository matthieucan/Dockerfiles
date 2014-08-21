# How to run

This is a Dockerfile to develop Adagios, so you must have it on your
system. Make sure it uses setuptools and not distutils:
```
$ sed -i 's/from distutils import setup/from setuptools import setup/g' adagios/setup.py
```

And then:
```
$ docker build -t adagios .
$ docker run -i -t --volume=/path/to/adagios:/opt/adagios/ -p 8001:8000 adagios
```

You should now have a running Adagios on http://localhost:8001
