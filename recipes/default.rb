ssl_certificate "wildcard.typo3.org" do
  ca_bundle_combined true
end

include_recipe "chef-server::default"