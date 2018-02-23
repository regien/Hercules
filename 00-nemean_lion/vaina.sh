
# get packages
apt-get install openssh-server

NEW_PORT="9020"
# changing the values to the new port
# Every port after 1024 is valid
sed -i 's/^.*Port 22/Port $NEW_PORT/g' etc/ssh/sshd_config

# you can choose one or another, there are both the same so it doesnt matter
service ssh restart
#etc/init.d/ssh restart


#try connecting
