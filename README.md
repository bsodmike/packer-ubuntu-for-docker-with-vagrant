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

## Reference

* flynn-demo: https://github.com/flynn-archive/flynn-demo/tree/master/packer
