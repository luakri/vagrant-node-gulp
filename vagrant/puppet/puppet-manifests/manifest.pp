node default {
  # Set our paths globally so we don't have to add them each time.
  Exec { path =>   [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/',
  '/usr/local/node/node-default/bin/' ] }

  # Sync packages index files from their sources.
  exec { 'apt-get update': command => '/usr/bin/apt-get update'}

  # Install node.js via https://forge.puppetlabs.com/willdurand/nodejs
  # See that url for installing multiple versions, and more options.
  class { 'nodejs':
    version => 'v5.3.0', # 'stable'
    make_install => false
  }

  # Install ruby.
  class { 'ruby':
    ruby_package => 'ruby1.9.1-full',
    rubygems_package => 'rubygems1.9.1'
  }

  # Install git.
  include git

  # Install gulp through npm.
  package { 'gulp':
    provider => 'npm',
    require  => Class['nodejs']
  }

  # Install sass through rubygem.
  package { ['sass']:
    ensure => '3.4.19',
    provider => 'gem',
    require => Package['ruby']
  }

  # Necessary steps in order to run at vm: sudo node or sudo npm
  # Permissions for default node instalation in order to create Symlinks.
  file { '/usr/local/node/node-default/bin':
    ensure          => 'directory',
    group           => 'puppet',
    owner           => 'puppet',
    recurse         => true,
    require         => Class['nodejs']
  }

  # Create Symlink in order to run terminal: sudo node
  file { 'create-node-symlink':
    ensure          => link,
    require         => Class['nodejs'],
    target          => '/usr/local/node/node-default/bin/node',
    path            => '/usr/local/bin/node'
  }

  # Create Symlink in order to run terminal: sudo npm
  file { 'create-npm-symlink':
    ensure          => link,
    require         => Class['nodejs'],
    target          => '/usr/local/node/node-default/bin/npm',
    path            => '/usr/local/bin/npm'
  }

}
