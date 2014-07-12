#
# Cookbook Name:: cb-java
# Recipe:: java
#

# Configure Java 8 with the Oracle Java JDK and set as system default
# https://supermarket.getchef.com/cookbooks/java
node.normal['java']['install_flavor'] = 'oracle'
node.normal['java']['accept_oracle_download_terms'] = true
node.normal['java']['jdk_version'] = '8'
node.normal['java']['set_default'] = true
include_recipe 'java'

# Include JNA to provide access to native shared libraries
# https://github.com/twall/jna
directory '/usr/share/java' do
  action :create
  recursive true
  mode '755'
end
remote_file '/usr/share/java/jna.jar' do
  source node['java']['jna']['url']
  checksum node['java']['jna']['sha256sum']
end
remote_file '/usr/share/java/jna-platform.jar' do
  source node['java']['jna']['platform']['url']
  checksum node['java']['jna']['platform']['sha256sum']
end

# Include JCE unlimited strength cryptography policy files
# https://github.com/frkline/java_ext
node.normal['java']['oracle']['accept_oracle_download_terms'] = true
include_recipe 'java_ext::jce'
