module Helpers
  module DebianTest
    include MiniTest::Chef::Assertions
    include MiniTest::Chef::Context
    include MiniTest::Chef::Resources

    def deb_line_matcher(mirror, codename, components)
      %r{^deb\s+#{Regexp.escape(mirror)} #{codename} #{components}$}
    end

    def codename
      @codename ||= case IO.read('/etc/debian_version')
                    when /^6\.0/ then 'squeeze'
                    when /^7\.0/ then 'wheezy'
                    else '???'
                    end
    end
  end
end
