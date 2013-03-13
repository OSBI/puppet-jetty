[puppet-jetty](https://github.com/stankevich/puppet-jetty)
======

Puppet module for installing and managing Jetty.

## Usage

### jetty

Installs and manages Jetty.

**bind_local** — Listen on localhost only. Default: true

**port** — Port to listen on. Default: 8080

**proxy_host** — Use proxy for outbound HTTP and HTTPS connections. Default: false

**proxy_port** — Proxy server port. Default: none

	class { 'jetty':
	  bind_local => true,
	  port       => '8080',
	  proxy_host => 'proxy.example.com',
	  proxy_port => '3128',
	}

## Authors

[Sergey Stankevich](https://github.com/stankevich)
