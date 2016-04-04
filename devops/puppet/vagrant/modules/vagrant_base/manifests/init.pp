    
class vagrant_base {
  file { '/ext':
        path    => '/ext',
        ensure  => directory,
        mode    => '0755',
  }

  file { '/vagrant/dependencies':
    path => '/vagrant/dependencies',
    ensure => directory,
  }

  file { '/etc/profile.d/vagrant_std_prompt.sh':
		ensure  => present,
		mode    => '0755',
		owner   => 'root',
		content => template('vagrant_base/vagrant_std_prompt.sh'),
	}

  service { "firewalld":
    ensure => stopped,
    enable => false,
  }
}
