# 第一阶段：构建 Grails 环境
FROM ubuntu:18.04 AS grails-env
LABEL maintainer="Aaron<aaron@micrograils.com>"

# 设置参数
ARG GRAILS_VERSION=2.5.6
ARG JDK_VERSION=8

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装依赖、JDK、Grails
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip \
        openjdk-${JDK_VERSION}-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o grails-${GRAILS_VERSION}.zip https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-${GRAILS_VERSION}.zip && \
    mv grails-${GRAILS_VERSION} /opt/grails && \
    rm grails-${GRAILS_VERSION}.zip

# 配置环境变量
ENV JAVA_HOME /usr/lib/jvm/java-${JDK_VERSION}-openjdk-amd64
ENV GRAILS_HOME /opt/grails
ENV PATH $PATH:$GRAILS_HOME/bin:$JAVA_HOME/bin

# 定义工作目录
WORKDIR /app

# 第二阶段：构建 MySQL 环境
FROM ubuntu:18.04 AS mysql-env

# 设置参数
ARG MYSQL_VERSION=5.7

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装 MySQL
RUN apt-get update && \
    apt-get install -y --no-install-recommends mysql-server-${MYSQL_VERSION} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configure MySQL to use UTF8 encoding
RUN sed -i 's/^#\s*\(character_set_server\s*=\s*\).*$/\1utf8/' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's/^#\s*\(collation_server\s*=\s*\).*$/\1utf8_general_ci/' /etc/mysql/mysql.conf.d/mysqld.cnf

# 将容器的 entrypoint 设置为启动 MySQL 的命令
ENTRYPOINT ["/usr/sbin/mysqld", "--user=mysql", "--console"]

# 第三阶段：组合 Grails 和 MySQL 环境
FROM grails-env

# 复制 MySQL 环境
COPY --from=mysql-env / /

# Expose port 8080 for Grails app
EXPOSE 8080

# 设置启动命令
CMD ["/bin/bash"]
