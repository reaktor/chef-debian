require 'spec_helper'

describe 'debian::backports' do
  context 'on Squeeze' do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        platform: 'debian', version: '6.0.5',
        step_into: ['debian_repository', 'apt_repository']
      )
      runner.converge 'debian::backports'
    end

    it 'uses backports.debian.org' do
      chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
        'deb     http://backports.debian.org/debian-backports squeeze-backports main contrib non-free'
    end
  end

  context 'on Wheezy' do
    let(:chef_run) do
      runner = ChefSpec::ChefRunner.new(
        platform: 'debian', version: '7.0',
        step_into: ['debian_repository', 'apt_repository']
      )
      runner.converge 'debian::backports'
    end

    it 'uses mirror/wheezy-backports' do
      chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
        'deb     http://http.debian.net/debian wheezy-backports main contrib non-free'
    end
  end
end
