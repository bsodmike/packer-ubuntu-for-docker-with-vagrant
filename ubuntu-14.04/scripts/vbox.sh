#!/bin/bash

# Install necessary libraries for guest additions and Vagrant NFS Share
apt-get -y install dkms nfs-common

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run --nox11 # No X11 for Ubuntu Server
umount /mnt

# Cleanup VirtualBox
rm $VBOX_ISO

