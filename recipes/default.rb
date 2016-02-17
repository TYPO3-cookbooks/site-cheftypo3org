include_recipe "t3-base"

include_recipe "ssl_certificates"

ssl_certificate node['site-cheftypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

include_recipe "chef-server::default"

# This is currently not working, therefore we need to start the berks-api service manually atm.
#include_recipe "#{cookbook_name}::berks-api"
