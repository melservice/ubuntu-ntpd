# Das Image ubuntu-ntpd

Dies sind die Quellen für einen NTP-Service auf Ubuntu-Basis

## Organisation der Daten im Image

Die benötigten Dateien werden in zwei Kategorien eingeteilt. Die Eingangsdateien werden benötigt, damit der Container arbeiten kann. Die Ausgangsdateien werden vom Dienst geschrieben und müssen nach Beendigung des Containers erhalten bleiben.

## Skripte

Der im Container laufende Dienst wird über ein Skript hochgefahren und auch beendet.
