require 'spec_helper'

# Maven
describe command('/usr/local/maven/bin/mvn -version') do
  its(:stdout) do
    should match(/#{Regexp.escape('Apache Maven 3.2.2')}/)
  end
  its(:stdout) do
    should match(/#{Regexp.escape('Java version: 1.8.0, vendor: Oracle Co')}/)
  end
  its(:stdout) do
    should match(/#{Regexp.escape('platform encoding: UTF-8')}/)
  end
end
