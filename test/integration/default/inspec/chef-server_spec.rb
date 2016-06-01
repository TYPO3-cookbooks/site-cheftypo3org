control 'chef-server-1' do
  title 'Chef Server'
  desc '
    Check that Chef Server is installed correctly
  '
  describe package('chef-server') do
    it { should be_installed }
  end

end

control 'chef-server-2' do
  title 'Chef Server: chef-server-ctl status'
  desc 'Check the output of chef-server-ctl status'

  describe command('chef-server-ctl status') do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not include 'down:' }
  end
end

control 'chef-server-3' do
  title 'Chef Server: Nginx'
  desc 'Check that Chef Server\'s Nginx is running'

  [80, 443].each do |nginx_port|
    describe port(nginx_port) do
      it { should be_listening }
      its('protocols') { should include 'tcp'}
      its('processes') { should include 'nginx.conf' }
    end
  end

  # redirect port 80
  describe command('curl --head http://localhost') do
    its('exit_status') { should eq 0 }
    its('stdout') { should include '301 Moved Permanently' }
  end

  # port 443 to works
  describe command('curl --insecure https://localhost/users/login') do
    its('exit_status') { should eq 0 }
    its('stdout') { should include '<title>Chef Server</title>' }
  end

end
