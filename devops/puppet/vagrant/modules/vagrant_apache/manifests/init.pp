class vagrant_apache {

  package { 'httpd':
    ensure => present,
  }

  package { 'mod_ssl':
    ensure => present,
    require => Package["httpd"],
  }

  service { "httpd":
      ensure => running,
      enable => true,
      hasstatus => true,
      hasrestart => true,
      require => Package["httpd"],
   }
   
  file { '/etc/httpd/conf.d/welcome.conf':
      ensure => absent,
      notify => Service['httpd'],
      require => Package['httpd'],
  }
  
   
  file { '/etc/httpd/conf.d/security.conf':
      ensure => present,
      source => "puppet:///modules/vagrant_apache/conf.d/security.conf",
      notify => Service['httpd'],
      require => Package['httpd'],
  }
  
   file { '/etc/httpd/conf.d/error.conf':
       ensure => present,
       source => "puppet:///modules/vagrant_apache/conf.d/error.conf",
       notify => Service['httpd'],
       require => Package['httpd'],
    }

   file { '/var/www/error':
       ensure => directory,
       recurse => remote,
       source => "puppet:///modules/vagrant_apache/error",
       require => Package['httpd'],
       notify => Service['httpd'],
   }
   
}
