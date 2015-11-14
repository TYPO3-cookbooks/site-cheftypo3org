# this requires Omnitrack to work, which however always fails with "uninitialized constant Chef::Recipe::OmnitruckClient"
# node.override['chef-server']['version'] = '11.8.0'

node.override['chef-server']['package_file'] = 'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/lucid/chef-server_11.1.7-1_amd64.deb'

node.override['chef-server']['api_fqdn'] = "chef.typo3.org"
node.override['chef-server']['configuration']['nginx']['ssl_certificate'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.crt"
node.override['chef-server']['configuration']['nginx']['ssl_certificate_key'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.key"

default['site-cheftypo3org']['ssl_certificate'] = "wildcard.typo3.org"