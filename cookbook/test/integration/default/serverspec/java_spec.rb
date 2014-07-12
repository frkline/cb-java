require 'spec_helper'

# Java
describe command('java -version') do
  its(:stdout) do
    should match(/#{Regexp.escape("java version \"1.8.0")}/)
  end
  its(:stdout) do
    should match(/#{Regexp.escape('(TM) SE Runtime Environment (build 1.8.0')}/)
  end
  its(:stdout) do
    should match(/#{Regexp.escape('Java HotSpot(TM) 64-Bit Server VM')}/)
  end
end

# JNA
describe file('/usr/share/java/jna.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      '1aa37e9ea6baa0ee152d89509f758f0847eac66ec179b955cafe0919e540a92e')
  end
  it { should be_mode '644' }
end
describe file('/usr/share/java/jna-platform.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      'f91ba7c0f26c34f04bf57d2ae30d4b19f906e7bb1de90eb3e1f4fdbf45d0c541')
  end
  it { should be_mode '644' }
end

# JCE Unlimited Strength Policy
# Assert java installation
describe file('/usr/lib/jvm/java/jre/lib/security/US_export_policy.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      'fadf649815e8dd4295980ec4c81a76e25fea3cecc8067de333a075bbcdaf8fb9')
  end
  it { should be_linked_to '/opt/java_ext/jce/US_export_policy.jar' }
end
describe file('/usr/lib/jvm/java/jre/lib/security/local_policy.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      '4924cbe86a60d93351c8955b924b714ffdeea776b2621d84e3bad99749c56df3')
  end
  it { should be_linked_to '/opt/java_ext/jce/local_policy.jar' }
end

# JCE Unlimited Strength Policy
# Assert canonical installation
describe file('/opt/java_ext/jce/US_export_policy.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      'fadf649815e8dd4295980ec4c81a76e25fea3cecc8067de333a075bbcdaf8fb9')
  end
end
describe file('/opt/java_ext/jce/local_policy.jar') do
  it { should be_file }
  it do
    should match_sha256checksum(
      '4924cbe86a60d93351c8955b924b714ffdeea776b2621d84e3bad99749c56df3')
  end
end
