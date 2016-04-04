require 'spec_helper'

describe 'debian::stable_lts' do
  context 'on Squeeze' do
    let(:chef_run) do
      debian_runner('6.0.5').converge('debian::stable_lts')
    end

    it 'configures the LTS repository' do
      expect(chef_run).to add_apt_source(
        'deb "http://httpredir.debian.org/debian" squeeze-lts main contrib non-free',
        'stable-lts.list')
    end
  end

  context 'on Wheezy' do
    let(:chef_run) do
      debian_runner('7.0').converge('debian::stable_lts')
    end

    it 'warns' do
      allow(Chef::Log).to receive(:info)
      expect(Chef::Log).to receive(:info).with('wheezy-lts does not exist yet')
      chef_run
    end

    it 'does not configure the LTS repository' do
      expect(chef_run).to_not create_file('/etc/apt/sources.list.d/stable-lts.list')
    end
  end
end
