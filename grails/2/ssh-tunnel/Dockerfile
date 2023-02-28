FROM grails/grails2-mysql

RUN apt-get update && \
    apt-get install -y ssh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Set default values for variables
ENV LOCAL_SSH_PORT=22 \
  LOCAL_HTTP_PORT=8080 \
  REMOTE_SSH_PORT=2222 \
  REMOTE_HTTP_PORT=8888 \
  REMOTE_HOST=public.yourdomain.com \
  REMOTE_USER=CHANGE_ME

# Copy the start script to the container
COPY start.sh /start.sh

# Set permissions and execute the start script
RUN chmod +x /start.sh
CMD ["/start.sh"]