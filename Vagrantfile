# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.hostname = "demo.vagrant.local"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "8192"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  config.vm.provision :puppet do |puppet|
    puppet.environment_path = "devops/puppet"
    puppet.environment = "vagrant"
    puppet.options << '--verbose'
  end
end
