#
# Cookbook Name:: debian
# Recipe:: backports-sloppy
#
# Author:: Teemu Matilainen <teemu.matilainen@reaktor.fi>
#
# Copyright 2013, Reaktor Innovations Oy
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

include_recipe 'debian::backports'

if node['platform_version'].to_i >= 7
  Chef::Log.warn "#{node['debian']['codename']}-backports-sloppy does not exist yet"
  Chef::Log.warn "Please file an issue if I'm wrong: https://github.com/reaktor/chef-debian/issues"
else
  debian_repository "backports-sloppy" do
    uri Chef::Debian::Helpers.backports_mirror(node)
    distribution "#{node['debian']['codename']}-backports-sloppy"
  end
end
