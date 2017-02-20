default['site-cheftypo3org']['ssl_certificate'] = 'wildcard.typo3.org'

default['chef-server']['api_fqdn'] = 'chef.typo3.org'
default['chef-server']['version'] = '12.12.0'
default['chef-server']['configuration'] = <<-EOS
notification_email 'root@localhost'
email_from_address 'TYPO3 Server - Chef <admin@typo3.org>'
disable_sign_up false # later true !!
nginx['ssl_certificate']     = "#{node['ssl_certificates']['path'] + "/" + node['site-cheftypo3org']['ssl_certificate'] + ".crt"}"
nginx['ssl_certificate_key'] = "#{node['ssl_certificates']['path'] + "/" + node['site-cheftypo3org']['ssl_certificate'] + ".key"}"

EOS
