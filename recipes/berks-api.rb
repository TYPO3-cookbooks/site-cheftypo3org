include_recipe "berkshelf-api-server::app"

# without this, we end up in a wonderful bootstrap problem - we wait for the API to become available, although it won't
# as the client.pem isn't available yet. However, template[.../client.pem] cannot be executed prior to setting up the
# berkshelf user etc. So we do not start the runit_service[berks-api] in above cookbook, but instead notify it,
# as soon as the client.pem has been copied.
resources("runit_service[berks-api]").action :nothing

# We copy over the client.pem into a place accessible for berks-api
template File.join(node['berkshelf_api']['home'], 'client.pem') do
  source "/etc/chef/client.pem"
  local true
  owner node['berkshelf_api']['owner']
  group node['berkshelf_api']['group']
  notifies :enable, "runit_service[berks-api]"
  notifies :restart, "runit_service[berks-api]"
end

ruby_block "ignore runit sv directories" do
  block do
    ignore_dir = "sv/*/log/main/*"
    fe = Chef::Util::FileEdit.new("/etc/.gitignore")
    fe.insert_line_if_no_match(Regexp.new(Regexp.escape(ignore_dir)), ignore_dir)
    fe.write_file
  end
  only_if { File.exists?("/etc/.gitignore") }
end

