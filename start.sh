. lib/include.sh

vagrant plugin install vagrant-vbguest
vagrant up
vagrant provision network
vagrant provision compute
vagrant provision controller
