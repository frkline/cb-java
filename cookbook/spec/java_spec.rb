require 'chefspec'
require_relative 'spec_helper'

describe 'cb-java::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the java::default recipe' do
    expect(chef_run).to include_recipe('java::default')
  end

  it 'includes the java_ext::jce recipe' do
    expect(chef_run).to include_recipe('java_ext::jce')
  end

end
