#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dab6a71a08759001ca470e9/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dab6a71a08759001ca470e9
curl -s -X POST https://api.stackbit.com/project/5dab6a71a08759001ca470e9/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5dab6a71a08759001ca470e9/webhook/build/publish > /dev/null
