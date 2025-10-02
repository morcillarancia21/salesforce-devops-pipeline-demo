# Salesforce DevOps CI/CD Pipeline (Demo)
![Validate INT](https://github.com/morcillarancia21/salesforce-devops-pipeline-demo/actions/workflows/validate-int.yml/badge.svg)

Este proyecto muestra cómo diseñé y automatizé un pipeline para **Salesforce** usando **GitHub Actions**.

## Características principales
- Autenticación con JWT (sin credenciales planas).
- Despliegues DELTA (solo cambios entre ramas).
- Validación en orgs de integración antes de merge.
- Notificación en SLACK al final del pipeline.
- Branch strategy por ambiente (INT,QA, UAT, PROD).

## Tecnologías
- Salesforce CLI (sfdx / sf)
- GitHub Actions
- Docker (imagen personalizada con plugins)

## Flujo
```mermaid
flowchart LR
  A[Developer Push] --> B[Pipeline Trigger]
  B --> C[Validate in INT Org]
  C --> D[Delta Deploy Package]
  D --> E[Deploy to Target Org]
  E --> F[Slack Notification]


## Tips y troubleshooting
“No hay cambios para desplegar”: Es normal si el delta no produjo manifest/package.xml (por ejemplo, cambios fuera de metadatos). 
El workflow termina OK.

Delta exacto: si usás estrategia distinta de ramas, ajusta:
BASE="otra_rama_base" y HEAD="HEAD", o
usar git merge-base si querés precisión absoluta entre commits.

Runner en contenedor: Cualquier paso que uses tendra sf y sfdx-git-delta porque vienen en la imagen.
