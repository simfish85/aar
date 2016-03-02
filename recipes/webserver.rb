#
# Cookbook Name:: aar
# Recipe:: webserver
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package ['apache2', 'libapache2-mod-wsgi', 'python-pip']

service 'apache2' do
  action [:enable, :start]
end

python_pip 'flask'

template '/etc/apache2/sites-enabled/AAR-apache.conf' do
  source 'AAR-apache.conf.erb'
  notifies :restart, 'service[apache2]'
end
