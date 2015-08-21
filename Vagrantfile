# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

$docker_vm_gui = false
$docker_vm_memory = 2048
$docker_vm_cpus = 1

$jenkins_vm_gui = false
$jenkins_vm_memory = 4096
$jenkins_vm_cpus = 2

$git_vm_gui = false
$git_vm_memory = 2048
$git_vm_cpus = 1

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.define "docker" do |docker|
 	docker.vm.box = "hashicorp/precise64"
	docker.vm.hostname = "docker"
	
	  ["vmware_fusion", "vmware_workstation"].each do |vmware|
		docker.vm.provider vmware do |v|
		  v.gui = $docker_vm_gui
		  v.vmx['memsize'] = $docker_vm_memory
		  v.vmx['numvcpus'] = $docker_vm_cpus
		end
	  end

	  docker.vm.provider :virtualbox do |vb|
		vb.gui = $docker_vm_gui
		vb.memory = $docker_vm_memory
		vb.cpus = $docker_vm_cpus
	  end

	  docker.vm.network "private_network", ip: "192.168.130.55"
	  
	  docker.vm.provision "shell", inline: "apt-get -q update"
	  docker.vm.provision "shell", path: "docker-provision.sh"
	  
    end  
  
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "hashicorp/precise64"
	jenkins.vm.hostname = "jenkins"
	
	["vmware_fusion", "vmware_workstation"].each do |vmware|
		jenkins.vm.provider vmware do |v|
		  v.gui = $jenkins_vm_gui
		  v.vmx['memsize'] = $jenkins_vm_memory
		  v.vmx['numvcpus'] = $jenkins_vm_cpus
		end
	  end

	  jenkins.vm.provider :virtualbox do |vb|
		vb.gui = $jenkins_vm_gui
		vb.memory = $jenkins_vm_memory
		vb.cpus = $jenkins_vm_cpus
	  end
	  
	  jenkins.vm.network "private_network", ip: "192.168.130.50"
	  
	  jenkins.vm.provision "shell", path: "jenkins-provision.sh"

    end

  config.vm.define "git" do |git|
 	git.vm.box = "hashicorp/precise64"
	git.vm.hostname = "githost"
	
	  ["vmware_fusion", "vmware_workstation"].each do |vmware|
		git.vm.provider vmware do |v|
		  v.gui = $git_vm_gui
		  v.vmx['memsize'] = $git_vm_memory
		  v.vmx['numvcpus'] = $git_vm_cpus
		end
	  end

	  git.vm.provider :virtualbox do |vb|
		vb.gui = $git_vm_gui
		vb.memory = $git_vm_memory
		vb.cpus = $git_vm_cpus
	  end

	  git.vm.network "private_network", ip: "192.168.130.51"
	  
	  git.vm.provision "shell", inline: "apt-get -q update"
	  git.vm.provision "shell", path: "git-provision.sh"
	  
  end  	
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
