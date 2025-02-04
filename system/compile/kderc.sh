#!/bin/bash

BUILD_DEPS="cmake cmake-data gcc-c++ extra-cmake-modules kwin-devel kf6-kconfigwidgets-devel libepoxy-devel kf6-kcmutils-devel kf6-rpm-macros kf6-ki18n-devel qt6-qtbase-private-devel wayland-devel
"

# prep
rpm-ostree install $BUILD_DEPS

# compile
git clone https://github.com/matinlotfali/KDE-Rounded-Corners
cd KDE-Rounded-Corners
mkdir build
cd build
cmake ..
cmake --build . -j
make install

# cleanup
rpm-ostree override remove $BUILD_DEPS
