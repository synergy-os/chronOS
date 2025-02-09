#!/bin/bash

set -ouex pipefail

# install pkgs
dnf5 -y install gstreamer1-plugin-openh264 \
	plasma-wallpapers-dynamic \
	librewolf \
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
dnf5 -y remove htop \
	nvtop \
 	firefox-langpacks \
	firefox \
	toolbox
