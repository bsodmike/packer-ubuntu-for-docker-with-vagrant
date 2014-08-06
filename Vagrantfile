# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.define :trusty64_docker do |box_config|

    # Every Vagrant virtual environment requires a box to build off of.
    box_config.vm.box = "trusty64-ubuntu-docker"
    box_config.vm.box_url = "file:///Users/mdesilva/hack_ops/vagrant_base_boxes/trusty-ubuntu-docker_virtualbox.box"

    box_config.vm.network :private_network, ip: "10.33.33.33"
    box_config.vm.network :forwarded_port, guest: 5000, host: 5000
    box_config.vm.network :forwarded_port, guest: 22, host: 2258

  end

end

