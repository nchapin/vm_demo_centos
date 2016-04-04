VM Demo Centos
==============

VM template I use for enterprise products development and demonstration

* hybris
* SAP
* Oracle
* ...

This VM template provide base services to help demo products.

* Centos 7
* Apache
* Local catch all SMTP server (postfix/dovecot)
* Ansible

This VM template is based on Vagrant and puppet for provisioning.

## Prerequisites

* Virtualbox (latest version)
* Vagrant (latest version)

By default:

* the VM is configured to share the root project as `/vagrant` directory
* the VM is configured to use 8Go of memory


## Dependencies

It's up to you to provide enterprise software packages.

1. Create a `./dependencies` directory
2. Put required files into this directory

### hybris


