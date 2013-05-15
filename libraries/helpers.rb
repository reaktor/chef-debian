#
# Cookbook Name:: debian
# Library:: Chef::Debian::Helpers
#
# Author:: Teemu Matilainen <teemu.matilainen@reaktor.fi>
#
# Copyright 2012-2013, Reaktor Innovations Oy
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  module Debian
    module Helpers

      def self.codename(node)
        (node['lsb'] && node['lsb']['codename']) ||
          codename_for_platform_version(node['platform_version'])
      end

      def self.codename_for_platform_version(version)
        case version
        when /^6\.0/ then "squeeze"
        when /^7\.0/ then "wheezy"
        else "stable"
        end
      end

      # Returns the URI for backports or nil if the default mirror should be used
      def self.backports_mirror(node)
        if node['platform_version'].to_i < 7
          # pre-wheezy backports url
          "http://backports.debian.org/debian-backports"
        else
          nil
        end
      end
    end
  end
end
