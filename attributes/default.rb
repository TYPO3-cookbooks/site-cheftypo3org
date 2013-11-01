# this requires Omnitrack to work, which however always fails with "uninitialized constant Chef::Recipe::OmnitruckClient"
# node.override['chef-server']['version'] = '11.8.0'

node.override['chef-server']['package_file'] = 'https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/11.04/x86_64/chef-server_11.0.8-1.ubuntu.11.04_amd64.deb'

node.override['chef-server']['api_fqdn'] = "chef.typo3.org"
node.override['chef-server']['configuration']['nginx']['ssl_certificate'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.crt"
node.override['chef-server']['configuration']['nginx']['ssl_certificate_key'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.key"