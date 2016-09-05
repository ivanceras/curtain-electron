#!/bin/sh

mkdir -p build/

git clone --depth=1 --branch=master https://github.com/ivanceras/curtain build/curtain
git clone --depth=1 --branch=master https://github.com/ivanceras/curtain-elm build/curtain-elm

cd build/curtain

cargo build --release

cp ./target/release/iron_curtain ../

# in build directory
cd ../..

cd build/curtain-elm

make all

cd ../..

npm install --save-dev -g electron




