# Salesforce DevOps CI/CD Pipeline (Demo)

Este proyecto muestra cómo diseñé y automatizé un pipeline para **Salesforce** usando **GitLab CI** y **Bitbucket Pipelines**.

##Características principales
- Autenticación con JWT (sin credenciales planas).
- Despliegues DELTA (solo cambios entre ramas).
- Validación en orgs de integración antes de merge.
- Notificación en SLACK al final del pipeline.
- Branch strategy por ambiente (INT,QA, UAT, PROD).

##Tecnologías
- Salesforce CLI (sfdx / sf)
- GitLab CI
- Bitbucket Pipelines
- Docker (imagen personalizada con plugins)

##Flujo
```mermaid
flowchart LR
A[Developer Push] --> B[Pipeline Trigger]
B --> C[Validate in INT Org]
C --> D[Delta Deploy Package]
D --> E[Deploy to Target Org]
E --> F[Slack Notification]
