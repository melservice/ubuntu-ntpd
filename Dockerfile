FROM melservice/ubuntu-server:latest

LABEL version="1.0"
LABEL description="NTP-Server-Dienst als Docker-Service auf Ubuntu-Basis"
LABEL maintainer="develop@melsaesser.de"

# Die bereitgestellten Skripte und Einstellungen kopieren
COPY rootfs /

# Die aktuellen Paketlisten laden, Updates holen und Initialisierung laufen lassen,
# danach wird wieder aufgeräumt
RUN /docker/init/create-ubuntu-ntpd.sh

# Port wird von außen zugänglich gemacht
EXPOSE 123/udp

# Dies ist das Start-Kommando
CMD ["bash", "/docker/init/runService.sh"]
