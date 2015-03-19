# == Class: auditd_jabil
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
#  class { auditd_jabil:
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
class auditd_jabil::config inherits auditd_jabil {

  file { $auditd_file:
    ensure           => $auditd_file_ensure,
    source           => $auditd_file_source,
    owner            => $auditd_file_owner,
    group            => $auditd_file_group,
    mode             => $auditd_file_mode,
    notify           => Service['auditd'],
    require          => Package['audit'],
  }

  file { '/etc/audit/rules.d/audit.rules':
    ensure           => $audit_rules_file_ensure,
    source           => $audit_rules_file_source,
    owner            => $audit_rules_file_owner,
    group            => $audit_rules_file_group,
    mode             => $audit_rules_file_mode,
    notify           => Service['auditd'],
    require          => Package['audit'],
  }

}