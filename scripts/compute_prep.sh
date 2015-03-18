#! /bin/env bash

source /vagrant/lib/include.sh

export MANAGEMENT_IP=$COMPUTE_IP
prep()

mkdir /root/.ssh
sudo cp /vagrant/keys/compute_rsa.pem /root/.ssh/id_rsa
sudo ssh-keygen -f /vagrant/keys/compute_rsa.pem -y >> /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo ssh-keygen -f /vagrant/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

