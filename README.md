vagrant-node-gulp-environment
========================

A Boilerplate for Vagrant and Puppet that generates a Node.js / Gulp development environment.

# Requirements:
* VirtualBox
* Vagrant

For virtual box guest additions run:

```vagrant plugin install vagrant-vbguest```

# What kind of environment is generated:
A Ubuntu Server environment (ubuntu-14.04) with NodeJS, Ruby, Git, Sass, Gulp

# How to:

* Place Project files / Projects at designated project folder.
* ```vagrant up``` to run the VM
* ```vagrant ssh``` to access the project and run Gulp Tasks
* Your Gulp project will need to serve files at VM open port 9000.

# Tested on:

* Windows 10 - VirtualBox 4.3.34 - Vagrant 1.8.0
* OSX - VirtualBox 4.3.34 - Vagrant 1.6.4

# Caveats:

* Windows - Run terminal as Admin (vagrant ssh) due to npm Symlinks permissions
* OSX - Use ```sudo npm install``` when installing packages in the vm (fixes npm ERR! tar.unpack untar error)

