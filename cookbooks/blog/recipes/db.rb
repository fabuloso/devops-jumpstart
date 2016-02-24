package 'mysql-server-5.6'

service 'mysql' do
  provider Chef::Provider::Service::Init::Debian
  action [ :enable, :start ]
end

mysql2_chef_gem 'default' do
  client_version '5.6'
  action :install
end

connection_Info = {
  :host     => 'localhost',
  :username => 'root',
  :password => ''
}

mysql_database 'blog' do
  connection connection_Info
  action :create
end

mysql_database_user 'blog' do
  connection connection_Info
  database_name 'blog'
  password 'blog'
  privileges [:all]
  action [ :create, :grant ]
end
