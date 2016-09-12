
rm -rf dep
mkdir -p dep

git clone --depth=1 --branch=master https://github.com/ivanceras/curtain dep/curtain
git clone --depth=1 --branch=master https://github.com/ivanceras/curtain-elm dep/curtain-elm
