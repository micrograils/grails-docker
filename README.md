# Grails Docker

To quickly use the Grails framework.



## Quick start

```shell
sudo docker run --rm micrograils/grails -v
```

with version `5.2.2`, it outputs:

```shell
| Grails Version: 5.2.2
| JVM Version: 11.0.13
```

Or, use `-it` to allocate a pseudo-TTY connected to the container’s stdin:

```shell
sudo docker run --rm -it micrograils/grails
```

> Note that when using `-it`, it is supported to pass in a generic grails command or leave it blank (default is `/bin/sh`)



## Use as a development environment

the first step is to confirm the grails version of your project, pull the corresponding version of the image to the local, and then use the `-v` command to start a container.

for example:

```
docker run -d -v /path_to_your_project:/app:rw -p 8080:8080 micrograils/grails:5.2.2 run-app
```

a few seconds later, you can access your app at the URL `http://localhost:8080`.

> The commands `help`, `list-profiles`, `create-app`, `run-app`, `war`, will be executed as `grails ${command}`. (The same goes for `-v` above). Commands other than these will be attempted to be executed directly.



## About Tagname

The full version format is：`:latest` or  `:${GRAILS_VERSION}-${JDK_VERSION}-${BASE_NAME}`.

`latest`

`5`, `5.2`, `5.2.2`, `5.2.2-jdk11`, `5.2.2-jdk11-alpine`

| Tagname                 | major        | minor               | patch                      | jdk           | base           |
| :---------------------- | ------------ | ------------------- | -------------------------- | ------------- | -------------- |
| **:latest**             | *max(major)* | *max(major, minor)* | *max(major, minor, patch)* | *DEFAULT_JDK* | *DEFAULT_BASE* |
| **:5**                  | **5**        | *max(5, minor)*     | *max(5, minor, patch)*     | *DEFAULT_JDK* | *DEFAULT_BASE* |
| **:5.2**                | **5**        | **2**               | *max(major, 2, patch)*     | *DEFAULT_JDK* | *DEFAULT_BASE* |
| **:5.2.2**              | **5**        | **2**               | **2**                      | *DEFAULT_JDK* | *DEFAULT_BASE* |
| **:5.2.2-jdk11**        | **5**        | **2**               | **2**                      | **jdk11**     | *DEFAULT_BASE* |
| **:5.2.2-jdk11-alpine** | **5**        | **5**               | **5**                      | **jdk11**     | **alpine**     |
| **:5-jdk11**            | **5**        | *max(5, minor)*     | *max(5, minor, patch)*     | **jdk11**     | *DEFAULT_BASE* |
| **:5-jdk11-alpine**     | **5**        | *max(5, minor)*     | *max(5, minor, patch)*     | **jdk11**     | **alpine**     |

|      |      |        |              |                     |
| ---- | ---- | ------ | ------------ | ------------------- |
| :5   | :5.2 | :5.2.2 | :5.2.2-jdk11 | :5.2.2-jdk11-alpine |
|      |      |        |              | :5.2.2-jdk11-       |
|      |      |        |              |                     |



- `5`
  - `5.2`
    - `5.2.2`
      - 
    - `5.2.1`
    - `5.2.0`
  - `5.1`
  - `5.0`

To view all tags, please visit: https://github.com/micrograils/grails-docker

## About Grails Framework

see https://grails.org

 