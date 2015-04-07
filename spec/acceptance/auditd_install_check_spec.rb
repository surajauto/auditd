require 'spec_helper_acceptance'

describe 'auditd::install class' do
  describe 'checking presence of audit package' do
    it 'should show that it is present' do
      shell("rpm -q audit", :acceptable_exit_codes => 0)
    end
  end
end

