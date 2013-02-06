## v1.1.2

- Use `apt_preference` resource to create the repo pinning rule
- Remove the `apt-get update` workaround ([#3][3])
- Add foodcritic and Knife cookbook tests
- Test with latest Chef 10 and 11 releases on Travis

## v1.1.0

- Workaround for apt cookbook not running `apt-get update` on apt_repository
  updates ([#3][3])
- Vagrant setup for manual testing ([#1][1])

## v1.0.0

- Initial public release


[1]:  https://github.com/reaktor/chef-debian/issues/1  "Issue 1"
[3]:  https://github.com/reaktor/chef-debian/issues/3  "Issue 3"
