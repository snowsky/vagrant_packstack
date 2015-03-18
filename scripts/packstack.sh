#! /bin/env bash

source /vagrant/lib/include.sh

export MANAGEMENT_IP=$CONTROLLER_IP
prep()

sudo yum update -y
sudo yum install -y https://rdo.fedorapeople.org/rdo-release.rpm

sudo yum install -y openstack-packstack

mkdir -p /root/.ssh
sudo \cp /vagrant/keys/compute_rsa.pem /root/.ssh/id_rsa
sudo ssh-keygen -f /vagrant/keys/controller_rsa.pem -y > /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo chmod 600 /root/.ssh/authorized_keys
sudo ssh-keygen -f /vagrant/keys/network_rsa.pem -y > /root/.ssh/authorized_keys
sudo ssh-keygen -f /vagrant/keys/compute_rsa.pem -y >> /root/.ssh/authorized_keys
sudo ssh-keygen -f /vagrant/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

packstack --answer-file=/vagrant/answer-files/ha.txt