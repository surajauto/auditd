#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::install' do
  # let(:params) { { :package_ensure => 'present' ,:package_name => 'audit' } }

  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd::install') }
    it do
      is_expected.to contain_package('audit').with(
        'ensure' => 'present',
        'name' => 'audit',
      )
    end
  end
end
