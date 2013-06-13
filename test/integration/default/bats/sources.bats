#!/usr/bin/env bats

load test_helper

@test "configures sources.list" {
    local mirror='http://http.debian.net/debian'
    grep -qE "^deb\s+$(regexp_escape $mirror) $(codename) main contrib non-free$" /etc/apt/sources.list
}
