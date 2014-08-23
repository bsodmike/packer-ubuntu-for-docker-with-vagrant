#!/bin/bash

# install some useful packages
apt-get update
apt-get -y install curl wget unzip vim git mercurial bzr make silversearcher-ag

# install Go
# j.mp/godeb -> https://godeb.s3.amazonaws.com/godeb-amd64.tar.gz
cd /tmp
wget j.mp/godeb
tar xvzf godeb
./godeb install

