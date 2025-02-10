#!/bin/bash

set -ouex pipefail

# clone repo
git clone https://github.com/aylur/ags.git /tmp/ags
cd /tmp/ags

# compile ags v2
go install -ldflags "\
    -X 'main.gtk4LayerShell=$(pkg-config --variable=libdir gtk4-layer-shell-0)/libgtk4-layer-shell.so' \
    -X 'main.astalGjs=$(pkg-config --variable=srcdir astal-gjs)'"

# move binary
go env
mv /root/go/bin/ags /usr/bin/