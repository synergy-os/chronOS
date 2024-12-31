#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

# Run scripts
/ctx/scripts/reposetup.sh
/ctx/scripts/packages.sh
/ctx/scripts/quirks.sh