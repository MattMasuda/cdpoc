#echo "Provision: openjdk"
#apt-get -q -y install openjdk-7-jdk
#jenkins has its own jdk 1.6 dependency
echo "Provision: Jenkins"
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get -q update
apt-get -q -y install jenkins



