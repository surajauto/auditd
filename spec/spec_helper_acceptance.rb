require 'beaker-rspec'

UNSUPPORTED_PLATFORMS = [ 'Windows', 'Solaris', 'AIX' ]

  hosts.each do |host|
    install_puppet
  end

  hosts.each do |host|
    on hosts, "mkdir -p #{host['distmoduledir']}"
  end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(:source => proj_root, :module_name => 'auditd', :target_module_path => '/etc/puppet/modules/')
    hosts.each do |host|
      on host, puppet('module install puppetlabs-stdlib -i /etc/puppet/modules/'), { :acceptable_exit_codes => [0,1] }
    end
  end
end
