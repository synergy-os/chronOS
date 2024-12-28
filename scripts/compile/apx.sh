#!/bin/bash

set -ouex pipefail
rpm-ostree install go git make podman
cat /root