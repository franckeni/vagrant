#!/bin/bash

sudo apt-get -y update && sudo apt-get upgrade -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository 'ppa:deadsnakes/ppa'
sudo apt-get -y install python3.12 git

if [[ $1 == "master" ]]
then
	# install ansible
	curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12
	sudo apt -y install python3-pip sshpass

	pip3 install ansible
	#sudo update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.8 1
	#sudo update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.12 1

	# retrieve ansible code
	git clone https://github.com/franckeni/ansible-base.git
	cd ansible-base/base
	ansible-galaxy install -r roles/requirements.yml
	ansible-playbook install_docker.yml
	sudo usermod -aG docker vagrant
	cd ../jenkins
	chmod +x /usr/local/bin/docker-compose
	/usr/local/bin/docker-compose up -d


	sudo echo -e "192.168.56.10 jenkins \n192.168.56.11 haen-stam-front \n192.168.56.12 haen-stam-back\n192.168.56.12 haen-stam-dynamodb" >> /etc/hosts
else
	sudo echo -e "192.168.56.11 haen-stam-front \n192.168.56.12 haen-stam-back\n192.168.56.12 haen-stam-dynamodb" >> /etc/hosts
fi

echo "For this stack, you will use $(ip -f inet addr show eth0 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p') IP Address"