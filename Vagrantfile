# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  config.vm.define "manager" do |manager|
    manager.vm.hostname = "manager"

    manager.vm.network "private_network", ip: "192.168.56.10"
    
    manager.vm.network "forwarded_port", guest: 8500, host: 8500

    manager.vm.provision "shell", path: "setup.sh", args: "manager"

    # move files to the manager
    manager.vm.provision "file", source:  "ansible02", destination: "/home/vagrant"
    manager.vm.provision "file", source:  "consul01", destination: "/home/vagrant"
  end

  config.vm.define "consul_server", primary: true do |consul_server|
    consul_server.vm.hostname = "consulserver"

    consul_server.vm.network "private_network", ip: "192.168.56.11"

    consul_server.vm.provision "shell", path: "setup.sh", args: "consul_server"
  end

  config.vm.define "api", primary: true do |api|
    api.vm.hostname = "api"

    api.vm.network "private_network", ip: "192.168.56.12"

    api.vm.network "forwarded_port", guest: 8082, host: 8082

    api.vm.provision "shell", path: "setup.sh", args: "api"
  end

  config.vm.define "db", primary: true do |db|
    db.vm.hostname = "db"

    db.vm.network "private_network", ip: "192.168.56.13"

    db.vm.provision "shell", path: "setup.sh", args: "db"
  end

end
