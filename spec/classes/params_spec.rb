#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd::params' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd::params') }
  end
end
