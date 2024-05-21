# UbuntuRootEnvDockerfiles
This GitHub project provides a collection of Dockerfiles based on Ubuntu, designed to create Docker containers with root environment on servers without root privileges due to security reasons. These Dockerfiles are convenient for various applications requiring root permissions while ensuring security and portability.

You can find images here : https://hub.docker.com/repository/docker/iridium191/ubuntu_base/general

## Features

- Support ssh connection authenticated by password or publickey with **root**
- Intergrate Python3.12 and other necessary elements 

## Build

```bash
docker build -t iridium191/ubuntu_base:<tag> .
```
## Use

After pulling images from `iridium191/ubuntu_base`, setup a container using the above image.

Then enter the container and initialize:

```
source /entrypoint.sh
```

The image has revised apt source to Tsinghua source so just using `unminized` command to build a full env for working. 

P.S. the default user and password is `root:VTH4mmgXX8KEo9bEJzAY`.

Then you can connect the container by ssh.

## Reference command:
```shell
docker run -p 8015:22 --ipc=host  --restart always --name CONTAINERNAME --mount type=bind,source=/home/user/,target=/root -itd iridium191/ubuntu_base:24.04 /bin/bash
```

# TODO

```
COPY ./ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources 
COPY ./sshd_config /etc/ssh/sshd_config
```
这两行没有生效(生效解决了)
公钥的问题还是没有解决 是不是校园网的问题?测试一下
是校园网的问题 在hostvds上运行良好...
报类型51,校园网环境的问题