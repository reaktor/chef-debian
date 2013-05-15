require 'spec_helper'

describe 'debian::backports' do
  context 'on Squeeze' do
    context 'with default mirrors' do
      let(:chef_run) do
        runner = ChefSpec::ChefRunner.new(
          platform: 'debian', version: '6.0.5',
          step_into: ['debian_repository', 'apt_repository']
        )
        runner.converge 'debian::backports'
      end

      it 'uses http.debian.net/debian-backports' do
        chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
          'deb     http://http.debian.net/debian-backports squeeze-backports main contrib non-free'
      end
    end

    context 'with specified backports mirror' do
      let(:chef_run) do
        runner = ChefSpec::ChefRunner.new(
          platform: 'debian', version: '6.0.5',
          step_into: ['debian_repository', 'apt_repository']
        )
        runner.node.set['debian']['backports_mirror'] = 'http://example.com/backports-mirror'
        runner.converge 'debian::backports'
      end

      it 'uses it' do
        chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
          'deb     http://example.com/backports-mirror squeeze-backports main contrib non-free'
      end
    end

    context 'with specified default mirror' do
      context 'ending with /debian' do
        let(:chef_run) do
          runner = ChefSpec::ChefRunner.new(
            platform: 'debian', version: '6.0.5',
            step_into: ['debian_repository', 'apt_repository']
          )
          runner.node.set['debian']['mirror'] = 'http://example.com/debian'
          runner.converge 'debian::backports'
        end

        it 'uses it with /debian-backpors suffix' do
          chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
            'deb     http://example.com/debian-backports squeeze-backports main contrib non-free'
        end
      end

      context 'not ending with /debian' do
        let(:chef_run) do
          runner = ChefSpec::ChefRunner.new(
            platform: 'debian', version: '6.0.5',
            step_into: ['debian_repository', 'apt_repository']
          )
          runner.node.set['debian']['mirror'] = 'http://example.com/debian-mirror'
          runner.converge 'debian::backports'
        end

        it 'uses backports.debian.org' do
          chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
            'deb     http://backports.debian.org/debian-backports squeeze-backports main contrib non-free'
        end
      end
    end
  end

  context 'on Wheezy' do
    context 'with default mirrors' do
      let(:chef_run) do
        runner = ChefSpec::ChefRunner.new(
          platform: 'debian', version: '7.0',
          step_into: ['debian_repository', 'apt_repository']
        )
        runner.converge 'debian::backports'
      end

      it 'uses http.debian.net/debian' do
        chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
          'deb     http://http.debian.net/debian wheezy-backports main contrib non-free'
      end
    end

    context 'with specified backports mirror' do
      let(:chef_run) do
        runner = ChefSpec::ChefRunner.new(
          platform: 'debian', version: '7.0',
          step_into: ['debian_repository', 'apt_repository']
        )
        runner.node.set['debian']['backports_mirror'] = 'http://example.com/backports-mirror'
        runner.converge 'debian::backports'
      end

      it 'uses it' do
        chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
          'deb     http://example.com/backports-mirror wheezy-backports main contrib non-free'
      end
    end

    context 'with specified default mirror' do
      let(:chef_run) do
        runner = ChefSpec::ChefRunner.new(
          platform: 'debian', version: '7.0',
          step_into: ['debian_repository', 'apt_repository']
        )
        runner.node.set['debian']['mirror'] = 'http://example.com/debian-mirror'
        runner.converge 'debian::backports'
      end

      it 'uses it' do
        chef_run.should create_file_with_content '/etc/apt/sources.list.d/backports.list',
          'deb     http://example.com/debian-mirror wheezy-backports main contrib non-free'
      end
    end
  end
end
