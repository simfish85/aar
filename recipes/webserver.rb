#
# Cookbook Name:: aar
# Recipe:: webserver
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install Apache and start the service.
httpd_service 'AAR-apache' do
  action [:create, :start]
end

httpd_module 'wsgi' do
  instance 'AAR-apache'
  action :create
end

package 'python-pip'

python_pip 'flask'

# Add the site configuration.
httpd_config 'AAR-apache' do
  instance 'AAR-apache'
  source 'AAR-apache.conf.erb'
  notifies :restart, 'httpd_service[AAR-apache]'
end
