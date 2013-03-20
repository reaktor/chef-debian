# 1.1.3 / _Not released yet_

- Use new backports URL from Wheezy on ([GH-5])
- Include apt recipe only after sources.list has been updated

# 1.1.2 / 2013-02-06

- Use `apt_preference` resource to create the repo pinning rule
- Remove the `apt-get update` workaround ([GH-3])
- Add foodcritic and Knife cookbook tests
- Test with latest Chef 10 and 11 releases on Travis

# 1.1.0 / 2013-01-21

- Workaround for apt cookbook not running `apt-get update` on apt_repository
  updates ([GH-3])
- Vagrant setup for manual testing ([GH-1])

# 1.0.0 / 2013-01-18

- Initial public release


[GH-1]:  https://github.com/reaktor/chef-debian/issues/1  "Issue 1"
[GH-3]:  https://github.com/reaktor/chef-debian/issues/3  "Issue 3"
[GH-5]:  https://github.com/reaktor/chef-debian/issues/5  "Issue 5"
