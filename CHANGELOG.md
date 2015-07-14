# 1.7.3 / _Not released yet_

Improvements:

- Fix compatibility with apt cookbook 2.7.0 and newer using `glob` for `apt_preference`. Requires apt cookbook 1.9.0 or later. ([GH-16][])

# 1.7.2 / 2014-08-22

Improvements:

- Loosen the apt cookbook requirement to accept all 2.x versions, as v2.5.2
  fixes [GH-15][]. So apt cookbook versions 2.5.0 and 2.5.1 are broken, earlier
  and later ones should work fine.

# 1.7.0 / 2014-08-13

Deprecations:

- Notifications of the `debian_repository` resource require Chef 11 or newer.

Features:

- Add `stable_lts` recipe for the [Long Term Support](https://wiki.debian.org/LTS)
  repository. Enabled by default on Squeeze. ([GH-14][])

Improvements:

- Use `use_inline_resources` in the provider to ensure correct notification
  behavior.
- Lock down apt cookbook requirement to `< 2.5.0` as it removed/renamed the
  `execute[apt-get update]` resource. ([GH-15][])

Bug fixes:

- Fix `pin` line in apt preferences

# 1.6.0 / 2014-04-20

Features:

- Allow specifying the security mirror with `security_mirror` attribute ([GH-11][])

# 1.5.4 / 2013-06-20

- Fix Wheezy version number detection ([GH-10])
    * Point-releases only have two numbers, latest is 7.1
- Fix tests on Chef 10
    * Lock down apt cookbook
- Refactor ChefSpec tests and add unit tests for library methods ([GH-9])

# 1.5.2 / 2013-06-13

- Use [Emeril](http://fnichol.github.io/emeril/) to help releasing
- Test setup improvements

# 1.5.0 / 2013-05-20

- On squeeze use default mirror with /debian-backports suffix for backports
  repository ([GH-7])
    * Only fall back to backports.debian.org if the mirror URI does not end
      with /debian
    * Should work on most cases, but `node['debian']['backports_mirror']` can
      be used for setting an explicit URI
- Add `backports_sloppy` recipe for [squeeze-backports-sloppy]
  (http://backports.debian.org/Instructions/#index4h2) suite ([GH-8])

# 1.4.0 / 2013-05-14

- First community site release! Replaces the earlier "debian" cookbook.
    * Huge thanks and respect to [Guilhem Lettron](https://github.com/guilhem)
      for giving the community site cookbook name for us.
    * This version can be used as a drop-in replacement with default
      attributes in some cases, but any custom node attributes for the old
      cookbook **do not work**.
    * Please read the [readme](README.md) for usage instructions.
- Improve the readme
- Specify platform versions for Fauxhai in ChefSpec tests

# 1.3.2 / 2013-05-07

- Fix non-lsb codename detection on first Wheezy release ([GH-6])

# 1.3.0 / 2013-05-06

- Use [http.debian.net](http://http.debian.net/) as a default mirror
- Don't rely on `lsb_release` being installed ([GH-6])
- More ChefSpec tests
- Add simple Test Kitchen 1.0 setup

# 1.2.0 / 2013-03-22

- Use new backports URL from Wheezy on ([GH-5])
- Include apt recipe only after sources.list has been updated
- Add chefspec tests ([GH-2])
- Other test and Vagrant environment improvements

# 1.1.2 / 2013-02-06

- Use `apt_preference` resource to create the repo pinning rule
- Remove the `apt-get update` workaround ([GH-3])
- Add foodcritic and Knife cookbook tests ([GH-2])
- Test with latest Chef 10 and 11 releases on Travis

# 1.1.0 / 2013-01-21

- Workaround for apt cookbook not running `apt-get update` on apt_repository
  updates ([GH-3])
- Vagrant setup for manual testing ([GH-1])

# 1.0.0 / 2013-01-18

- Initial public release


[GH-1]:  https://github.com/reaktor/chef-debian/issues/1  "Issue 1"
[GH-2]:  https://github.com/reaktor/chef-debian/issues/2  "Issue 2"
[GH-3]:  https://github.com/reaktor/chef-debian/issues/3  "Issue 3"
[GH-5]:  https://github.com/reaktor/chef-debian/issues/5  "Issue 5"
[GH-6]:  https://github.com/reaktor/chef-debian/issues/6  "Issue 6"
[GH-7]:  https://github.com/reaktor/chef-debian/issues/7  "Issue 7"
[GH-8]:  https://github.com/reaktor/chef-debian/issues/8  "Issue 8"
[GH-9]:  https://github.com/reaktor/chef-debian/issues/9  "Issue 9"
[GH-10]: https://github.com/reaktor/chef-debian/issues/10 "Issue 10"
[GH-11]: https://github.com/reaktor/chef-debian/issues/11 "Issue 11"
[GH-14]: https://github.com/reaktor/chef-debian/issues/14 "Issue 14"
[GH-15]: https://github.com/reaktor/chef-debian/issues/15 "Issue 15"
[GH-16]: https://github.com/reaktor/chef-debian/issues/16 "Issue 16"
