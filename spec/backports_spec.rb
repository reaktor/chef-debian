require 'spec_helper'

describe 'debian::backports' do
  context 'on Squeeze' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new(platform: 'debian', step_into: ['debian_repository', 'apt_repository']) do |node|
        node.automatic_attrs['lsb'] = { 'codename' => 'squeeze' }
        node.automatic_attrs['platform_version'] = '6.0.7'
      end.converge 'debian::backports'
    end

    it 'uses backports.debian.org' do
      chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
        'deb     http://backports.debian.org/debian-backports squeeze-backports main contrib non-free'
    end
  end

  context 'on Wheezy' do
    let(:chef_run) do
      ChefSpec::ChefRunner.new(platform: 'debian', step_into: ['debian_repository', 'apt_repository']) do |node|
        node.automatic_attrs['lsb'] = { 'codename' => 'wheezy' }
        node.automatic_attrs['platform_version'] = '7.0.0'
      end.converge 'debian::backports'
    end

    it 'uses mirror/wheezy-backports' do
      chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
        'deb     http://http.debian.net/debian wheezy-backports main contrib non-free'
    end
  end
end
