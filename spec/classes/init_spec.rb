#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd') }
  end
  context 'with extra config passed in for audit.conf' do
    let(:params) { { 'auditd_conf' => { 'freq' => '5' } } }

    it { is_expected.to contain_class('auditd::config') }
    it do
      is_expected.to contain_file('/etc/audit/auditd.conf').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{flush = INCREMENTAL\nfreq = 5},
      )
      is_expected.to contain_file('/etc/audit/auditd.conf').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{^#krb5_key_file},
      )
    end
  end
  context 'with rules passed in via params' do
    let(:params) { { 'auditd_rules' => ['-a exit,always -F arch=b64 -S execve', '-a exit,always -F arch=b32 -S execve'], 'auditd_buffer' => '4096' } }

    it { is_expected.to contain_class('auditd::config') }
    it do
      is_expected.to contain_file('/etc/audit/rules.d/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{^-b 4096},
      )
      is_expected.to contain_file('/etc/audit/rules.d/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{-a exit,always -F arch=b64 -S execve\n-a exit,always -F arch=b32 -S execve},
      )
      is_expected.not_to contain_file('/etc/audit/rules.d/audit.rules').with(
        'ensure'  => 'file',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0640',
        'content' => %r{-w /usr/sbin/groupadd -p x -k group_modification},
      )
    end
  end
end
