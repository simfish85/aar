package 'git'

git '/tmp/AAR/' do
  repository 'https://github.com/chef-training/Awesome-Appliance-Repair.git'
  action :export
end

directory '/var/www/AAR' do
  recursive true
  action :delete
end

execute 'move aar folder into www' do
  command 'mv /tmp/AAR/AAR /var/www/'
end

directory '/tmp/AAR' do
  recursive true
  action :delete
end
