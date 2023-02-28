#!/bin/bash

# Start MySQL service
service mysql start

# Start SSH service
service ssh start

# Check if $REMOTE_USER has been assigned a value.
if [ "$REMOTE_USER" != "CHANGE_ME" ]; then
    # Create SSH reverse tunnel for ssh
    ssh -R "${REMOTE_HOST}":"${REMOTE_SSH_PORT}":127.0.0.1:"${LOCAL_SSH_PORT}" "${REMOTE_USER}"@"${REMOTE_HOST}" -N &

    # Create SSH reverse tunnel for tomcat
    ssh -R "${REMOTE_HOST}":"${REMOTE_HTTP_PORT}":127.0.0.1:"${LOCAL_HTTP_PORT}" "${REMOTE_USER}"@"${REMOTE_HOST}" -N &
fi

# Keep the container running
tail -f /dev/null