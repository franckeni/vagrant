#!/bin/bash
yum -y update
yum -y install epel-release

# install ansible
yum -y install ansible

# retrieve ansible code
yum -y install git
git clone https://github.com/franckeni/ansible.git
cd ansible/base
ansible-galaxy install -r roles/requirements.yml
ansible-playbook install_docker.yml
sudo usermod -aG docker vagrant
cd ../jenkins
chmod +x /usr/local/bin/docker-compose
/usr/local/bin/docker-compose up -d
sudo echo -e "192.168.56.10 jenkins \n192.168.56.11 haen-stam-font \n192.168.56.12 haen-stam-back\n192.168.56.12 haen-stam-dynamodb" >> /etc/hosts
echo "For this stack, you will use $(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"
echo "login : user and password : bitnami"