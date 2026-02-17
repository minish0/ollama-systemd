#!/bin/sh
###
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
### download ollama archive with `0-download/ollama-download.sh`
#0-download/ollama-download.sh
### Stop ollama.service for upgrading
"${SUDO}" systemctl status --quiet --no-pager ollama
if [ "$?" -eq '0' ]; then "${SUDO}" systemctl stop --quiet ollama; fi
### Remove old binaries except models, systemd config
"${SUDO}" rm -rf "${OLLAMA_ROOT}/"{bin,lib}
### Extract new archive
## extract ollama archive with `0-download/ollama-extract.sh`
/bin/sh 0-download/ollama-extract.sh
### Confirm current ollama version
"${OLLAMA_ROOT}"/bin/ollama --version
