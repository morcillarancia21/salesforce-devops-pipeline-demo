#!/usr/bin/env bash
set -euo pipefail
# Requiere: sf CLI, sfdx-git-delta y git con remotos origin configurados
: "${FROM:=origin/main}"
: "${TO:=HEAD}"

echo "Generando delta: FROM=$FROM TO=$TO"
sf plugins install sfdx-git-delta || true
sfdx sgd:source:delta --to "$TO" --from "$FROM" --output "." --generate-delta
test -f manifest/package.xml && echo "OK: manifest/package.xml creado" || (echo "No hay cambios"; exit 0)
