#!/bin/sh
uid=$(id -u)
if [ "${uid}" -ne 0 ]; then SUDO='sudo'; else SUDO=''; fi

"${SUDO}" install -g root -o root -m 644 -p -t /etc/systemd/system ollama.service
"${SUDO}" systemctl daemon-reload
#"${SUDO}" systemctl enable ollama.service
"${SUDO}" systemctl status --no-pager ollama.service