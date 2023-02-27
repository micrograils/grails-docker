FROM grails/grails2-mysql

# Set default values for variables
ENV REMOTE_HOST=localhost \
    REMOTE_USER=root \
    REMOTE_SSH_PORT=10022 \
    LOCAL_SSH_PORT=22 \
    REMOTE_HTTP_PORT=18080 \
    LOCAL_HTTP_PORT=8080

RUN apt-get update && \
    apt-get install -y ssh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the start script to the container
COPY start.sh /start.sh

# Set permissions and execute the start script
RUN chmod +x /start.sh
CMD ["/start.sh"]
