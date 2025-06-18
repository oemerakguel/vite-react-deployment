# Reflexion zur Projektarbeit – Deployment einer React-App auf AWS EC2

## Was habe ich gemacht?

Ich habe eine React-App erstellt und sie automatisiert über GitHub Actions auf eine EC2-Instanz bei AWS deployed. Dabei habe ich Terraform verwendet, um die Infrastruktur (wie die EC2-Instanz, Security Groups und Schlüssel) bereitzustellen. Der Build und das Deployment liefen automatisiert über ein CI/CD-Pipeline in GitHub.

## Was ist gut gelaufen?

- Die Verbindung zwischen GitHub Actions und AWS hat gut funktioniert.
- Die Build-Pipeline für die React-App lief reibungslos.
- Terraform war sehr hilfreich, um die Infrastruktur nachvollziehbar aufzubauen.
- Am Ende war alles automatisiert – sogar das Übertragen der Dateien zur EC2-Instanz.

## Was war schwierig?

- Das Zusammenspiel von Terraform, GitHub Actions und AWS war am Anfang verwirrend.
- Fehler mit Rechten auf der EC2-Instanz (z. B. beim Kopieren in `/var/www/html`) haben Zeit gekostet.
- Die Einrichtung des SSH-Zugangs über GitHub Actions hat etwas gedauert.
- Es war nicht sofort klar, wie man am besten den Output der Terraform-Instanz-IP in den Deploy-Job übernimmt.

## Was würde ich beim nächsten Mal anders machen?

- Ich würde früher eine Domain registrieren, um gleich HTTPS mit Let’s Encrypt einzurichten.
- Ich würde die Struktur der GitHub Actions noch etwas modularer gestalten (z. B. separate Workflows für Build und Deployment).
- Ich würde mir von Anfang an klarere Notizen machen, welche Schritte nötig sind, damit ich schneller auf Probleme reagieren kann.

## Was habe ich gelernt?

- Wie man mit Terraform AWS-Ressourcen erstellt.
- Wie GitHub Actions als CI/CD-Tool verwendet wird.
- Wie man per SCP und SSH Dateien auf eine EC2-Instanz deployed.
- Wie wichtig Rechte und Ownership bei Deployment-Zielen auf dem Server sind.
- Dass automatisiertes Deployment sehr hilfreich ist – aber auch viel Kleinarbeit am Anfang bedeutet.
