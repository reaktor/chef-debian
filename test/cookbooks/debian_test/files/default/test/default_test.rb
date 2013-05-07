require_relative './helpers'

describe 'debian_test::default' do
  include Helpers::DebianTest

  it 'manages sources.list' do
    default_deb = deb_line_matcher('http://http.debian.net/debian', codename, 'main contrib non-free')
    file('/etc/apt/sources.list').must_match(default_deb)
  end
end
