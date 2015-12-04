#!/bin/bash

git stash
echo "test_tag_"$CIRCLE_BUILD_NUM"
git tag -a "test_tag_"$CIRCLE_BUILD_NUM" -m "Automated build tag for release candidate"
git push --tags