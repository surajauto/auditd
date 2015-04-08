require 'spec_helper_acceptance'

describe 'auditd class' do
  describe 'apply audit module' do
    it 'should work with no errors' do
      pp = <<-EOS
      class { 'auditd': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end
  describe 'checking presence of audit package' do
    it 'should show that it is present' do
      shell("rpm -q audit", :acceptable_exit_codes => 0)
    end
  end
end

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


describe 'auditd::service class' do
  describe 'checking status auditd daemon' do
    it 'should show that audit daemon is running' do
      shell("service auditd status", :acceptable_exit_codes => 0)
    end
  end
end

