#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::install' do
let(:params) { { :package_ensure => 'present' ,:package_name => 'audit' } }

  context 'with defaults for all parameters' do
    it { should contain_class('auditd::install') }
    it do
      should contain_package('audit').with(
        'ensure' => 'present',
        'name' => 'audit',
    ) end
  end
end
