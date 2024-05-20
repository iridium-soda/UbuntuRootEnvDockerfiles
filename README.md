# UbuntuRootEnvDockerfiles
This GitHub project provides a collection of Dockerfiles based on Ubuntu, designed to create Docker containers with root environment on servers without root privileges due to security reasons. These Dockerfiles are convenient for various applications requiring root permissions while ensuring security and portability.

You can find images here : https://hub.docker.com/repository/docker/iridium191/ubuntu_base/general

## Build

```bash
docker build -t iridium191/ubuntu_base:<tag> .
```
## Use

After pulling images from `iridium191/ubuntu_base`, setup a container using the above image.

Then enter the container and restart the ssh service:

```bash
service ssh restart
```

The image has revised apt source to Tsinghua source so just using `unminized` command to build a full env for working. 

P.S. the default user and password is `root:VTH4mmgXX8KEo9bEJzAY`.

Then you can connect the container by ssh.