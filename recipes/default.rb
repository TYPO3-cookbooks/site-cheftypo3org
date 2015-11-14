include_recipe "ssl_certificates"

ssl_certificate node['site-cheftypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

include_recipe "chef-server::default"

include_recipe "#{cookbook_name}::berks-api"