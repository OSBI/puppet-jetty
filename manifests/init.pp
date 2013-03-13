# == Class: jetty
#
# Installs and manages Jetty.
#
# === Parameters
#
# [*bind_local*]
#  Listen on localhost only. Default: true
#
# [*port*]
#  Port to listen on. Default: 8080
#
# [*proxy_host*]
#  Use proxy for outbound HTTP and HTTPS connections. Default: false
#
# [*proxy_port*]
#  Proxy server port. Default: none
#
# [*log_root*]
#  Custom logging root. Default: none
#
# [*remote_debug*]
#  Turn on Remote Debugging. Default: false
#
# === Examples
#
# class { 'jetty':
#   bind_local   => true,
#   port         => '8080',
#   proxy_host   => 'proxy.example.com',
#   proxy_port   => '3128',
#   log_root     => '/var/www/project/logs',
#   remote_debug => 'true',
# }
#
# === Authors
#
# Sergey Stankevich
#
class jetty (
  $bind_local   = true,
  $port         = '8080',
  $proxy_host   = false,
  $proxy_port   = false,
  $log_root     = false,
  $remote_debug = false
) {

  # Module compatibility check
  $compatible = [ 'Debian', 'Ubuntu' ]
  if ! ($::operatingsystem in $compatible) {
    fail("Module is not compatible with ${::operatingsystem}")
  }

  Class['jetty::install'] -> Class['jetty::config']

  include jetty::install
  include jetty::config

}
