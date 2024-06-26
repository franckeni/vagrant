#!/bin/bash
sudo echo -e "192.168.56.11 haen-stam-font \n192.168.56.12 haen-stam-back\n192.168.56.12 haen-stam-dynamodb" >> /etc/hosts
yum -y update
yum -y install epel-release