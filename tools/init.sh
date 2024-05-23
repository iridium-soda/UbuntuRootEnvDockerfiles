# To initialize a raw ubuntu:24.04 container

# Initialize tsinghua apt source

echo "# Tsinghua source list copy from https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/
# Change https to prevent certificate error
# Should be placed at /etc/apt/sources.list.d/ubuntu.sources

Types: deb
URIs: http://mirrors.tuna.tsinghua.edu.cn/ubuntu
Suites: noble noble-updates noble-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
# Types: deb-src
# URIs: https://mirrors.tuna.tsinghua.edu.cn/ubuntu
# Suites: noble noble-updates noble-backports
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
Types: deb
URIs: http://security.ubuntu.com/ubuntu/
Suites: noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# Types: deb-src
# URIs: http://security.ubuntu.com/ubuntu/
# Suites: noble-security
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 预发布软件源，不建议启用

# Types: deb
# URIs: https://mirrors.tuna.tsinghua.edu.cn/ubuntu
# Suites: noble-proposed
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# # Types: deb-src
# # URIs: https://mirrors.tuna.tsinghua.edu.cn/ubuntu
# # Suites: noble-proposed
# # Components: main restricted universe multiverse
# # Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg" >/etc/apt/sources.list.d/ubuntu.sources 

apt update

# Install ssh
apt-get install -y openssh-server
# 确保SSH目录存在
mkdir -p /var/run/sshd

# 设置SSH允许公钥登录
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

# 设置root用户的公钥（请确保你的公钥文件路径是正确的）
mkdir -p /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6Ra1gfqSqRrgNlJLA4e2yktGT7LUlxM9y5z28sGW2fAAXWqmH8V7OpIQLi+MAaTM67P10JfeRIITFsq/sCJgpJ0I0OQZA7xWS87gruocIo1ko9dDz2wlss+tB1U3AMqyIIS65xe6pL4zJOzS+ty3vnkRwYRUksosLUQz+hqR7QLZSo2FiK/AGDCORR0TwMlGimuujoeOn2qGRI0tfB+acWnEmSgs9ntxuTMvXqSKHY+xrp8N9SxjgNuoGy/z47UpjT45Wk+b6fSh1qBNCfLYsIEuLTamlBpJprGlFNQ8nlPpoDw/bJoR6o90c+W3ewlsqyft2rHKH3OmbuJ4fmkzRlkd84rOTsweUBYQxeWQSQ17IkbCJM34Ndx+peM4iO0K6azfYCA3uCzMFwlL7AELs0EoVES6ej59d1xntXFosHZH/K4FTurPmFezS8mqonKg8umiP8YwqPwBlF45MyEQ98dqSPmop5zKd/rhKAbT8AB4ZAPNcmEWbG+31pWX5pwM= louisliu@Louiss-MacBook-Air.local"> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chown root:root /root/.ssh/authorized_keys

# 启动SSH服务
/usr/sbin/sshd -D