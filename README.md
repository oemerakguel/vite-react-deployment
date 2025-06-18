
# Deployment einer React-Anwendung mit Terraform und GitHub Actions auf AWS EC2

## Projektbeschreibung

In diesem Projekt wurde eine einfache React-Anwendung automatisiert auf einer Amazon EC2 Instanz deployed. Die Infrastruktur wurde mit Terraform definiert und mit Hilfe von GitHub Actions automatisch bereitgestellt. Die CI/CD-Pipeline übernimmt das Bauen, Bereitstellen und Übertragen der Anwendung.

## Workflow-Beschreibung

### 1. Continuous Integration (CI)
- Branch: `main`
- Aktionen:
  - Code Checkout
  - Node.js Setup
  - Installation der Abhängigkeiten
  - Build der React-App
  - Upload der Artefakte

### 2. Infrastruktur Provisionierung (Terraform)
- Initialisiert und wendet Terraform-Konfigurationen im `terraform/`-Verzeichnis an.
- Erstellt eine EC2-Instanz, ein Schlüsselpaar, eine Security Group, ein öffentliches Subnetz etc.
- Gibt die öffentliche IP der EC2-Instanz als Output zurück.

### 3. Deployment (CD)
- Lädt das React-Build herunter.
- Verbindet sich via SSH zur EC2-Instanz.
- Kopiert die Dateien per SCP.
- Verschiebt sie in das Webverzeichnis `/var/www/html`.
- Startet Nginx neu.

## Genutzte AWS-Ressourcen (über Terraform)

- EC2-Instanz (Ubuntu)
- Security Group (Port 22 & 80 offen)
- Key Pair für SSH
- Subnetz in `eu-central-1`
- Internet Gateway (für öffentliche IP)

## Pipeline ausführen

1. Push zum `main`-Branch stößt den vollständigen Build-und-Deploy-Prozess an.
2. Die React-App wird automatisch gebaut, auf die EC2-Instanz deployed und unter der IP erreichbar gemacht.

## Anwendung testen

1. Nach einem erfolgreichen Deployment findet sich im Output der GitHub Actions der Eintrag `instance_public_ip`.
2. Diese IP im Browser aufrufen:  
   `http://<INSTANCE_IP>`
3. Die React-App sollte erscheinen.

## GitHub Secrets konfigurieren

Folgende Secrets müssen in den Repository-Einstellungen hinterlegt werden:

| Secret Name             | Beschreibung                                 |
|-------------------------|----------------------------------------------|
| `AWS_ACCESS_KEY_ID`     | Zugriffsschlüssel für AWS                    |
| `AWS_SECRET_ACCESS_KEY` | Geheimschlüssel für AWS                      |
| `AWS_ACCESS_TOKEN`      | (Optional) Falls temporäre Session verwendet |
| `AWS_REGION`            | z. B. `eu-central-1`                          |
| `TF_STATE_BUCKET`       | S3-Bucket-Name für Terraform-Backend (falls verwendet) |
| `EC2_SSH_KEY`           | Privater SSH-Key im PEM-Format, als Text     |

Hinweis: Den privaten Schlüssel (`EC2_SSH_KEY`) sicher und korrekt ohne Umbrüche speichern.

## Destroy-Workflow

Um die gesamte Infrastruktur wieder zu löschen:

```bash
cd terraform
terraform destroy
```

Alternativ kann in GitHub Actions ein separater Destroy-Workflow eingerichtet werden (optional).

## Voraussetzungen

- AWS-Account mit entsprechenden IAM-Rechten
- GitHub Repository mit obigen Secrets
- Terraform & GitHub Actions aktiviert

