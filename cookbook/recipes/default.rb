#
# Cookbook Name:: cb-java
# Recipe:: default
#

# Configure base
include_recipe 'cb-common::default'

# Configure java
include_recipe 'cb-java::java'
