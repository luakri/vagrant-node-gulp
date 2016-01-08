#!/usr/bin/env bash
#
# Install Puppet Modules
#
echo "Create Puppet Modules directory"

mkdir -p /etc/puppet/modules;

echo "Install Puppet NodeJS"

puppet module install willdurand/nodejs;

echo "Install Puppet Ruby"

puppet module install puppetlabs-ruby;

echo "Install Puppet Git"

puppet module install puppetlabs-git;
