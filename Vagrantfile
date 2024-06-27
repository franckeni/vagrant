# -*- mode: ruby -*-
# vi: set ft=ruby :
# To enable zsh, please set ENABLE_ZSH env var to "true" before launching vagrant up 
#   + On windows => $env:ENABLE_ZSH="true"
#   + On Linux  => export ENABLE_ZSH="true"

Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "geerlingguy/centos7"
    jenkins.vm.network "private_network", type: "static", ip: "192.168.56.10"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.provider "virtualbox" do |v|
      v.name = "jenkins"
      v.memory = 2048
      v.cpus = 2
    end
    jenkins.vm.provision :shell do |shell|
      shell.path = "install_jenkins_ansible.sh"
      
    end
  end
    app_servers=2
    ram_app_server=2048
    cpu_app_server=2
    (1..app_servers).each do |i|
      config.vm.define "app_server#{i}" do |app_server|
        app_server.vm.box = "geerlingguy/centos7"
        app_server.vm.network "private_network", type: "static", ip: "192.168.56.1#{i}"
        app_server.vm.hostname = "appserver#{i}"
        app_server.vm.provider "virtualbox" do |v|
          v.name = "app_server#{i}"
          v.memory = ram_app_server
          v.cpus = cpu_app_server
        end
        app_server.vm.provision :shell do |shell|
          shell.path = "update_servers.sh"
        end
      end
    end
  end