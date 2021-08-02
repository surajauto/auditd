require 'spec_helper_acceptance'

describe 'auditd class' do
  describe 'apply auditd module' do
    it 'applies with no errors' do
      pp = <<-EOS
      class { 'auditd': }
      EOS

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  describe 'auditd::install class' do
    describe package('audit') do
      it { is_expected.to be_installed }
    end
  end

  describe 'auditd::config class' do
    describe file('/etc/audit/auditd.conf') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode '640' }
    end
    describe file('/etc/audit/audit.rules') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode '640' }
      its(:md5sum) { is_expected.to eq '0e926ccef2304bb653b4c8a60e8cea0a' }
    end
  end

  describe 'auditd::service class' do
    describe service('auditd') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end
  end
end
