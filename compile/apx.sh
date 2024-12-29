#!/bin/bash

set -euxo pipefail

# compile apx
git clone --recursive https://github.com/Vanilla-OS/apx.git /tmp/apx
cd /tmp/apx
line_old="PREFIX := /usr"
line_new="PREFIX := /output"
sed -i "s%$line_old%$line_new%g" Makefile
make build 
make install && make install-manpages

# compile apx-gui
git clone https://github.com/Vanilla-OS/apx-gui /tmp/apx-gui
cd /tmp/apx-gui
meson --prefix=/output setup build
ninja -C build
ninja -C build install