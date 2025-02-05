#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Remove system flathub
flatpak remote-delete flathub --assumeyes

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh
# goddamn rpm-ostree doesnt think theres an update
