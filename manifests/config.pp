# @summary Manage the config and rules files
#
# @api private
class auditd::config inherits auditd {

  file { $auditd::auditd_file:
    ensure  => $auditd::auditd_file_ensure,
    content => template('auditd/auditd.conf.erb'),
    owner   => $auditd::auditd_file_owner,
    group   => $auditd::auditd_file_group,
    mode    => $auditd::auditd_file_mode,
  }

  file { $auditd::auditd_rules_file:
    ensure  => $auditd::audit_rules_file_ensure,
    content => template('auditd/auditd.rules.erb'),
    owner   => $auditd::audit_rules_file_owner,
    group   => $auditd::audit_rules_file_group,
    mode    => $auditd::audit_rules_file_mode,
  }

}
