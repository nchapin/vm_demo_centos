# Configuration de base #######################################################

node default {
    $std_env = "DEMO|VAGRANT"

    include vagrant_base
    include vagrant_apache
    include vagrant_std_redhat
    include vagrant_catchall_mail
}