#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Remove system flathub
flatpak remote-delete fedora --force

# Compilation scripts
bash /ctx/system/compile/apx.sh

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh
