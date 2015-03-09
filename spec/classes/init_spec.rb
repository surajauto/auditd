require 'spec_helper'
describe 'sshd_jabil' do

  context 'with defaults for all parameters' do
    it { should contain_class('sshd_jabil') }
  end
end
