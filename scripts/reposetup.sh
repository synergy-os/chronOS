#!/bin/bash

set -ouex pipefail

wget -O /etc/yum.repos.d/_copr_pvermeer-chromebook-linux-audio.repo \
    https://copr.fedorainfracloud.org/coprs/pvermeer/chromebook-linux-audio/repo/fedora-"${FEDORA_MAJOR_VERSION}"/pvermeer-chromebook-linux-audio-fedora-"${FEDORA_MAJOR_VERSION}".repo
wget -O /etc/yum.repos.d/petersen-nix-fedora-"${FEDORA_MAJOR_VERSION}".repo \
    https://copr.fedorainfracloud.org/coprs/petersen/nix/repo/fedora-"${FEDORA_MAJOR_VERSION}"/petersen-nix-fedora-"${FEDORA_MAJOR_VERSION}".repo
cp /ctx/scripts/localrepos/google-chrome.repo /etc/yum.repos.d