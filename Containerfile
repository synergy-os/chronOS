# Base image arguments
ARG SOURCE_IMAGE="cosmic"
ARG SOURCE_SUFFIX="-kinoite"
ARG SOURCE_TAG="latest"

# Prepare the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY / /ctx

# Compile scripts
RUN bash /ctx/system/compile/apx.sh

# Begin regular build jobs
RUN mkdir -p /var/lib/alternatives && \
    /ctx/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit