class jetty::install {

  package { [ 'jetty', 'libjetty-extra-java' ]: ensure => present }

}
