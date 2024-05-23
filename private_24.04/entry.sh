# A startup script to do more for a container
sshd -D
service ssh restart
apt update
apt install -y python3.12 
ln -s /usr/bin/python3.12 /usr/bin/python3 
apt install -y python3-pip
apt install -y neofetch