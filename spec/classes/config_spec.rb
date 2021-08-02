#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::config', type: :class do
  #    let(:params) { { :auditd_file_ensure => 'file' ,:auditd_file_source => 'puppet:///modules/auditd/auditd.conf', :auditd_file_owner => 'root' ,:auditd_file_group => 'root', :auditd_file_mode => '0640', :audit_rules_file_ensure => 'file' ,:audit_rules_file_source => 'puppet:///modules/auditd/audit.rules', :audit_rules_file_owner => 'root' ,:audit_rules_file_group => 'root', :audit_rules_file_mode => '0640' } }

  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd::config') }
    it do
      is_expected.to contain_file('/etc/audit/auditd.conf').with(
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0640',
        'content'=> %r{flush = INCREMENTAL\nfreq = 20}
      )
      is_expected.to contain_file('/etc/audit/auditd.conf').with(
        'ensure' => 'file',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0640',
        'content'=> %r{^#krb5_key_file}
      )
    end
    it do
      is_expected.to contain_file('/etc/audit/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{# Identity changes\n-w /etc/group -p wa -k identity}
      )
    end
  end
end
