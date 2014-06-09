#!/bin/sh

TARGET="http://localhost/index.html"
AB_MRUBY="../ab-mruby"
AB_MRUBY_CONFIG="./ab-mruby.conf.rb"
AB_MRUBY_TEST="./ab-mruby.test.rb"

for url in $TARGET
do
  $AB_MRUBY -m $AB_MRUBY_CONFIG -M $AB_MRUBY_TEST $url
done
