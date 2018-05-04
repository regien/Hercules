if [ "$#" -ne 2 ] ; then
	echo "usage: sh $0 user ip-address"
	exit 1
fi

SSH_USR=$1
SSH_IPADDR=$2

# Create Authentication SSH-Kegen Keys
ssh-keygen -t rsa

# Create .ssh Directory
ssh $SSH_USR@$SSH_IPADDR mkdir -p .ssh

# Upload Generated Public Keys
cat ~/.ssh/id_rsa.pub | ssh $SSH_USR@$SSH_IPADDR 'cat >> .ssh/authorized_keys'

# Set Permissions
ssh $SSH_USR@$SSH_IPADDR "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"
