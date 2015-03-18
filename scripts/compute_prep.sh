#! /bin/env bash

source $MOUNT_POINT/lib/include.sh

export MANAGEMENT_IP=$COMPUTE_IP
prep()

sudo mkdir /root/.ssh > /dev/null
sudo cp $MOUNT_POINT/keys/compute_rsa.pem /root/.ssh/id_rsa
sudo ssh-keygen -f $MOUNT_POINT/keys/compute_rsa.pem -y >> /root/.ssh/id_rsa.pub
#echo y | sudo ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
sudo ssh-keygen -f $MOUNT_POINT/keys/controller_rsa.pem -y >> /root/.ssh/authorized_keys

