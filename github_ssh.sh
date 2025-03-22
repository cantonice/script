# 配置github的ssh（可选）
cd $HOME/.ssh && touch config
cat <<EOT >> config
Host github.com
    HostName ssh.github.com
    Port 443
    User git
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa
EOT

echo "配置github的ssh......."
ssh-keygen -t rsa -b 4096 -C "your email"
ssh-add $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub
echo "---请将上面的公钥添加到github的ssh key中---"
