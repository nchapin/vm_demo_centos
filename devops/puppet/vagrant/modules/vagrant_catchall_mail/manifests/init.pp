class vagrant_catchall_mail {
    package { 'postfix':
        ensure => present,
    }
    
    service { "postfix":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        require => Package["postfix"],
    }
       
    file { '/etc/postfix/main.cf':
        ensure => present,
        source => "puppet:///modules/vagrant_catchall_mail/postfix/main.cf",
        notify => Service['postfix'],
        require => Package['postfix'],
    }

    file { '/etc/postfix/virtual_domains.pcre':
        ensure => present,
        source => "puppet:///modules/vagrant_catchall_mail/postfix/virtual_domains.pcre",
        notify => Service['postfix'],
        require => Package['postfix'],
    }

    file { '/etc/postfix/virtual_forwardings.pcre':
        ensure => present,
        source => "puppet:///modules/vagrant_catchall_mail/postfix/virtual_forwardings.pcre",
        notify => Service['postfix'],
        require => Package['postfix'],
    }
    
    package { 'dovecot':
        ensure => present,
    }
    
    service { "dovecot":
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
        require => Package["dovecot"],
    }

    file { '/etc/dovecot/dovecot.conf':
        ensure => present,
        source => "puppet:///modules/vagrant_catchall_mail/dovecot/dovecot.conf",
        notify => Service['dovecot'],
        require => Package['dovecot'],
    }
}