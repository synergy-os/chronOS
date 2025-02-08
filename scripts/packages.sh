#!/bin/bash

set -ouex pipefail

# install pkgs
rpm-ostree install gstreamer1-plugin-openh264 \
	konqueror \
	kweather \
	kamoso \
	kcalc \
	haruna \
	isoimagewriter \
	kde-partitionmanager \
	ksystemlog \
	marble \
	okular \
	kclock \
	gwenview \
	secrets \
	klassy \
 	gcc \
	git

# remove pkgs from base image
rpm-ostree override remove htop \
	nvtop \
 	firefox-langpacks \
	firefox \
	toolbox
