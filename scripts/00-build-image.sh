#!/bin/bash

echo "==================> Preparation"

# prep
echo "::group:: === Prep ==="
set -ouex pipefail
RELEASE="$(rpm -E %fedora)"
echo "::endgroup::"

# Set up repositories
echo "::group:: === Set up repositories ==="
/ctx/scripts/01-setup-repos.sh
echo "::endgroup::"

echo "==================> Packages"

# Run package scripts
echo "::group:: === Remove system packages ==="
/ctx/scripts/02-remove-packages.sh
echo "::endgroup::"
echo "::group:: === Install system packages ==="
/ctx/scripts/03-install-syspkgs.sh
echo "::endgroup::"
echo "::group:: === Install hyprland-related pkgs ==="
/ctx/scripts/04-install-hyprpkgs.sh
echo "::endgroup::"

echo "==================> Quirks"

# Run touchup scripts
echo "::group:: === Setup custom commands ==="
/ctx/scripts/05-command-setup.sh
echo "::endgroup::"
echo "::group:: === Setup system services ==="
/ctx/scripts/06-system-services.sh
echo "::endgroup::"
echo "::group:: === Setup extra quirks ==="
/ctx/scripts/07-extra-quirks.sh
echo "::endgroup::"
