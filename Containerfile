# Base image arguments
ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"

# Prepare the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY / /ctx

# Install Nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon

# Begin regular build jobs
RUN mkdir -p /var/lib/alternatives && \
    /ctx/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit