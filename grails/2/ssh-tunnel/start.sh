#!/bin/bash

# Start MySQL service
service mysql start
service ssh start

# Create SSH reverse tunnel
ssh -R "${REMOTE_SSH_PORT}":localhost:"${LOCAL_SSH_PORT}" "${REMOTE_USER}"@"${REMOTE_HOST}" -N &

# Create SSH reverse tunnel
ssh -R "${REMOTE_HTTP_PORT}":localhost:"${LOCAL_HTTP_PORT}" "${REMOTE_USER}"@"${REMOTE_HOST}" -N &


# Keep the container running
tail -f /dev/null
