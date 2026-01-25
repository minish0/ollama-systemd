#!/bin/sh
arch=$(uname -m | sed 's/x86_/amd/;s/aarch64/arm/')
curl -LO "https://ollama.com/download/ollama-linux-${arch}.tar.zst"
# if you want to additional ROCm support, uncomment the following line
# curl -LO "https://ollama.com/download/ollama-linux-${arch}-rocm.tar.zst"
