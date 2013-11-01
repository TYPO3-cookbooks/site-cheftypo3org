node.override['chef-server']['version'] = '11.8.0'
node.override['chef-server']['configuration']['nginx'] = Hash.new
# unless node['chef-server']['configuration'].has_key('nginx')
node.override['chef-server']['configuration']['nginx']['ssl_certificate'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.crt"
node.override['chef-server']['configuration']['nginx']['ssl_certificate_key'] = "#{node[:ssl_certificates][:path]}/wildcard.typo3.org.key"
