require 'spec_helper'

describe 'debian::default' do
  context 'on Debian' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new(platform: 'debian', version: '6.0.5') do |node|
        node.automatic_attrs['lsb'] = { 'codename' => 'cheese' }
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

    context 'without lsb-release' do
      context 'with first release version' do
        let(:chef_run) do
          ChefSpec::ChefRunner.new(platform: 'debian', version: '7.0') do |node|
            node.automatic_attrs['lsb'] = {}
            node.automatic_attrs['platform_version'] = '7.0'
          end.converge 'debian::default'
        end

        it 'configures /etc/apt/sources.list file' do
          chef_run.should create_file_with_content '/etc/apt/sources.list',
            'deb http://http.debian.net/debian wheezy main contrib non-free'
        end
      end

      context 'with a point release' do
        let(:chef_run) do
          ChefSpec::ChefRunner.new(platform: 'debian', version: '7.0') do |node|
            node.automatic_attrs['lsb'] = {}
            node.automatic_attrs['platform_version'] = '7.0.1'
          end.converge 'debian::default'
        end

        it 'configures /etc/apt/sources.list file' do
          chef_run.should create_file_with_content '/etc/apt/sources.list',
            'deb http://http.debian.net/debian wheezy main contrib non-free'
        end
      end
    end

    context 'with specified node attributes' do
      let(:chef_run) do
        ChefSpec::ChefRunner.new(platform: 'debian', version: '7.0') do |node|
          node.automatic_attrs['lsb'] = { 'codename' => 'cheese' }
          node.set['debian']['mirror']     = 'http://example.com/debian-mirror'
          node.set['debian']['components'] = %w[resistor diode]
          node.set['debian']['deb_src']    = true
          node.set['debian']['backports']  = true
        end.converge 'debian::default'
      end

      it 'configures /etc/apt/sources.list file' do
        chef_run.should create_file_with_content '/etc/apt/sources.list',
          'deb http://example.com/debian-mirror cheese resistor diode'
      end

      it 'adds deb-src lines' do
        chef_run.should create_file_with_content '/etc/apt/sources.list',
          'deb-src http://example.com/debian-mirror cheese resistor diode'
      end

      it 'enables backports repository' do
        chef_run.should include_recipe 'debian::backports'
      end
    end
  end

  context 'on non-Debian' do
    let(:chef_run) do
      Chef::Log.stub(:warn)
      ChefSpec::ChefRunner.new(platform: 'ubuntu', version: '12.04').converge 'debian::default'
    end

    it 'warns' do
      Chef::Log.should_receive(:warn).with(
        'recipe[debian::default] included in non-Debian platform. Skipping.')
      chef_run.should be
    end

    it 'does not include apt recipe' do
      chef_run.should_not include_recipe 'apt'
    end

    it 'does not touch /etc/apt/sources.list file' do
      chef_run.should_not create_file '/etc/apt/sources.list'
    end
  end
end
