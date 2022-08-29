# Grails Docker

### NOTE

This repo is a curated version of `micrograils/grails`.

For all versions of docker images (with `Dockerfile`) ，please see: [micrograils/grails](https://hub.docker.com/r/micrograils/grails)



### Tagname

`latest` --> `5.2.2-jdk11`

`5.2.2-jdk11`

`5.2.2-jdk8`

### About Gralde

The gradle version in all docker images is the same as grails needs. For example: the gradle version defined in `grails 5.5.2` is `7.2`, then the gradle version in the `5.2.2-jdk*` image is `7.2`, no special instructions, and no need to define it separately.

### About base

So far, all docker images are extended from alpine.