# 设置基础镜像为特定版本的 eclipse-temurin:11-jdk-alpine
FROM eclipse-temurin:11.0.20.1_1-jdk-alpine

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 安装OpenSSH服务器
RUN apk update && \
    apk add openssh && \
    rm -rf /var/cache/apk/*

# 生成SSH主机密钥文件
RUN ssh-keygen -A

# 允许root用户登录
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 设置SSH root密码（这是一个示例，请更改为您自己的密码）
RUN echo 'root:password' | chpasswd

# 切换工作目录到/opt
WORKDIR /opt

# 下载Gradle 7.2（仅下载，不解压）
RUN wget https://services.gradle.org/distributions/gradle-7.2-bin.zip

# 定义Grails版本
ARG GRAILS_VERSION=6.0.0

# 设置环境变量
ENV GRAILS_VERSION=${GRAILS_VERSION} \
    GRAILS_HOME=/opt/grails \
    PATH=/opt/grails/bin:$PATH

# 下载并安装Grails 6（这部分可以在未来更新Grails版本时重新运行）
RUN wget https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails && \
    grails -version

# 创建/app目录
WORKDIR /app

# 声明需要挂载的卷
VOLUME ["/root/.gradle", "/root/.m2", "/app", "/root/.ssh"]

# 暴露端口（8080和22）
EXPOSE 8080 22

# 启动SSH服务
CMD ["/usr/sbin/sshd", "-D", "-e"]
