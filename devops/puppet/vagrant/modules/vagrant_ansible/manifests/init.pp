class vagrant_ansible {
  package { 'ansible':
    ensure => present,
  }
}