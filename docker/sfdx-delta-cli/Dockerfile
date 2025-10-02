FROM node:18-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl jq ca-certificates openjdk-17-jre-headless \
 && rm -rf /var/lib/apt/lists/*

ENV SF_AUTOUPDATE_DISABLE=true \
    SFDX_HIDE_RELEASE_NOTES=true \
    SF_USE_PROGRESS_BAR=false

RUN npm install -g @salesforce/cli \
 && sf --version \
 && sf plugins --core \
 && sf plugins install sfdx-git-delta \
 && sf plugins \
 && npm cache clean --force

WORKDIR /workspace
ENTRYPOINT ["bash"]
