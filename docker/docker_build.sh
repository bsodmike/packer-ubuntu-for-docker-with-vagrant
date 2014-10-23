#!/bin/bash

docker build -t inertialbox/trusty-base ~/hack_ops/packer-digitalocean-docker/docker/trusty_base
docker build -t inertialbox/mysql ~/hack_ops/packer-digitalocean-docker/docker/mysql/5.6
