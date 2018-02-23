onnect with ssh user@ip -p <ip-address>

apt-get -y install openssh-server
sed -i 's/^.*Port 22/Port 42420/' /etc/ssh/sshd_config 
systemctl restart ssh
service ssh restart
