#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::config', type: :class do
  #    let(:params) { { :auditd_file_ensure => 'file' , :auditd_file_owner => 'root' ,:auditd_file_group => 'root', :auditd_file_mode => '0640', :auditd_rules_file_ensure => 'file' , :auditd_rules_file_owner => 'root' ,:auditd_rules_file_group => 'root', :auditd_rules_file_mode => '0640' } }

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
      is_expected.to contain_file('/etc/audit/rules.d/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{^-b 8192}
      )
      is_expected.to contain_file('/etc/audit/rules.d/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{# Identity changes\n-w /etc/group -p wa -k identity}
      )
      is_expected.to contain_exec('augenrules').with(
        'command'     => '/sbin/augenrules --load',
        'user'        => 'root',
        'refreshonly' => 'true',
      )
    end
  end
end
