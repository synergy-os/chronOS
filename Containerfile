# Base image arguments
ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"
ARG DNF5_FLAGS="--setopt=install_weak_deps=0 --skip-unavailable"

# Compile programs
FROM fedora:41 as builder-compiler
ARG BUILD_DEPS="go git podman make gettext desktop-file-utils meson glib2 glib2-devel gtk-update-icon-cache"

RUN mkdir -p /output
RUN --mount=type=cache,target=/var/cache/libdnf5 \
    echo ${BUILD_DEPS} | xargs dnf5 install -y

FROM builder-compiler as output-compiler

COPY compile/ /tmp/compile
RUN bash /tmp/compile/apx.sh

# Build the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
RUN echo ${RUNTIME_DEPS} | xargs rpm-ostree install -y

COPY / /ctx
COPY --from=output-compiler /output/ /usr/

RUN mkdir -p /var/lib/alternatives && \
    /ctx/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit