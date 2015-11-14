include_recipe "berkshelf-api-server::app"

# We copy over the client.pem into a place accessible for berks-api
template File.join(node['berkshelf_api']['home'], 'client.pem') do
  source "/etc/chef/client.pem"
  local true
  owner node['berkshelf_api']['owner']
  group node['berkshelf_api']['group']
  notifies :restart, "runit_service[berks-api]"
end

ruby_block "ignore runit sv directories for etckeeper" do
  block do
    ignore_dir = "sv/*/log/main/*"
    fe = Chef::Util::FileEdit.new("/etc/.gitignore")
    fe.insert_line_if_no_match(Regexp.new(Regexp.escape(ignore_dir)), ignore_dir)
    fe.write_file
  end
  only_if { File.exists?("/etc/.gitignore") }
end

