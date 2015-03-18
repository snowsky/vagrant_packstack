#! /bin/env bash

# Fixme: don't know why MOUNT_POINT can not work here
MOUNT_POINT="/vagrant"
source $MOUNT_POINT/lib/include.sh

export MANAGEMENT_IP=$CONTROLLER_IP
prep

sudo yum update -y
sudo yum install -y https://rdo.fedorapeople.org/rdo-release.rpm

sudo yum install -y openstack-packstack

sudo mkdir /root/.ssh || true
sudo \cp $MOUNT_POINT/keys/compute_rsa.pem /root/.ssh/id_rsa
chmod 0600 /root/.ssh/id_rsa
sudo ssh-keygen -f $MOUNT_POINT/keys/controller_rsa.pem -y > /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo chmod 600 /root/.ssh/authorized_keys
sudo ssh-keygen -f $MOUNT_POINT/keys/network_rsa.pem -y > /root/.ssh/authorized_keys
sudo ssh-keygen -f $MOUNT_POINT/keys/compute_rsa.pem -y >> /root/.ssh/authorized_keys
sudo ssh-keygen -f $MOUNT_POINT/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

packstack --answer-file=$MOUNT_POINT/answer-files/ha.txt
