# == Class: auditd
#
# Ensures auditd configuration is per Jabil Standard
#
# === Parameters
#
# Document parameters here.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# @summary Manage the auditd package
#
# @api private
class auditd::install inherits auditd {
  package { $auditd::package_name:
    ensure => $auditd::package_ensure,
  }
}
