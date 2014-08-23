#!/bin/bash

date > /etc/vagrant_box_build_time

apt-get -y update
apt-get -y upgrade
apt-get -y install software-properties-common
apt-get -y install build-essential linux-headers-$(uname -r) linux-headers-generic linux-headers-virtual
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
apt-get -y install vim
#apt-get -y install dkms
#apt-get -y install nfs-common
