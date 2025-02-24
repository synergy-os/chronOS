# Base image arguments
ARG SOURCE_IMAGE="base"
ARG SOURCE_SUFFIX="-main"
ARG SOURCE_TAG="latest"

# Prepare the base image
FROM ghcr.io/ublue-os/${SOURCE_IMAGE}${SOURCE_SUFFIX}:${SOURCE_TAG}
COPY / /ctx

# Prepare script usage
RUN chmod +x /ctx/scripts/*.sh -R

# Begin image build
RUN mkdir -p /var/lib/alternatives && \
    /ctx/scripts/00-build-image.sh && \
    mv /var/lib/alternatives /staged-alternatives && \
    ostree container commit
