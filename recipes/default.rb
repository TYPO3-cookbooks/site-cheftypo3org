include_recipe "ssl_certificates"

ssl_certificate node['site-cheftypo3org']['ssl_certificate'] do
  ca_bundle_combined true
end

package "apt-transport-https"

if node['platform'] == 'debian' && node['lsb']['codename'] == 'jessie'
  link "/usr/lib/systemd/system" do
    to "/etc/systemd/system"
  end

  file "/etc/environment" do
    content "export SVDIR=/opt/opscode/service"
    mode "0644"
  end
end

include_recipe "chef-server::default"
include_recipe "chef-server::addons"

execute "chef-server-ctl restart" do
  action :nothing
  environment "SVDIR" => "/opt/opscode/service"
end

chef_ingredient "manage" do
  action :install
  notifies :reconfigure, "chef_ingredient[manage]"
  notifies :reconfigure, "chef_ingredient[chef-server]"
  notifies :run, "execute[chef-server-ctl restart]", :immediately
end

#chef_ingredient "reporting" do
#  action :install
#  notifies :reconfigure, "chef_ingredient[reporting]"
#end

# chef_ingredient "analytics" do
#   config <<-EOS
# analytics_fqdn "chef-analytics.vagrant"
#   EOS
#   action :install
#   notifies :reconfigure, "chef_ingredient[analytics]"
# end



include_recipe "#{cookbook_name}::berks-api"
