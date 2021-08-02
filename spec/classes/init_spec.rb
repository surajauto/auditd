#!/usr/bin/env rspec
require 'spec_helper'
describe 'auditd' do
  context 'with defaults for all parameters' do
    it { is_expected.to contain_class('auditd') }
  end
end
