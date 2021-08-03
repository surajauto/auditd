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
class auditd (
  Boolean $service_manage,
  String $service_ensure,
  Boolean $service_enable,
  String $service_name,
  Boolean $service_hasstatus,
  Boolean $service_hasrestart,
  String $package_name,
  String $package_ensure,
  String $auditd_file,
  String $auditd_file_source,
  String $auditd_file_ensure,
  String $auditd_file_owner,
  String $auditd_file_group,
  String $auditd_file_mode,
  String $auditd_rules_file,
  String $audit_rules_file_ensure,
  String $audit_rules_file_source,
  String $audit_rules_file_owner,
  String $audit_rules_file_group,
  String $audit_rules_file_mode,
  Array  $auditd_rules,
  String $auditd_buffer = '8192',
  Hash   $auditd_conf = {},
) {
  $_conf = lookup('auditd::conf') + $auditd_conf

  contain auditd::install
  contain auditd::config
  contain auditd::service

  Class['auditd::install']
  -> Class['auditd::config']
  ~> Class['auditd::service']
}
