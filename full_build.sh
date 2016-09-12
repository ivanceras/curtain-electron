#!/bin/sh

rm -rf build
rm -rf dep
rm -rf dist

sh checkout_dep.sh

sh build_dep.sh

sh build_app.sh

