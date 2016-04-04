class vagrant_std_redhat {

  package { 'epel-release':
    ensure => present,
  }

  package { 'unzip':
    ensure => present,
  }

  package { 'vim-enhanced':
    ensure => present,
  }

}
