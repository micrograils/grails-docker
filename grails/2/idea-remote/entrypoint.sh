#!/bin/bash

# 启动 MySQL 服务
service mysql start

# 启动 SSH 服务
service ssh start

# 输出日志
echo "$(date): Container started successfully."

# 保持容器运行
tail -f /dev/null
