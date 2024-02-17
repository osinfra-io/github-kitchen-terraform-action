#!/bin/sh -l

if [ -z "$2" ]; then
  bundle exec kitchen "$1"
else
  bundle exec kitchen "$1" "$2"
fi
