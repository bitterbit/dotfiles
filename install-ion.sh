#!/bin/bash -x

# TODO: make sure rustup and rustc are installed

TMPDIR=$(mktemp -d)
cd $TMPDIR && git clone https://gitlab.redox-os.org/redox-os/ion/

RUSTUP=0 make
sudo cp target/release/ion /usr/local/bin

# sudo make install prefix=/usr # TODO: not sure why not working on macos
sudo make update-shells prefix=/usr/local


cd -
rm -rf $TMPDIR

# nice shell prompt
cargo install starship
