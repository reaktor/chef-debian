Debian Cookbook [![Build Status](https://travis-ci.org/reaktor/chef-debian.png?branch=master)](https://travis-ci.org/reaktor/chef-debian)
===============

Description
-----------

Configures (official) Debian Apt repositories. Includes also a LWRP which
can be used to add and pin a Debian repository.

Requirements
------------

Intended for use in Debian, but could be adapted for other Apt based platforms.

Requires "apt" cookbook.

Attributes
----------

Attribute                      | Description                    | Default
-------------------------------|--------------------------------|----------
`node['debian']['mirror']`     | Default Debian mirror URI      | `"http://ftp.debian.org/debian"`
`node['debian']['components']` | Default repository components  | `["main", "contrib", "non-free"]`
`node['debian']['deb_src']`    | If true, enables apt source lines by default | false

The following attributes specify if the corresponding recipe/repository is
included by the default recipe:

Attribute                                   | Default
--------------------------------------------|--------
`node['debian']['backports']`               | false
`node['debian']['security']`                | true
`node['debian']['stable_proposed_updates']` | false
`node['debian']['stable_updates']`          | true
`node['debian']['testing']`                 | false
`node['debian']['unstable']`                | false

Recipes
-------

The `default` recipe configures _/etc/apt/sources.list_ using the mirror and
components specified by node attributes. It also includes other recipes if
specified via the above attributes.

The other recipes configure apt to use the corresponding Debian repository:

  * `backports` - Sets up apt source for [Debian
    Backports](http://backports.debian.org/) repository.
  * `security` - Sets up apt source for [Debian Security
    Updates](http://www.debian.org/security/) repository.
  * `sid` - Alias for `unstable` recipe.
  * `stable_proposed_updates` - Sets up apt source for [Debian
    stable-proposed-updates](http://wiki.debian.org/StableProposedUpdates)
    repository and includes `stable_updates` recipe.
  * `stable_updates` - Sets up apt source for [Debian
    stable-updates](http://wiki.debian.org/StableUpdates) repository.
  * `testing` - Sets up apt source for [Debian
    "testing"](http://www.debian.org/releases/testing/) repository with pin
    priority 50.
  * `unstable` - Sets up apt source for [Debian
    "unstable"](http://www.debian.org/releases/unstable/) repository with pin
    priority 40.

Resources/Providers
-------------------

### debian_repository

Sets up Debian repository and optionally pinning preferences using
`apt_repository` LWRP. This is used internally by the recipes, but feel free
if you find usage for it in your own cookbooks.

Attribute parameters:

  * `repo_name` - Name_attribute. The name of the repository and configuration
    files.
  * `uri` - The base URI of the repository. Defaults to `node['debian']['mirror']`.
  * `distribution` - Name attribute. The distribution part of apt source line.
  * `components` - The components part of apt source line. Defaults to
    `node['debian']['components']`.
  * `deb_src` - If true, enables apt source line too. Defaults to
    `node['debian']['deb_src']`.
  * `pin_priority` - The default pinning priority for the repository. Defaults
    to nil which means that no preferences are set.

Example:

    # feel the history
    debian_repository "woody" do
      uri "http://archive.debian.org/debian"
      pin_priority 200
    end

Usage
-----

If you want to manage `/etc/apt/souces.list` with Chef, add the default recipe
to the run list. Then you can also specify which additional repositories are
configured by setting `node['debian']['<repo>']` attributes to true or false.
The other option is to add the wanted repositories (e.g.
`recipe[debian::backports]`) directly to the run list.

You might also want to set the default base URI to point to your local mirror.
For example in a role:

    default_attributes(
      :debian => {
        :mirror => "http://ftp.fi.debian.org/debian"
      }
    )

Other cookbooks that need packages from a specific repository should depend on
this cookbook, include the corresponding repository recipe and possibly add
apt-pinning rules for the packages as needed. Example:

    # configure backports.debian.org
    include_recipe "debian::backports"

    # set apt-pinning rules
    %w[thepackage and some dependencies].each do |pkg|
      apt_preference pkg do
        pin "release o=Debian Backports"
        pin_priority "700"
      end
    end

    # install the package
    package "thepackage"

License and Author
------------------

Author:: Teemu Matilainen <<teemu.matilainen@reaktor.fi>>

Copyright 2011-2013, [Reaktor Innovations Oy](http://reaktor.fi/en)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
