vagrant-node-gulp-environment
========================

A Boilerplate for Vagrant and Puppet that generates a Node.js / Gulp development environment.

# Requirements:
* VirtualBox
* Vagrant

For virtual box guest additions run:

```
vagrant plugin install vagrant-vbguest
```

Windows Users - Run terminal as Admin due to npm generating sym links

# What kind of environment is generated:
A Ubuntu Server environment (ubuntu-14.04) with NodeJS, Ruby, Git, Sass, Gulp

# How to:

* Place Project files / Projects at designated project folder.
* ``` vagrant up ``` to run the VM
* ``` vagrant ssh ``` to access the project and run Gulp Tasks
* Gulp Server will need to serve files at VM open port 9000.
