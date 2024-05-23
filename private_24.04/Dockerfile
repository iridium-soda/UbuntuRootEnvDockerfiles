# 使用 Ubuntu 最新的官方镜像
FROM ubuntu:24.04
ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8
COPY ./ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources 
COPY ./entry.sh /entrypoint.sh

# 安装 SSH 服务
# 创建 SSH 目录和运行时必需的空目录
RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/sshd

# 修改 SSH 配置以允许公钥认证
RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config \
&& sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config\
&& sed -i 's/#ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config\
&& sed -i 's/#UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

# 添加 SSH 公钥
RUN mkdir -p /root/.ssh
COPY Air.pub /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys && \
    chmod 700 /root/.ssh

# 开放 22 端口用于 SSH 访问
EXPOSE 22

# 设置容器启动时运行 SSH 服务
CMD ["/usr/sbin/sshd", "-D"]
