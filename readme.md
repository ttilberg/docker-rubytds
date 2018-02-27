# Ruby with FreeTds image

This is a simple image template that can get you started in a Ruby container with FreeTDS installed so that you can use the TinyTDS gem to talk to MS SQL Server.

It starts with a base Ruby image, and downloads and builds FreeTDS from source.

# Usage

Grab the Dockerfile expand upon it, or build and use it as a base image.

```
docker build -t ruby-freetds .
```

You can also specify the version of FreeTDS that gets installed with an arg:

```
docker build -t ruby-freetds --build-arg FREETDS=freetds-1.00.95
```

By default it uses `1.00.85` which has been tested to work correctly with at least `tiny_tds (2.1.1)` and `Ruby (2.4)`.

The `FREETDS` var is used to interpolate the following url to download from:

`wget http://www.freetds.org/files/stable/$FREETDS.tar.gz`

So, make sure that whatever you use actually exists.
