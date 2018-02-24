# get packages
apt-get install openssh-server

# declaring new port
NEW_PORT="4300"

# changing the values to the new port
# Every port after 1024 is valid
sed -i "s/^.*Port 22/Port $NEW_PORT/g" /etc/ssh/sshd_config

# you can choose one or another, there are both the same so it doesnt matter
service ssh restart
# etc/init.d/ssh restart


# try connecting using ssh
# or checking connection with " netstat -tulpn "
