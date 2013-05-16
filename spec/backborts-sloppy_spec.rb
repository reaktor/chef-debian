require 'spec_helper'

describe 'debian::backports-sloppy' do
  context 'on Squeeze' do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        platform: 'debian', version: '6.0.5',
        step_into: ['debian_repository', 'apt_repository']
      )
      runner.node.set['debian']['mirror'] = 'http://example.com/debian'
      runner.converge 'debian::backports-sloppy'
    end

    it 'includes debian::backports recipe' do
      chef_run.should include_recipe 'debian::backports'
    end

    it 'configures debian-backports-sloppy repository' do
      chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports-sloppy.list',
        'deb     http://example.com/debian-backports squeeze-backports-sloppy main contrib non-free'
    end
  end

  context 'on Wheezy' do
    let(:chef_run) do
      Chef::Log.stub(:warn)
      runner = ChefSpec::ChefRunner.new(
        platform: 'debian', version: '7.0',
        step_into: ['debian_repository', 'apt_repository']
      )
      runner.converge 'debian::backports-sloppy'
    end

    it 'warns' do
      Chef::Log.should_receive(:warn).once.with('wheezy-backports-sloppy does not exist yet')
      chef_run
    end

    it 'includes debian::backports recipe' do
      chef_run.should include_recipe 'debian::backports'
    end

    it 'does not configure backports-sloppy repository' do
      chef_run.should_not create_file '/etc/apt/sources.list.d/backports-sloppy.list'
    end
  end
end
