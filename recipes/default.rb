include_recipe 't3-base'

include_recipe 'ssl_certificates'

ssl_certificate node['site-cheftypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

include_recipe 'chef-server::default'

# newer chef version required...
#edit_resource(:chef_ingredient, 'chef-server') do
#  platform 'ubuntu'
#  platform_version '16.04'
#  version '12.12.0'
#end

# no direct support for Debian, so we pick the Ubuntu version
resources('chef_ingredient[chef-server]').platform 'ubuntu'
resources('chef_ingredient[chef-server]').platform_version '16.04'

