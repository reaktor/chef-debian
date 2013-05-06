require 'spec_helper'

describe 'debian::default' do
  context 'on Debian' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new(platform: 'debian') do |node|
        node.automatic_attrs['lsb'] = {'codename' => 'cheese'}
      end.converge 'debian::default'
    end

    it 'includes apt recipe' do
      chef_run.should include_recipe 'apt'
    end

    it 'triggers apt-get update' do
      chef_run.should execute_command 'apt-get update'
    end

    it 'configures /etc/apt/sources.list file' do
      chef_run.should create_file_with_content '/etc/apt/sources.list',
        'deb http://http.debian.net/debian cheese main contrib non-free'
    end

    it 'enables security repository' do
      chef_run.should include_recipe 'debian::security'
    end

    it 'does not enable testing repository' do
      chef_run.should_not include_recipe 'debian::testing'
    end
  end

  context 'on non-Debian' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new(platform: 'ubuntu').converge 'debian::default'
    end

    it 'warns' do
      chef_run.should log 'recipe[debian::default] included in non-Debian platform. Skipping.'
    end

    it 'does not include apt recipe' do
      chef_run.should_not include_recipe 'apt'
    end
  end
end
