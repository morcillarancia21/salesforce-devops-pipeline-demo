Este proyecto muestra una implementación completa de CI/CD para Salesforce utilizando GitHub Actions y una imagen Docker personalizada (tiagofgh/my-sfdx-delta-cli).
El objetivo es automatizar validaciones y despliegues basados en delta changes entre ramas, optimizando tiempos y asegurando integridad en cada integración.

## Tecnologías utilizadas

Salesforce CLI (sf) y sfdx-git-delta para análisis de diferencias y despliegues.

GitHub Actions para la orquestación del pipeline.

Docker para encapsular herramientas y dependencias.

Node.js / OpenJDK 17 dentro de la imagen base.

## Workflows incluidos

Cada entorno cuenta con su workflow independiente:

validate-int.yml → Validación en entorno INT

validate-qa.yml, validate-uat.yml, validate-prod.yml → Flujo extensible para entornos siguientes

## Imagen personalizada

Docker Hub: tiagofgh/my-sfdx-delta-cli

Incluye Salesforce CLI y el plugin sfdx-git-delta, listos para ejecutar pipelines sin instalaciones adicionales.

## Cómo probarlo

Configura los Secrets en tu repositorio:

AUTH_URL_INT

TESTLEVEL (opcional)

Ve a Actions → Validate INT → Run workflow

Observa cómo el pipeline autentica, genera el delta y valida los cambios directamente en Salesforce