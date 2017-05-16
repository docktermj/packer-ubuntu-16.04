echo "==============================================================================="
echo "ssh.sh"
echo "==============================================================================="


# Install SSH server

apt-get -y install openssh-server

# Start SSH on boot

systemctl enable ssh


