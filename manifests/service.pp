# == Class: auditd
#
# Ensures auditd configuration is per Jabil Standard
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { auditd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# sillgen <steven_illgen@jabil.com>
#
# === Copyright
#
# Copyright 2014 Jabil, unless otherwise noted.
#
class auditd::service inherits auditd {

  if ! ($::auditd::params::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $::auditd::params::service_manage == true {
    service { 'auditd':
      ensure     => $::auditd::params::service_ensure,
      enable     => $::auditd::params::service_enable,
      name       => $::auditd::params::service_name,
      hasstatus  => $::auditd::params::service_hasstatus,
      hasrestart => $::auditd::params::service_hasrestart,
    }
  }

}
