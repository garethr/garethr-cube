A Puppet module for managing the installation and configuration of
[Cube](https://github.com/square/cube).

[![Build
Status](https://secure.travis-ci.org/garethr/garethr-cube.png)](http://travis-ci.org/garethr/garethr-cube)

# Usage

For experimenting you're probably fine just with:

    include 'cube'

# Configuration

The module should allow overriding of all of cube's settings. The
following is an exampe also showing the default values, based on those
in the npm package.

    class { 'cube':
      collector_http_port => 1080,
      collector_udp_port  => 1180,
      evaluator_port      => 1081,
      mongo_host          => '127.0.0.1',
      mongo_port          => 27017,
      mongo_database      => 'cube_development',
      mongo_username      => false,
      mongo_password      => false
    }

# Requirement

Cube requires both mongodb and nodejs/npm to be installed and runned.
Although this module does not install mongodb, modules available from
puppetlabs do. They are included as dependencies in the Modulefile.
To install Mongo you can use:

    class { 'mongodb':
      enable_10gen => true,
    }
