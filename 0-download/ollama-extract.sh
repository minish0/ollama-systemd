OLLAMA_PREFIX=${OLLAMA_PREFIX:-/opt}
OLLAMA_ROOT=${OLLAMA_ROOT:-"${OLLAMA_PREFIX}/ollama"}
OLLAMA_GID=${OLLAMA_GID:-50002}
OLLAMA_UID=${OLLAMA_UID:-50002}
OLLAMA_GNAME=${OLLAMA_GNAME:-ollama}
OLLAMA_UNAME=${OLLAMA_UNAME:-ollama}
arch=$(uname -m | sed 's/x86_/amd/;s/aarch64/arm/')
ollama_archive="ollama-linux-${arch}.tar.zst"
ollama_archive_rocm="ollama-linux-${arch}-rocm.tar.zst"
uid=$(id -u)
if [ "${uid}" -ne 0 ]; then SUDO='sudo'; else SUDO=''; fi
if [ -d "${OLLAMA_ROOT}" ]; then
    echo "Removing existing ollama binary and library at ${OLLAMA_ROOT}."
    "${SUDO}" rm -rf "${OLLAMA_ROOT}/"{bin,lib}
fi
"${SUDO}" mkdir -vp "${OLLAMA_ROOT}"
"${SUDO}" tar -C "${OLLAMA_ROOT}" -xpf "${ollama_archive}"
"${SUDO}" tar -C "${OLLAMA_ROOT}" -xpf "${ollama_archive_rocm}"
### create etc for preserve environment configuration for systemd when upgrading
"${SUDO}" mkdir -vp "${OLLAMA_ROOT}/etc"
### create share for preserve model files directory when upgrading
"${SUDO}" mkdir -vp "${OLLAMA_ROOT}/share"
### change ownership of ollama model files directory to ollama user
"${SUDO}" chown -R "${OLLAMA_UNAME}:${OLLAMA_GNAME}" "${OLLAMA_ROOT}/share"
