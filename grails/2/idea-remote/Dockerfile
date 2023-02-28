FROM grails/grails2-mysql

# 更新安装包列表
RUN apt-get update && \
    # 安装 ssh
    apt-get install -y ssh && \
    # 清理安装包缓存
    apt-get clean && \
    # 删除已经安装的列表
    rm -rf /var/lib/apt/lists/*

# 修改 sshd 配置文件，允许 root 用户登录
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# 将启动脚本复制到容器中
COPY entrypoint.sh /entrypoint.sh

# 设置启动脚本可执行权限并运行
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
