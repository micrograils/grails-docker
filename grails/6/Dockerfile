# 设置基础镜像为OpenJDK 11
FROM eclipse-temurin:11-jdk-alpine

# 设置作者标签
LABEL com.micrograils.docker.authors="aaron@micrograils.com"

# 定义Grails版本
ARG GRAILS_VERSION=6.0.0

# 设置环境变量
ENV GRAILS_VERSION=${GRAILS_VERSION} \
    GRAILS_HOME=/opt/grails \
    PATH=/opt/grails/bin:$PATH

# 切换工作目录到/opt
WORKDIR /opt

# 下载并安装Grails 6
RUN wget https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails && \
    grails -version

# 创建/app目录
WORKDIR /app

# 声明需要挂载的卷
VOLUME ["/root/.gradle", "/root/.m2", "/app"]

# 暴露端口（如果需要的话）
EXPOSE 8080

# 设置启动命令
CMD ["/bin/sh"]
