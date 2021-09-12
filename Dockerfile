FROM debian:unstable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
    apt update && apt install -y --no-install-recommends expect bash fluxbox net-tools socat supervisor novnc x11vnc xvfb xterm firefox geany procps git mpv && apt clean && apt autoremove && rm -rf /var/lib/apt/lists/*

COPY . /do
RUN rm /usr/share/novnc/app/sounds/* && chmod +x /do/conf.d/websockify.sh && chmod +x /do/run.sh && chmod +x /do/expect_vnc.sh && mkdir -p .mozilla/firefox/f83gmwpk.default-release && mv /app/profiles.ini .mozilla/firefox/ && mv /app/prefs.js .mozilla/firefox/f83gmwpk.default-release/
CMD ["/do/run.sh"]
