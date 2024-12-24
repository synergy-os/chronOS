#!/bin/bash

set -ouex pipefail

rpm-ostree install chromebook-linux-audio \
	gstreamer1-plugin-openh264 \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	blackbox-terminal \
	clapper \
	flatseal \
	secrets \
	zsh

rpm-ostree override remove htop \
	nvtop \
	ptyxis
