mkdir -p build

cd dep/curtain && cargo build --release

cd dep/curtain-elm && make all

