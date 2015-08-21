echo "Provision: git"
apt-get -q -y install git-core
#create git user
adduser --disabled-password --gecos "git user" git
#copy ssh key
su --login -c "mkdir /home/git/.ssh" git
su --login -c "touch /home/git/.ssh/authorized_keys && chmod 600 /home/git/.ssh/authorized_keys" git
su --login -c "cat /vagrant/id_rsa.mmasuda.pub >> ~/.ssh/authorized_keys" git
#init git repo
su --login -c "mkdir /home/git/project.git" git
su --login -c "git init --bare /home/git/project.git" git
