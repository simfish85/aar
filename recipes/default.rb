#
# Cookbook Name:: aar
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apt::default'

include_recipe 'aar::webserver'
include_recipe 'aar::mysql'
include_recipe 'aar::webapplication'
