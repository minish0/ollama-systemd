#!/bin/sh
arch=$(uname -m | sed 's/x86_/amd/;s/aarch64/arm/')
c=$(printf "curl -LO 'https://ollama.com/download/ollama-linux-${arch}.tar.zst'")
printf "%s\n" "$c"
eval "$c"
# if you want to additional ROCm support, uncomment the following lines
# c=$(printf "curl -LO 'https://ollama.com/download/ollama-linux-%s-rocm.tar.zst'" "$arch")
# printf "%s\n" "$c"
# eval "$c"
