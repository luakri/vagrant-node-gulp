node default {
  # Set our paths globally so we don't have to add them each time.
  Exec { path =>   [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/',
  '/usr/local/node/node-default/bin/' ] }

  # Sync packages index files from their sources.
  exec { 'apt-get update': command => '/usr/bin/apt-get update'}

  # Install node.js via https://forge.puppetlabs.com/willdurand/nodejs
  # See that url for installing multiple versions, and more options.
  class { 'nodejs':
    version => 'v5.3.0' # stable
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
}
