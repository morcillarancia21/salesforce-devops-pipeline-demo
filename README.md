# Salesforce DevOps CI/CD Pipeline (Demo)

Este proyecto muestra cómo diseñé y automatizé un pipeline para **Salesforce** usando **GitLab CI** y **Bitbucket Pipelines**.

## Características principales
- Autenticación con JWT (sin credenciales planas).
- Despliegues DELTA (solo cambios entre ramas).
- Validación en orgs de integración antes de merge.
- Notificación en SLACK al final del pipeline.
- Branch strategy por ambiente (INT,QA, UAT, PROD).

## Tecnologías
- Salesforce CLI (sfdx / sf)
- GitLab CI
- Bitbucket Pipelines
- Docker (imagen personalizada con plugins)

## Flujo
```mermaid
flowchart LR
A[Developer Push] --> B[Pipeline Trigger]
B --> C[Validate in INT Org]
C --> D[Delta Deploy Package]
D --> E[Deploy to Target Org]
E --> F[Slack Notification]

## GitHub Actions (opcional)
Este repo también incluye un workflow de GitHub Actions que reutiliza mi imagen Docker para validar cambios en INT:
- Archivo: .github/workflows/validate-int.yml
- Secrets requeridos: AUTH_URL_INT / OPCIONAL TEST_LEVEL

## Tips y troubleshooting
“No hay cambios para desplegar”: Es normal si el delta no produjo manifest/package.xml (por ejemplo, cambios fuera de metadatos). 
El workflow termina OK.

Delta exacto: si usás estrategia distinta de ramas, ajusta:
BASE="otra_rama_base" y HEAD="HEAD", o
usar git merge-base si querés precisión absoluta entre commits.
Errores de auth: re-genera tu Auth URL (TPs expiran si se borran/rotan).

Runner en contenedor: Cualquier paso que uses tendra sf y sfdx-git-delta porque vienen en la imagen.
