# Base image arguments
ARG SOURCE_IMAGE="silverblue"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"

# Build the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY / /ctx

# Run compiler scripts
RUN bash /ctx/compile/apx.sh

# Sync changes
COPY /comproot/ /usr/
RUN rm -rf /comproot /comproot.work

# Begin regular build jobs
RUN mkdir -p /var/lib/alternatives && \
    /ctx/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit