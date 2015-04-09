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
end

describe 'auditd::install class' do
  describe package('audit') do
    it { should be_installed }
  end
end

describe 'auditd::config class' do
  describe file('/etc/audit/auditd.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode '640' }
  end
  describe file('/etc/audit/audit.rules') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode '640' }
    its(:md5sum) { should eq '0e926ccef2304bb653b4c8a60e8cea0a' }
  end
end

describe 'auditd::service class' do
  describe service('auditd') do
    it { should be_enabled }
    it { should be_running }
  end
end

