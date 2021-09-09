#!/bin/bash
set -ex

#mkdir -p ~/.fluxbox
#cat << EOF >>  ~/.fluxbox/menu
#[exec] (chromium) {'/usr/bin/chromium --no-sandbox --disable-dev-shm-usage'}
#EOF

#cat >> chr << EOF
#/usr/bin/chromium --disable-dev-shm-usage --no-sandbox --no-zygote --disable-gpu --disable-sync --no-pings --safebrowsing-disable-auto-update --safebrowsing-disable-download-protection --disable-client-side-phishing-detection
#EOF

exec supervisord -c /app/supervisord.conf
