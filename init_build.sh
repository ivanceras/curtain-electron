#!/bin/sh

rm -rf build

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


## Install electron-packager
npm install electron-packager -g

# Build for linux
electron-packager . Curtain --platform=linux --arch=x64 ./build

# Build for mac
electron-packager . Curtain --platform=darwin --arch=x64 ./build


# Build for windows
electron-packager . Curtain --platform=win32 --arch=x64 ./build
