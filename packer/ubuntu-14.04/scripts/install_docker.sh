#!/bin/bash

# add docker group and add vagrant to it
sudo groupadd docker
sudo usermod -a -G docker vagrant

# add the docker gpg key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add the Docker repository to your apt sources list.
echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

# install docker and some useful packages
DEBIAN_FRONTEND=noninteractive apt-get update
DEBIAN_FRONTEND=noninteractive apt-get -y install lxc-docker

# pull docker images
# TODO

# Disable container auto-restart when docker starts
sed -i 's/^#DOCKER_OPTS=.*/DOCKER_OPTS="-r=false"/' /etc/default/docker
