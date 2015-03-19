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
class auditd_jabil (
  $service_ensure  = $auditd_jabil::params::service_ensure,
  $service_enable  = $auditd_jabil::params::service_enable,
  $service_name  = $auditd_jabil::params::service_name,
  $service_hasstatus  = $auditd_jabil::params::service_hasstatus,
  $service_hasrestart  = $auditd_jabil::params::service_hasrestart,
  $package_name  = $auditd_jabil::params::package_name,
  $package_ensure  = $auditd_jabil::params::package_ensure,
  $auditd_file  = $auditd_jabil::params::auditd_file,
  $auditd_file_ensure  = $auditd_jabil::params::auditd_file_ensure,
  $auditd_file_source  = $auditd_jabil::params::auditd_file_source,
  $auditd_file_owner  = $auditd_jabil::auditd_file_owner,
  $auditd_file_group  = $auditd_jabil::auditd_file_group,
  $auditd_file_mode  = $auditd_jabil::params::auditd_file_mode,
  $audit_rules_file_ensure  = $auditd_jabil::params::audit_rules_file_ensure,
  $audit_rules_file_source  = $auditd_jabil::params::audit_rules_file_source,
  $audit_rules_file_owner  = $auditd_jabil::params::audit_rules_file_owner,
  $audit_rules_file_group  = $auditd_jabil::params::audit_rules_file_group,
  $audit_rules_file_mode  = $auditd_jabil::params::audit_rules_file_mode,
  
) inherits auditd_jabil::params {

}
