# Grails Docker

![License](https://img.shields.io/badge/license-Apache%202.0-blue) | ![License](https://img.shields.io/badge/grails-5.2.5-green)

To quickly use the Grails framework.

> more info see: https://github.com/micrograils/grails-docker

## Quick start

```shell
sudo docker run --rm grails/grails grails -v
```

with version `5.2.5`, it outputs:

```shell
| Grails Version: 5.2.5
| JVM Version: 11.0.16.1
```

Or, use `-it` to allocate a pseudo-TTY connected to the container’s stdin:

```shell
sudo docker run --rm -it grails/grails
```

> Note that when using `-it`, it is supported to pass in a generic grails command or leave it blank (default is `/bin/sh`)



## Use as a development environment

the first step is to confirm the grails version of your project, pull the corresponding version of the image to the local, and then use the `-v` command to start a container.

for example:

```
docker run -d -v /path_to_your_project:/app:rw -p 8080:8080 grails/grails:5.2.5 grails run-app
```

a few seconds later, you can access your app at the URL `http://localhost:8080`.

**NOTE**

The `Dockerfile` declares several `VOLUME`s :

```dockerfile
VOLUME ["/root/.gradle", "/root/.m2", "/app"]
```

If you already have `gradle` or `maven` related resources locally, it is strongly recommended that you map the relevant paths to the `container`. especially in some areas where the `gradle-bin` file cannot be downloaded smoothly :)

Now, the complete command example is as follows (note the substitution of local paths):

```shell
docker run -d \
    --name grailsapp \
    -v /path_to_your_project:/app:rw \
    -v ~/.gradle:/root/.gradle \
    -v ~/.m2:/root/.m2 \
    -p 8080:8080 \
    grails/grails:5.2.5 \
    grails run-app
```

## About Tag

The full version format is：`:latest` , `:${GRAILS_MAJOR_VERSION}`, `:${GRAILS_MINOR_VERSION}`, `:${GRAILS_FULL_VERSION}`.

for grails 5:

`:5`, `:5.2`, `:5.2.5`

## About Base Image

So far, all docker images are extended from alpine.

## About Grails Framework

see https://grails.org

 