# Packer Templates

This directory contains Packer templates for building machine images that
represent an Ubuntu target system. This is essentially a stock image
of Ubuntu 14.04 with Docker installed.

## Usage

First, [install Packer](http://www.packer.io/intro/getting-started/setup.html).
Then, clone this repository and `cd` into the `ubuntu-14.04` target
directory.

## Vagrant Template

Currently supports:
 * Virtualbox

To build a VirtualBox image:

```
$ packer verify -only=virtualbox-iso vagrant.json
$ packer build -only=virtualbox-iso vagrant.json
```

## Then What?

At the end of any of these, you'll have a snapshot or image ready to go.

You can either import the box manually or simply boot up the vagrant
machine 'trusty64' by issuing `vagrant up` in the root of this project
(where the `Vagrantfile` resides).

```
-> % vagrant box add trusty64-ubuntu-docker file:///Users/mdesilva/hack_ops/vagrant_base_boxes/trusty-ubuntu-docker_virtualbox.box
```

## Reference

* flynn-demo: https://github.com/flynn-archive/flynn-demo/tree/master/packer
