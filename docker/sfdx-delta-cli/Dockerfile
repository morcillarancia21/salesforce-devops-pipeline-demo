FROM node:18-slim

# Usar bash para que los pipes/OR funcionen igual en amd64/arm64
SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl jq ca-certificates openjdk-17-jre-headless \
 && rm -rf /var/lib/apt/lists/*

# Evitar autoupdate/telemetría en CI
ENV SF_AUTOUPDATE_DISABLE=true \
    SFDX_HIDE_RELEASE_NOTES=true \
    SF_USE_PROGRESS_BAR=false \
    CI=true

# Instalar Salesforce CLI + sfdx-git-delta con fallback
RUN npm install -g @salesforce/cli \
 && sf --version \
 && sf plugins --core \
 # intento 1: instalar vía sf, auto-aceptando el prompt
 && yes | sf plugins install sfdx-git-delta --force \
 # si lo anterior fallara por cualquier motivo, fallback a npm global
 || npm install -g sfdx-git-delta \
 # mostrar plugins instalados
 && sf plugins \
 # validar que el comando existe (si no, fallar)
 && sf help sgd:source:delta >/dev/null 2>&1 \
 || (echo 'sfdx-git-delta no quedó disponible' && exit 1)

WORKDIR /workspace

