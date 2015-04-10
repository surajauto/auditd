require 'spec_helper'
describe 'auditd::install' do

  context 'with defaults for all parameters' do
    it { should contain_class('auditd::install') }
    it do
      should contain_package('audit').with(
        'ensure' => 'present',
        'name' => 'audit',
    ) end
  end
end
