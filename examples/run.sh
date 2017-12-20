#!/bin/bash

cd $(dirname $0)/..
bundle
exec bundle exec ./exe/cf-lint -t ./examples/log-delivery-s3-bucket.yml -t ./examples/public-read-s3-bucket.yml  -t ./examples/public-read-write-s3-bucket.yml -r examples/ -p examples/profile
