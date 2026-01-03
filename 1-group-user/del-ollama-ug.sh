#!/bin/sh
OLLAMA_GNAME=${OLLAMA_GNAME:-ollama}
OLLAMA_UNAME=${OLLAMA_UNAME:-ollama}
uid=$(id -u)
if [ "${uid}" -ne 0 ]; then SUDO='sudo'; else SUDO=''; fi
"${SUDO}" userdel -r ${OLLAMA_UNAME}
"${SUDO}" groupdel ${OLLAMA_GNAME}