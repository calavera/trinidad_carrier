#
# Cookbook Name:: Trinidad
# Recipe:: default
#

package "dev-java/sun-jdk" do
  action :install
end

package "dev-java/jruby-bin" do
  action :install
end

package "jsvc" do
  action :install
end

execute "install-trinidad" do
  command "/usr/bin/jruby -S gem install trinidad trinidad_daemon trinidad_hotdeploy_extension"
end

execute "configure-trinidad" do
  command "/usr/bin/jruby -S trinidad_daemon_install"
end

execute "start-trinidad" do
  command "/etc/init.d/trinidad-daemon.sh start"
end
