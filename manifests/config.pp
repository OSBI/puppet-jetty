class jetty::config {

  if defined( Class['openjava'] ) {
    $java = 'openjava'
  } elsif defined( Class['sunjava'] ) {
    $java = 'sunjava'
  }

  

  File {
    ensure => present,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    notify => Service['jetty'],
  }

  file {
    '/etc/default/jetty':
      content => template('jetty/jetty.erb');
    '/etc/jetty/jetty.xml':
      content => template('jetty/jetty.xml.erb')
  } 

file {'/etc/init.d/jetty':
    ensure => present,
      content => template('jetty/jetty.init.erb'),
    mode => '0744'
}
  service { 'jetty':
    ensure     => running,
    hasrestart => true,
    enable     => true,
    hasstatus  => true,
    require => [File['/etc/default/jetty'],File['/etc/jetty/jetty.xml'],File['/etc/init.d/jetty'], User["manager"]],
  }
}
