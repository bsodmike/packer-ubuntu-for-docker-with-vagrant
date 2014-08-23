# Packer Templates

This directory contains Packer templates for building machine images that
represent an Ubuntu target system. This is essentially a stock image
of Ubuntu 14.04 with Docker installed.

## Usage

Required: VirtualBox v4.3.14 (minimum).

First, [install Packer](http://www.packer.io/intro/getting-started/setup.html).
Then, clone this repository and `cd` into the `packer/ubuntu-14.04` target
directory.

## Build Template

Builders:
 * virtualbox-iso
 * docker

Build as follows, passing the specific builder to the `-only` option:

```
$ cd packer/ubuntu-14.04
$ packer validate -only=<builder> template.json
$ packer build -only=<builder> template.json
```

### Virtualbox-ISO Build

Once the build is completed, move the `*.box` image to the path
specified within the `Vagrantfile` located at the root of this project.
By default this path is file:///Users/mdesilva/hack_ops/vagrant_base_boxes/trusty-ubuntu-docker_virtualbox.box

The `Vagrantfile` has been configured to import a vagrant box from the
above image; simply issue the following:

```
$  vagrant up
$  vagrant ssh
```

If the box image is replaced with a new build, remember to remove the
imported box with `vagrant destroy && vagrant box remove trusty64-ubuntu-docker`

### Docker Build

For those developing in OS X, options for dealing with Docker involve
either using `boot2docker` or as I prefer, to use the `virtualbox-iso`
build for this specific task.

Start by booting into the `virtualbox-iso` build by running `vagrant up`
at the root of this repositary.

Connect to the VM instance with `vagrant ssh` noting the `~/docker_images` path
is mounted to the guest VM via NFS.  Once the docker build finishes, the
tarball image will be persisted to `~/docker_images`.

```
$ cd packer/ubuntu-14.04
$ packer build -only=docker template.json
$ cd ~
$ cat docker_images/inertialbox_docker_base.tar | sudo docker import - inertialbox/base
$ docker run -t -i inertialbox/base /bin/bash
```

## Reference

* flynn-demo: https://github.com/flynn-archive/flynn-demo/tree/master/packer
