# 基于 Ubuntu 18.04 制作 Docker 镜像
FROM ubuntu:18.04
LABEL maintainer="Aaron<aaron@micrograils.com>"

# 设置参数
ARG GRAILS_VERSION=2.5.6
ARG JDK_VERSION=8
ARG MYSQL_VERSION=5.7
ARG GROOVY_VERSION=2.5.21

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装依赖、JDK、MySQL
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip git \
        openjdk-${JDK_VERSION}-jdk mysql-server-${MYSQL_VERSION} && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    usermod -d /var/lib/mysql/ mysql

# 安装 Groovy
RUN curl -L -o groovy-${GROOVY_VERSION}.zip <https://dl.bintray.com/groovy/maven/apache-groovy-binary-${GROOVY_VERSION}.zip> && \\
    unzip groovy-${GROOVY_VERSION}.zip && \\
    mv groovy-${GROOVY_VERSION} /opt/groovy && \\
    rm groovy-${GROOVY_VERSION}.zip

# 安装 Grails
RUN curl -L -o grails-${GRAILS_VERSION}.zip https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-${GRAILS_VERSION}.zip && \
    mv grails-${GRAILS_VERSION} /opt/grails && \
    rm grails-${GRAILS_VERSION}.zip

# 配置环境变量
ENV JAVA_HOME /usr/lib/jvm/java-${JDK_VERSION}-openjdk-amd64
ENV GROOVY_HOME /opt/groovy
ENV GRAILS_HOME /opt/grails
ENV PATH $PATH:$JAVA_HOME/bin:$GRAILS_HOME/bin:$GROOVY_HOME/bin

# 配置 MySQL 使用 UTF8 编码
RUN sed -i 's/^#\s*\(character_set_server\s*=\s*\).*$/\1utf8/' /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sed -i 's/^#\s*\(collation_server\s*=\s*\).*$/\1utf8_general_ci/' /etc/mysql/mysql.conf.d/mysqld.cnf

# 定义工作目录
WORKDIR /app

# 开放 MySQL、Grails 端口
EXPOSE 3306 8080

CMD ["/bin/sh"]
