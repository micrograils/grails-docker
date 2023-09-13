# 第一阶段：下载 Gradle 文件并保存到临时阶段
FROM alpine as gradle-downloader

# 切换工作目录到/opt
WORKDIR /opt

# 定义 Gradle 版本
ARG GRADLE_VERSION=7.2
ADD https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip /opt

# 第二阶段：下载 Grails 文件并保存到临时阶段
FROM alpine as grails-downloader

# 切换工作目录到/opt
WORKDIR /opt

# 定义 Grails 版本
ARG GRAILS_VERSION=6.0.0
ADD https://github.com/grails/grails-core/releases/download/v${GRAILS_VERSION}/grails-${GRAILS_VERSION}.zip /opt
RUN unzip grails-${GRAILS_VERSION}.zip


# 第三阶段：构建最终镜像
# 设置基础镜像为特定版本的 eclipse-temurin:11-jdk-alpine
FROM eclipse-temurin:11.0.20.1_1-jdk-alpine

# 定义 Gradle 和 Grails 版本信息
ARG GRADLE_VERSION=7.2
ARG GRAILS_VERSION=6.0.0

# 复制下载的文件到最终镜像
COPY --from=gradle-downloader /opt/gradle-${GRADLE_VERSION}-bin.zip /opt
COPY --from=grails-downloader /opt/grails-${GRAILS_VERSION} /opt

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 添加常用别名到 /root/.profile
RUN echo "alias l.='ls -d .* --color=auto'" >> /root/.profile && \
    echo "alias ll='ls -l --color=auto'" >> /root/.profile && \
    echo "alias la='ls -la --color=auto'" >> /root/.profile && \
    echo "alias ls='ls --color=auto'" >> /root/.profile

# 安装 netstat, wget, curl, openssh 并生成SSH密钥
RUN apk update && \
    apk add --no-cache net-tools wget curl openssh && \
    ssh-keygen -A && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:password' | chpasswd

# 设置环境变量
ENV GRAILS_VERSION=${GRAILS_VERSION} \
    GRAILS_HOME=/opt/grails \
    PATH=/opt/grails/bin:$PATH

# 创建/app目录
WORKDIR /app

# 声明需要挂载的卷
VOLUME ["/root/.gradle", "/root/.m2", "/app", "/root/.ssh"]

# 暴露端口（8080和22）
EXPOSE 8080 22

# 启动SSH服务
CMD ["/usr/sbin/sshd", "-D", "-e"]
