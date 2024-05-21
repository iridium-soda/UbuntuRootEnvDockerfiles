FROM ubuntu:22.04
ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8
COPY ./sources.list /etc/apt/sources.list
COPY ./entry.sh /entrypoint.sh
# Install packages in one RUN and clean up in the same layer
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
 && echo 'root:VTH4mmgXX8KEo9bEJzAY' | chpasswd \
 && echo "export VISIBLE=now" >> /etc/profile \
 && mkdir -p /var/run/sshd \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY ./sshd_config /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]