FROM grails/grails2-mysql

# Set default values for variables
ENV LOCAL_SSH_PORT=22 \
    LOCAL_HTTP_PORT=8080

# Copy the start script to the container
COPY start.sh /start.sh

# Set permissions and execute the start script
RUN chmod +x /start.sh
CMD ["/start.sh"]
