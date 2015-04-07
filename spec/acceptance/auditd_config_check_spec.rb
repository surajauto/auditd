require 'spec_helper_acceptance'

describe 'auditd::config class' do
  describe 'checking presence of config files' do
    it 'should show that /etc/audit/auditd.conf is present' do
      shell("ls /etc/audit/auditd.conf", :acceptable_exit_codes => 0)
    end
    it 'should show that /etc/audit/audit.rules is present' do
      shell("ls /etc/audit/audit.rules", :acceptable_exit_codes => 0)
    end
  end
end

