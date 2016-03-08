#
# Cookbook Name:: aar
# Recipe:: mysql
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package ['mysql-server', 'python-mysqldb']

mysql2_chef_gem 'default' do
  action :install
end

# Create a mysql database
mysql_database 'AARdb' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root'
  )
  encoding 'utf8'
  action :create
end

cookbook_file '/tmp/make_AARdb.sql' do
  source 'make_AARdb.sql'
  mode '0755'
  action :create
end

# Seed the database with a table and test data.
execute 'initialize database' do
  command "mysql -h 127.0.0.1 -u root -D AARdb < /tmp/make_AARdb.sql"
  not_if  "mysql -h 127.0.0.1 -u root -D AARdb -e 'describe customer;'"
end

# Grant SELECT, UPDATE, and INSERT privileges to all tables in foo db from all hosts
mysql_database_user 'aarapp' do
  connection(
    :host     => '127.0.0.1',
    :username => 'root'
  )
  password      node['appdbpw']
  database_name 'AARdb'
  host          'localhost'
  privileges    [:create, :select,:update,:insert,:delete]
  action        :grant
end
