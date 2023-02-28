#!/bin/bash

# 启动 MySQL 服务
service mysql start

# 启动 SSH 服务
service ssh start

# 保持容器运行
tail -f /dev/null
