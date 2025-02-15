#!/bin/bash

# prep
echo "::group:: === Prep ==="
set -ouex pipefail
RELEASE="$(rpm -E %fedora)"
echo "::endgroup::"

# Set up repositories
echo "::group:: === Set up repositories ==="
/ctx/scripts/main/reposetup.sh
echo "::endgroup::"

# Run package scripts
echo "::group:: === Remove system packages ==="
/ctx/scripts/packages/rmpkgs.sh
echo "::endgroup::"
echo "::group:: === Install system packages ==="
/ctx/scripts/packages/syspkgs.sh
echo "::endgroup::"
echo "::group:: === Install hyprland-related pkgs ==="
/ctx/scripts/packages/hyprpkgs.sh
echo "::endgroup::"

# Run touchup script
echo "::group:: === Apply system quirks ==="
/ctx/scripts/main/quirks.sh
echo "::endgroup::"