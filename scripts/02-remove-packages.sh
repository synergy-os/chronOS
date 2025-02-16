#!/bin/bash

# prep
set -ouex pipefail

# remove pkgs from base image
dnf5 -y remove htop \
	nvtop \
 sudo \
 	firefox-langpacks \
	firefox \
	fedora-logos \
	toolbox \
	sddm
