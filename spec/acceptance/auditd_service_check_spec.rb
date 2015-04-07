require 'spec_helper_acceptance'

describe 'auditd::service class' do
  describe 'checking status auditd daemon' do
    it 'should show that audit daemon is running' do
      shell("service auditd status", :acceptable_exit_codes => 0)
    end
  end
end

