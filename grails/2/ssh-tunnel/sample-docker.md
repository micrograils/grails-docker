
docker run -d \
    --name grails2-dev \
    -e REMOTE_SSH_PORT=22 \
    -e LOCAL_SSH_PORT=22 \
    -e REMOTE_HTTP_PORT=8080 \
    -e LOCAL_HTTP_PORT=8080 \
    -e REMOTE_USER=user \
    -e REMOTE_HOST=example.com \
    grails/grails2-mysql

or:

docker run -d \
    --name grails2-dev \
    -e REMOTE_SSH_PORT=22 \
    -e REMOTE_HTTP_PORT=8080 \
    -e REMOTE_USER=user \
    -e REMOTE_HOST=example.com \
    grails/grails2-mysql

