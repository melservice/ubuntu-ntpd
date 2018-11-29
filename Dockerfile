FROM ubuntu:18.04

LABEL version="1.0"
LABEL description="NTP-Server als Service auf Ubuntu-Basis"
LABEL maintainer="develop@melsaesser.de"

# Verzeichnis für die Initialisierung des Images sowie Input und Output erstellen
RUN mkdir -p /docker/init \
        && mkdir -p /docker/input \
        && mkdir -p /docker/output

# Skripte für initialisierung des Images und Start des Containers kopieren
COPY scripts/initService.sh /docker/init/initService.sh
COPY scripts/runService.sh /docker/init/runService.sh

# Die aktuellen Paketlisten laden, Updates holen und Initialisierung laufen lassen,
# danach wird wieder aufgeräumt
RUN apt-get update \
        && apt-get -y full-upgrade \
	&& /docker/init/initService.sh \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Volumes, die nach außen gereicht werden sollen
VOLUME ["/docker/input", "/docker/output"]

# Port wird von außen zugänglich gemacht
EXPOSE 123/udp

# Dies ist das Start-Kommando
CMD ["/docker/init/runService.sh"]
