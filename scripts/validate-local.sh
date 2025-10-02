#!/usr/bin/env bash
set -euo pipefail
# Requiere AUTH_URL_INT en un archivo o variable (ej: authurl)
: "${TESTLEVEL:=RunLocalTests}"

if [ ! -f authurl ]; then
  echo "Coloca tu Auth URL en un archivo llamado 'authurl' (solo para pruebas locales)"; exit 1
fi

sf org login sfdx-url -f authurl -s --alias ORG-TEST
test -f manifest/package.xml || { echo "No existe manifest/package.xml (ejecuta delta-local.sh antes)"; exit 1; }
sf project deploy validate --manifest manifest/package.xml --target-org ORG-TEST --wait 10 --test-level "$TESTLEVEL" --verbose
