echo "Provision: curl installation"
apt-get -q -y install curl
echo "Provision: Docker installation"
curl -sSL https://get.docker.com/ | sh
echo "Provision: Add vagrant user to docker group"
usermod -aG docker vagrant

