#
# Cookbook Name:: cb-java
# Recipe:: maven
#

# Configure maven
# https://supermarket.getchef.com/cookbooks/maven
node.normal['maven']['version'] = 3
node.normal['maven']['m2_home'] = '/usr/local/maven'
node.normal['maven']['3']['url'] =
  'http://archive.apache.org/dist/maven/maven-3/'\
  '3.2.2/binaries/apache-maven-3.2.2-bin.zip'
node.normal['maven']['repositories'] = [
  'http://repo1.maven.apache.org/maven2'
]
node.normal['maven']['3']['checksum'] =
  '0e02516a288dd4b171a62e59b7662937690cd3e161751894f67b3e1117c28594'
node.normal['maven']['setup_bin']	= true
node.normal['maven']['mavenrc']['opts'] =
  '-Dmaven.repo.local=$HOME/.m2/repository '\
    '-Dfile.encoding=UTF-8 '\
    '-XX:-HeapDumpOnOutOfMemoryError '\
    '-XX:-OmitStackTraceInFastThrow'
include_recipe 'maven'
