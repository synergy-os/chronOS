#!/bin/bash

set -ouex pipefail

install () {
	/usr/bin/rpm-ostree install
}

remove () {
	/usr/bin/rpm-ostree override remove
}

install chromebook-linux-audio \
	gstreamer1-plugin-openh264 \
	google-chrome-stable \
	zsh-autosuggestions \
	zsh-syntax-highlighting \
	blackbox-terminal \
	clapper \
	flatseal \
	secrets \
	zsh

remove htop \
	nvtop \
	ptyxis