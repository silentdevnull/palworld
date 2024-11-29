FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm lib32-gcc-libs wget tar gzip shadow wget && \
    useradd -m steam

USER steam
WORKDIR /home/steam
RUN mkdir -p /home/steam/steamcmd && \
    wget -qO- https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar xvz -C /home/steam/steamcmd



COPY --chown=steam:steam scripts/startup.sh /scripts/
COPY --chown=steam:steam scripts/backup.sh /scripts/
COPY --chown=steam:steam scripts/update.sh /scripts/

RUN chmod +x /scripts/*.sh

#CMD ["/scripts/startup.sh"]
ENTRYPOINT ["/bin/bash", "/scripts/startup.sh"]
