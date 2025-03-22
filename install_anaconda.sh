#!/bin/bash

# 定义Anaconda安装包URL和文件名
ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh"
INSTALLER="Anaconda3-2024.10-1-Linux-x86_64.sh"

# 检查安装包是否已存在
if [ ! -f "$INSTALLER" ]; then
    echo "下载Anaconda安装包..."
    wget $ANACONDA_URL
else
    echo "安装包已存在，跳过下载步骤"
fi

bash $INSTALLER 

# 添加环境变量
$HOME/anaconda3/bin/conda init bash
source .bashrc

echo "Anaconda安装完成！"

# 配置清华镜像
cd $HOME/anaconda3
cat <<EOT >> ~/.condarc
channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
show_channel_urls: true
 
ssl_verify: true
allow_conda_downgrades: true
EOT
 
