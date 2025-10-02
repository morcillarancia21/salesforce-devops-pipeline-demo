# Salesforce DevOps CI/CD Pipeline Demo

Este repositorio muestra cómo implemente un **pipeline DevOps para Salesforce** utilizando **Bitbucket Pipelines**, **Salesforce CLI (sf)** y una **imagen Docker personalizada** publicada en Docker Hub.

El objetivo es demostrar **buenas prácticas de CI/CD** en Salesforce: autenticación segura, despliegues delta, validación previa y despliegues controlados a múltiples ambientes (INT → QA → UAT → PROD).

---

## Recursos utilizados
- **Salesforce CLI (`sf`)** → línea de comandos oficial.
- **sfdx-git-delta** → plugin para generar **delta deployments**.
- **Bitbucket Pipelines** → ejecución del CI/CD.
- **Docker personalizado** → [tiagofgh/my-sfdx-delta-cli](https://hub.docker.com/r/tiagofgh/my-sfdx-delta-cli) (con CLI + plugins).
- **Auth URL** → autenticación sin exponer credenciales.

---

## Estructura del repositorio
salesforce-devops-pipeline-demo
├─ docker/ # Dockerfile de la imagen personalizada
│ └─ sfdx-delta-cli/
├─ pipelines/ # Definición del pipeline en Bitbucket
│ └─ bitbucket-pipelines.yml
├─ scripts/ # Scripts auxiliares ßpara pruebas locales
│ ├─ delta-local.sh
│ └─ validate-local.sh
├─ docs/ # Diagramas y capturas de ejemplo
└─ README.md # Este archivo

## Variables seguras en Bitbucket
Configurar en Repository → Settings → Repository variables:
AUTH_URL_INT
AUTH_URL_QA
AUTH_URL_UAT
AUTH_URL_PROD (opcional/sugiero )
TESTLEVEL (ej: RunLocalTests o NoTestRun)