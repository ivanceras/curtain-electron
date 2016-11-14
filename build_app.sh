rm -rf dist/

cp dep/curtain/target/release/iron_curtain build/

cp -r dep/curtain-elm/build/* build/

cp src/* build/

cp -r assets build/

cp package.json build/


## Build for linux
#electron-packager ./build Curtain --platform=linux --arch=x64 --icon ./assets/favicon.ico --out ./dist

## Build for mac
electron-packager ./build Curtain --platform=darwin --arch=x64 --icon ./assets/favicon.ico --out ./dist


## Build for windows
#electron-packager ./build Curtain --platform=win32 --arch=x64 --icon ./assets/favicon.ico -out ./dist
