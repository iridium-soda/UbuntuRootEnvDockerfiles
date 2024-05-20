FROM ubuntu:24.04
ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8
COPY ./ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources 
# Install packages in one RUN and clean up in the same layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
 && sed -i "s@/archive.ubuntu.com/@/mirrors.tuna.tsinghua.edu.cn/@g" /etc/apt/sources.list \
 && echo 'root:VTH4mmgXX8KEo9bEJzAY' | chpasswd \
 && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
 && echo "export VISIBLE=now" >> /etc/profile \
 && mkdir -p /var/run/sshd \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]