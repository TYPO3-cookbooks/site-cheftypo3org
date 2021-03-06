# this requires Omnitrack to work, which however always fails with "uninitialized constant Chef::Recipe::OmnitruckClient"
# node.override['chef-server']['version'] = '11.8.0'

default['chef-server']['package_file'] = 'https://packages.chef.io/stable/ubuntu/10.04/chef-server_11.1.7-1_amd64.deb'

default['chef-server']['api_fqdn'] = "chef.typo3.org"
default['chef-server']['configuration']['nginx']['ssl_certificate'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.crt"
default['chef-server']['configuration']['nginx']['ssl_certificate_key'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.key"

#<> Use more workers for dependency resolution
default['chef-server']['configuration']['erchef']['depsolver_worker_count'] = 20
#<> Give workers more time for dependency resolution (30sec)
default['chef-server']['configuration']['erchef']['depsolver_timeout'] = 30000


default['site-cheftypo3org']['ssl_certificate'] = "wildcard.typo3.org"
