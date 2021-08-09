# @summary Manage auditd service, configuration and rules.
#
# This will ensure that the auditd package is installed,
# deploy an auditd.conf file and an auditd.rules file.
# The config is built from a default config hash stored in module Hiera
# with over-rides being passed in via the $auditd_conf parameter.
# Rules will use the default set in module Hiera unless an array of rules
# is passed in via $auditd_rules, which will replace the default ruleset.
#
# @api public
#
# @param service_manage
#   Specify whether to manage the auditd service with Puppet. Default value: true
#
# @param service_ensure
#   Specify the auditd service desired state. Default value: 'running'
#
# @param service_enable
#   Specify whether or not to enable the auditd service to run at startup. Default value: true
#
# @param service_name
#   The name for the auditd service. Default value: 'auditd' 
#
# @param service_hasstatus
#   Specify whether the auditd service supports the status command. Default value: true
#
# @param service_hasrestart
#   Specify whether the auditd service support the restart command. Default value: true
#
# @param package_name
#   Name of the auditd package to install. Default value: 'auditd'
#
# @param package_ensure
#   Package 'ensure' value. Can be used to specifiy a specific version if required. Default value: 'present'
#
# @param auditd_file
#   Location of the auditd config file. Default value: '/etc/audit/auditd.conf'
#
# @param auditd_file_ensure
#   Ensure state of the auditd config file. Default value: file
#
# @param auditd_file_owner
#   Owner of the auditd config file. Default value: 'root'
#
# @param auditd_file_group
#   Group for the auditd config file. Default value: 'root'
#
# @param auditd_file_mode
#   Permissions for the auditd config file. Default value: '0640'
#
# @param auditd_rules_file
#   Location of the auditd rules file. Default value: '/etc/audit/auditd.rules'
#
# @param auditd_rules_file_ensure
#   Ensure state of the auditd rules file. Default value: file
#
# @param auditd_rules_file_owner
#   Owner of the auditd rules file. Default value: 'root'
#
# @param auditd_rules_file_group
#   Group for the auditd rules file. Default value: 'root'
#
# @param auditd_rules_file_mode
#   Permissions for the auditd rules file. Default value: '0640'
#
# @param auditd_rules
#   Array of rules to place in the auditd.rules file. Default value is found in in-module Hiera data.
#   If any values are passed in via this parameter, they will take precedence and no default rules will be applied.
#
# @param auditd_buffer
#   Size of the auditd buffer. Default value '8192'
#
# @param auditd_conf
#   Hash of auditd config entries as key:value pairs. Default value is found in in-module Hiera data.
#   If any values are passed in via this paramter, they will NOT wipe out the defaults.
#   If a key matches one in the default hash, it will overwrite the value for that key.
#   If a key is not found in the default hash, it will be added to the default set.
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
  String $auditd_rules_file_ensure,
  String $auditd_rules_file_owner,
  String $auditd_rules_file_group,
  String $auditd_rules_file_mode,
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
