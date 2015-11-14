# this requires Omnitrack to work, which however always fails with "uninitialized constant Chef::Recipe::OmnitruckClient"
# default['chef-server']['version'] = '11.8.0'

default['chef-server']['package_file'] = 'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/lucid/chef-server_11.1.7-1_amd64.deb'

default['chef-server']['api_fqdn'] = "chef.typo3.org"
# default['chef-server']['configuration']['nginx']['ssl_certificate'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.crt"
#default['chef-server']['configuration']['nginx']['ssl_certificate_key'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.key"
