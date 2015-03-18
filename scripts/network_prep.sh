#! /bin/env bash

# Fixme: don't know why MOUNT_POINT can not work here
MOUNT_POINT="/vagrant"
source $MOUNT_POINT/lib/include.sh

export MANAGEMENT_IP=$NETWORK_IP
prep

sudo mkdir /root/.ssh || true
sudo cp $MOUNT_POINT/keys/network_rsa.pem /root/.ssh/id_rsa
sudo ssh-keygen -f $MOUNT_POINT/keys/network_rsa.pem -y >> /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo ssh-keygen -f $MOUNT_POINT/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

