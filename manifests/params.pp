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
class auditd_jabil::params {
  
  # Basic Config 
  $service_manage          = true
  $service_ensure          = "running"
  $service_enable          = true
  $service_name            = "auditd"
  $service_hasstatus       = true
  $service_hasrestart      = true
  $package_name            = "auditd"
  $package_ensure          = "present"
  $auditd_file             = '/etc/audit/auditd.conf'
  $auditd_file_ensure      = file
  $auditd_file_source      = 'puppet:///modules/auditd_jabil/auditd.conf'
  $auditd_file_owner       = "root"
  $auditd_file_group       = "root"
  $auditd_file_mode        = "0640"
  $audit_rules_file_ensure = file
  $audit_rules_file_source = 'puppet:///modules/auditd_jabil/audit_rules.conf'
  $audit_rules_file_owner  = "root"
  $audit_rules_file_group  = "root"
  $audit_rules_file_mode   = "0640"

}
