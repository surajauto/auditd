# @summary Manage the auditd service
#
# @api private
class auditd::service inherits auditd {

  if ! ($auditd::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $auditd::service_manage == true {
    service { 'auditd':
      ensure     => $auditd::service_ensure,
      enable     => $auditd::service_enable,
      name       => $auditd::service_name,
      hasstatus  => $auditd::service_hasstatus,
      hasrestart => $auditd::service_hasrestart,
    }
  }

}
