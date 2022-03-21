FROM debian:unstable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --no-install-recommends expect bash fluxbox net-tools socat supervisor novnc x11vnc xvfb xterm firefox geany procps git mpv ffmpeg python3-pip qbittorrent && apt clean && apt autoremove -y && rm -rf /var/lib/apt/lists/*

COPY . /do
RUN rm /usr/share/novnc/app/sounds/* && chmod +x /do/conf.d/websockify.sh && chmod +x /do/run.sh && chmod +x /do/expect_vnc.sh && mkdir -p .mozilla/firefox/f83gmwpk.default-release && mv /do/profiles.ini .mozilla/firefox/ && mv /do/prefs.js .mozilla/firefox/f83gmwpk.default-release/
CMD ["/do/run.sh"]
