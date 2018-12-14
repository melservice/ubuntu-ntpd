FROM melservice/ubuntu-server:latest

LABEL version="1.0"
LABEL description="NTP-Server-Dienst als Docker-Service auf Ubuntu-Basis"
LABEL maintainer="develop@melsaesser.de"

# Die bereitgestellten Skripte und Einstellungen kopieren
ADD scripts/ /docker/init/

# Die aktuellen Paketlisten laden, Updates holen und Initialisierung laufen lassen,
# danach wird wieder aufgeräumt
RUN /docker/init/initService.sh

# Volumes, die nach außen gereicht werden sollen
VOLUME ["/docker/input", "/docker/output"]

# Port wird von außen zugänglich gemacht
EXPOSE 123/udp

# Dies ist das Start-Kommando
CMD ["/docker/init/runService.sh"]
