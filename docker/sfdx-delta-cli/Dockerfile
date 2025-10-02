# Imagen base ligera (Debian Bookworm)
FROM node:18-slim

# Evitar prompts durante apt
ENV DEBIAN_FRONTEND=noninteractive

# Dependencias de sistema:
# - git, unzip, curl, jq: utilitarios
# - ca-certificates: TLS correcto para npm/descargas
# - openjdk-17-jre-headless: compatibilidad con herramientas que usan Java (MDAPI)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip curl jq ca-certificates openjdk-17-jre-headless \
 && rm -rf /var/lib/apt/lists/*

# Desactivar auto-update y telemetría del CLI en CI
ENV SF_AUTOUPDATE_DISABLE=true \
    SFDX_HIDE_RELEASE_NOTES=true \
    SF_USE_PROGRESS_BAR=false

# Instalar Salesforce CLI y el plugin sfdx-git-delta dentro de la imagen
RUN npm install -g @salesforce/cli \
 && sf --version \
 && sf plugins --core \
 && sf plugins install sfdx-git-delta \
 && sf plugins \
 && npm cache clean --force

# Directorio de trabajo por defecto
WORKDIR /workspace

# Shell por defecto (útil para steps en CI)
ENTRYPOINT ["bash"]

