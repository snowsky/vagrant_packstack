#! /bin/env bash

source /vagrant/lib/include.sh

export MANAGEMENT_IP=$NETWORK_IP
prep()

sudo mkdir /root/.ssh
sudo cp /vagrant/keys/network_rsa.pem /root/.ssh/id_rsa
sudo ssh-keygen -f /vagrant/keys/network_rsa.pem -y >> /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo ssh-keygen -f /vagrant/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

