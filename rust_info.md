cargo run --example deconding -- --exoption exargi1 eaxrg2
cargo run --bin
cargo build
cargo build --release
cargo check

# rust for stm32
https://habr.com/ru/post/495948/

cd /usr/local/share
tar xjf ~/Downloads/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2

sudo ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc
sudo ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++
sudo ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb
sudo ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size

# 
- https://docs.rs/cortex-m-quickstart/0.2.4/cortex_m_quickstart/

sudo apt-get install binutils-arm-none-eabi (on Ubuntu)
cargo install cargo-clone
cargo install --force cargo-make

# fix no auth
#### .cargo/config
```bash
[net]
git-fetch-with-cli = true
```

# hello world blink
- Скрестить эти два проекта и должно заработать на stm32f103c8
- https://habr.com/ru/post/495948/
- https://github.com/stm32-rs/stm32f1xx-hal


# golang - rust
https://programming-idioms.org/cheatsheet/Go/Rust
