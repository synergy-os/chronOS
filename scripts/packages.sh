#!/bin/bash

set -ouex pipefail

# fixes
rm /opt
mkdir /opt

# install pkgs
dnf5 -y install gstreamer1-plugin-openh264 \
	brave-browser \
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

# fixes
cp -r /opt/* /etc/falseopt
rm -r /opt
ln -s /var/opt /opt