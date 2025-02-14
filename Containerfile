# Base image arguments
ARG SOURCE_IMAGE="kinoite"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"

# Prepare the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY / /ctx

# Prepare script usage
RUN chmod +x /ctx/scripts/packages/*.sh -R
RUN chmod +x /ctx/scripts/main/*.sh -R

# Begin build job
RUN mkdir -p /var/lib/alternatives && \
    /ctx/scripts/main/build.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit
