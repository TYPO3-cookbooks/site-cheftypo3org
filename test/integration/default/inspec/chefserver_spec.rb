control 'chefserver-1' do
  title 'Chef Server Setup'
  desc 'Verifies Chef Server is installed and running'

  describe package('chef-server-core') do
    it { should be_installed }
  end

  describe command('chef-server-ctl test') do
    its('exit_status') { should eq 0 }
  end

  [80, 443].each do |nginx_port|
    describe port(nginx_port) do
      it { should be_listening}
      its('protocols') { should include 'tcp' }
    end
  end
end
