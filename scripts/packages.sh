#!/bin/bash

set -ouex pipefail

rpm-ostree install gstreamer1-plugin-openh264 \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	blackbox-terminal \
 	util-linux \
	clapper \
	flatseal \
	secrets \
	zsh \
 	gcc

rpm-ostree override remove htop \
	nvtop \
	ptyxis \
	gnome-system-monitor \
 	toolbox

# Run any compile scripts

bash /ctx/scripts/compile/apx.sh
