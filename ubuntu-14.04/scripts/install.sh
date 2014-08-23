#!/bin/bash

# enable memory and swap cgroup
perl -p -i -e 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/g'  /etc/default/grub
/usr/sbin/update-grub

# add docker group and add vagrant to it
sudo groupadd docker
sudo usermod -a -G docker vagrant

# add the docker gpg key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add the Docker repository to your apt sources list.
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# install docker and some useful packages
apt-get update
apt-get -y install curl arping vim-tiny git mercurial bzr make lxc-docker-0.10.0

# pull docker images

# install Go
cd /tmp
wget j.mp/godeb
tar xvzf godeb
./godeb install

# Disable container auto-restart when docker starts
sed -i 's/^#DOCKER_OPTS=.*/DOCKER_OPTS="-r=false"/' /etc/default/docker
