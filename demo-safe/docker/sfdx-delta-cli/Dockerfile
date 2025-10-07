FROM node:18-slim
SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl jq ca-certificates openjdk-17-jre-headless \
 && rm -rf /var/lib/apt/lists/*

ENV SF_AUTOUPDATE_DISABLE=true \
    SFDX_HIDE_RELEASE_NOTES=true \
    SF_USE_PROGRESS_BAR=false \
    CI=true

RUN npm install -g @salesforce/cli \
 && sf --version \
 && sf plugins --core \
 && (yes | sf plugins install sfdx-git-delta --force || npm install -g sfdx-git-delta) \
 && sf plugins \
 && sf help sgd:source:delta >/dev/null 2>&1 || (echo 'sfdx-git-delta no quedó disponible' && exit 1)

WORKDIR /workspace

