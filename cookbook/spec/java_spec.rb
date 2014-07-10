require 'chefspec'
require_relative 'spec_helper'

describe 'cb-java::java' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

end
