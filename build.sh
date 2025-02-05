#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Compilation scripts
bash /ctx/system/compile/apx.sh
bash /ctx/system/compile/kderc.sh

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh
