# @summary Manage auditd service, configuration and rules.
#
# This will ensure that the auditd package is installed,
# deploy an auditd.conf file and an auditd.rules file.
# The config is built from a default config hash stored in module Hiera
# with over-rides being passed in via the $auditd_conf parameter.
# Rules will use the default set in module Hiera unless an array of rules
# is passed in via $auditd_rules, which will replace the default ruleset.
#
# @example
#   include auditd
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
  String $auditd_file_ensure,
  String $auditd_file_owner,
  String $auditd_file_group,
  String $auditd_file_mode,
  String $auditd_rules_file,
  String $audit_rules_file_ensure,
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
