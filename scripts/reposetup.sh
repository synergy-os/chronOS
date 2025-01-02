#!/bin/bash

set -ouex pipefail

wget -O /etc/yum.repos.d/_copr_pvermeer-chromebook-linux-audio.repo \
    https://copr.fedorainfracloud.org/coprs/pvermeer/chromebook-linux-audio/repo/fedora-41/pvermeer-chromebook-linux-audio-fedora-41.repo
# wget -O /etc/yum.repos.d/_copr_petersen-nix-fedora-41.repo \
    https://copr.fedorainfracloud.org/coprs/petersen/nix/repo/fedora-41/petersen-nix-fedora-41.repo
cp -r /ctx/scripts/localrepos/* /etc/yum.repos.d/