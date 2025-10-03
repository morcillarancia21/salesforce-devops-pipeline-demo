FROM node:18-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl jq ca-certificates openjdk-17-jre-headless \
 && rm -rf /var/lib/apt/lists/*

# Evitar autoupdate/telemetría en CI
ENV SF_AUTOUPDATE_DISABLE=true \
    SFDX_HIDE_RELEASE_NOTES=true \
    SF_USE_PROGRESS_BAR=false \
    CI=true

# Instalar Salesforce CLI y el plugin sfdx-git-delta (no-interactivo)
RUN npm install -g @salesforce/cli \
 && sf --version \
 && sf plugins --core \
 && yes | sf plugins install sfdx-git-delta --force \
 && sf plugins \
 && sf help sgd:source:delta \
 && npm cache clean --force

WORKDIR /workspace
