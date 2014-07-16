#
# Cookbook Name:: cb-java
# Recipe:: default
#

# Configure java
include_recipe 'cb-java::java'

# Configure maven
include_recipe 'cb-java::maven' if node['java']['maven']['enable']
