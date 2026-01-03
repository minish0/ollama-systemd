#!/bin/sh
OLLAMA_PREFIX=${OLLAMA_PREFIX:-/opt}
OLLAMA_GID=${OLLAMA_GID:-50002}
OLLAMA_UID=${OLLAMA_UID:-50002}
OLLAMA_GNAME=${OLLAMA_GNAME:-ollama}
OLLAMA_UNAME=${OLLAMA_UNAME:-ollama}
OLLAMA_USER_HOME=${OLLAMA_USER_HOME:-"${OLLAMA_PREFIX}/${OLLAMA_UNAME}/share"}
uid=$(id -u)
if [ "${uid}" -ne 0 ]; then SUDO='sudo'; else SUDO=''; fi
"${SUDO}" groupadd -g ${OLLAMA_GID} ${OLLAMA_GNAME}
"${SUDO}" useradd -u ${OLLAMA_UID} -g ${OLLAMA_GID} -m -s /bin/false -d "${OLLAMA_USER_HOME}" ${OLLAMA_UNAME}