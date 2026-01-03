#!/bin/sh
arch=$(uname -m | sed 's/x86_/amd/;s/aarch64/arm/')
curl -LO "https://ollama.com/download/ollama-linux-${arch}.tgz"