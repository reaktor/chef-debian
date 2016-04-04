require 'spec_helper'

describe 'debian::backports_sloppy' do
  context 'on Squeeze' do
    let(:chef_run) do
      debian_runner('6.0.5') do |node|
        node.set['debian']['mirror'] = 'http://example.com/debian'
      end.converge('debian::backports_sloppy')
    end

    it 'includes debian::backports recipe' do
      expect(chef_run).to include_recipe('debian::backports')
    end
    it 'configures debian-backports-sloppy repository' do
      expect(chef_run).to add_apt_source(
        'deb "http://example.com/debian-backports" squeeze-backports-sloppy main contrib non-free',
        'backports-sloppy.list')
    end
  end

  context 'on Wheezy' do
    let(:chef_run) do
      debian_runner('7.0').converge('debian::backports_sloppy')
    end

    it 'includes debian::backports recipe' do
      expect(chef_run).to include_recipe('debian::backports')
    end
    it 'configures debian-backports-sloppy repository' do
      expect(chef_run).to add_apt_source(
        'deb "http://httpredir.debian.org/debian" wheezy-backports-sloppy main contrib non-free',
        'backports-sloppy.list')
    end
  end

  context 'on Jessie' do
    let(:chef_run) do
      debian_runner('8.0').converge('debian::backports_sloppy')
    end

    it 'warns' do
      allow(Chef::Log).to receive(:warn)
      expect(Chef::Log).to receive(:warn).with('jessie-backports-sloppy does not exist yet')
      chef_run
    end
    it 'includes debian::backports recipe' do
      expect(chef_run).to include_recipe('debian::backports')
    end
    it 'does not configure backports-sloppy repository' do
      expect(chef_run).to_not create_file('/etc/apt/sources.list.d/backports-sloppy.list')
    end
  end
end
