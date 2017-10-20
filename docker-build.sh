#!/usr/bin/env bash

docker-compose run \
  -v $PWD:/usr/src/app/source \
  -w /usr/src/app/source \
  app bundle exec middleman build --clean
