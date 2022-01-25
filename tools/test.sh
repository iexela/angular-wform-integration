#!/bin/sh

SCOPE=$1
TEST_DIR=$2

if [ -z "$TEST_DIR" ]; then
  echo "usage: npm run test -- <scope> <test directory>" 1>&2
  echo
  exit 1
fi

lerna exec --scope $SCOPE -- npm ci
lerna exec --scope $SCOPE -- rm -rf ./src/integration-tests
lerna exec --scope $SCOPE -- cp -R $TEST_DIR ./src/integration-tests
lerna exec --scope $SCOPE -- npm test -- --watch=false --browsers=ChromeHeadless
