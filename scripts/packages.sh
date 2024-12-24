#!/bin/bash

set -ouex pipefail

rpm-ostree install chromebook-linux-audio \
	gstreamer1-plugin-openh264 \
	clapper \
	flatseal \
	zsh \
