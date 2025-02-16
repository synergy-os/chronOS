#!/bin/bash

# prep
set -ouex pipefail

# remove pkgs from base image
dnf5 -y remove htop \
	plasma-desktop \
	nvtop \
 sudo \
 	firefox-langpacks \
	firefox \
	fedora-logos \
	toolbox \
	sddm \
	dolphin \
	systemsettings \
	kate \
	kwrite \
	filelight \
	kde-partitionmanager \
	kcharselect \
	kwallet \
	konsole \
	krfb \
	kdebugsettings
