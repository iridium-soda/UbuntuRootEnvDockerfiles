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
## Private image

Containers for personal use. DONT pull this one cause u have no private key to connect.

NOTE: Use macAir.pem to connect

奇了怪了校园网环境内用基本的ubuntu镜像公钥可以进 什么情况??
可能要写一个自己用的镜像测试一下