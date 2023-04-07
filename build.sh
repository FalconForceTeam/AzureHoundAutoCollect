#!/bin/bash

# Disabled for testing
# set -e

cd /tmp
git clone -b hh-fork/feat-az-managed-id https://github.com/0xffhh/AzureHound.git
# Once the PR is merged and a new build is made, you can use the main repo. 
# git clone https://github.com/BloodHoundAD/AzureHound.git
cd /tmp/AzureHound/
# Uncomment the two lines below when the PR to add support for System Assigned Managed Identity is merged and released.
# git fetch --tags
# latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latestTag
# technically, you need to build with some more flags, but doesn't really matter for now
go build