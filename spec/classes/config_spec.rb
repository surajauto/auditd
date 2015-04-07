require 'spec_helper'
describe 'auditd::config' do

  context 'with defaults for all parameters' do
    it { should contain_class('auditd::config') }
    it do
      should contain_file('/etc/audit/auditd.conf').with(
        'ensure' => 'file',
        'source' => 'puppet:///modules/auditd/auditd.conf',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0640',
    ) end
    it do
      should contain_file('/etc/audit/audit.rules').with(
        'ensure' => 'file',
        'source' => 'puppet:///modules/auditd/audit.rules',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0640',
    ) end
  end
end
