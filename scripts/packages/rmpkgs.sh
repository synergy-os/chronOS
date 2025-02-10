#!/bin/bash

set -ouex pipefail

# remove pkgs from base image
dnf5 -y remove htop \
	plasma-desktop \
	nvtop \
 	firefox-langpacks \
	firefox \
	toolbox
