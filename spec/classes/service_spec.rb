#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::service', type: :class do
  #    let(:service_manage) => { { 'true' } }
  #    let(:params) { { :service_ensure => 'file' ,:service_enable => 'true', :service_name => 'auditd' ,:service_hasstatus => 'true', :service_hasrestart => 'true', :service_manage => 'true'} }

  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd::service') }
    it do
      is_expected.to contain_service('auditd').with(
        'ensure'       => 'running',
        'enable'       => 'true',
        'name'         => 'auditd',
        'hasstatus'    => 'true',
        'hasrestart'   => 'true',
      )
    end
  end
end
