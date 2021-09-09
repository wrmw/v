FROM debian:unstable-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
    apt update && apt install -y --no-install-recommends expect bash fluxbox net-tools socat supervisor novnc x11vnc xvfb xterm firefox nano procps git geany mpv && apt clean && apt autoremove && rm -rf /var/lib/apt/lists/*

COPY . /app
COPY prefs.js /
RUN chmod +x /app/conf.d/websockify.sh
RUN chmod +x /app/run.sh
RUN chmod +x /app/expect_vnc.sh
CMD ["/app/run.sh"]