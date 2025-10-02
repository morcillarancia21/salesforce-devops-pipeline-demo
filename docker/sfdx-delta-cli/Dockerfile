FROM node:18-slim

# Dependencias del SO (incluye JRE requerido por sfdx-git-delta)
RUN apt-get update && apt-get install -y \
    git unzip curl ca-certificates \
    default-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Instalar Salesforce CLI (nuevo 'sf', incluye shim de 'sfdx')
RUN npm install --global @salesforce/cli

# Plugin delta (necesita Java instalado)
RUN yes | sf plugins install sfdx-git-delta

# Verificaciones útiles
RUN sf --version && sf plugins --core && java -version

WORKDIR /workspace