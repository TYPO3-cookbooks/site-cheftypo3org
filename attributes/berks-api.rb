default['berkshelf_api']['version'] = "2.1.1"
# we move it away from /etc, as etckeeper would be annoyed by the cache file being written ghere
default['berkshelf_api']['home'] = "/opt/berkshelf-api-home"
default['berkshelf_api']['config_path'] = "#{node['berkshelf_api']['home']}/config.json"

default['berkshelf_api']['config'] = {
  home_path: node[:berkshelf_api][:home],
  endpoints: [{
    type: "chef_server",
    options: {
      url: Chef::Config[:chef_server_url],
      client_key: File.join(node['berkshelf_api']['home'], 'client.pem'),
      client_name: Chef::Config[:node_name]
    }
  }],
  build_interval: 5.0
}