OLLAMA_PREFIX=${OLLAMA_PREFIX:-/opt}
OLLAMA_ROOT=${OLLAMA_ROOT:-"${OLLAMA_PREFIX}/ollama"}
arch=$(uname -m | sed 's/x86_/amd/;s/aarch64/arm/')
ollama_archive="ollama-linux-${arch}.tgz"
uid=$(id -u)
if [ "${uid}" -ne 0 ]; then SUDO='sudo'; else SUDO=''; fi
if [ -d "${OLLAMA_ROOT}" ]; then
    echo "Removing existing ollama installation at ${OLLAMA_ROOT}"
    "${SUDO}" rm -rf "${OLLAMA_ROOT}"
else
    "${SUDO}" mkdir -vp "${OLLAMA_ROOT}"
fi
"${SUDO}" tar -C "${OLLAMA_ROOT}" -xzpf "${ollama_archive}"