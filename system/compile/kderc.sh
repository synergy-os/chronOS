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
rpm-ostree override remove avahi-devel clang-libs clang-resource-filesystem cmake cmake-data compiler-rt cups-devel doxygen extra-cmake-modules gcc-c++ gettext gmp-c++ gmp-devel gnutls-devel graphviz gts jsoncpp keyutils-libs-devel kf6-*-devel krb5-devel kwin-devel lasi libX11-devel libXau-devel libcom_err-devel libepoxy-devel libevent-devel libfbclient2 libffi-devel libglvnd-devel libidn2-devel libkadm5 libomp libomp-devel libpq libselinux-devel libsepol-devel libstdc++-devel libtasn1-devel libtasn1-tools libtommath libverto-devel libxcb-devel libxkbcommon-devel libxml2-devel netpbm nettle-devel p11-kit-devel pcre2-devel poppler-glib qt6-*-devel qt6-designer qt6-doctools qt6-linguist qt6-qtbase-ibase qt6-qtbase-odbc qt6-qtbase-postgresql qt6-qttools-libs-designer qt6-qttools-libs-designercomponents qt6-qttools-libs-help qt6-rpm-macros rhash unixODBC vulkan-headers vulkan-loader-devel wayland-devel xorg-x11-proto-devel xz-devel zlib-ng-compat-devel