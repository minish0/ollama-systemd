# 3 updating ollama

## Download ollama

* download ollama archive with `0-download/ollama-download.sh`

## Stop ollama.service for upgrading

```
sudo systemctl status --quiet --nopager ollama
if [ "$?" -eq '0' ]; then sudo systemctl stop --quiet ollama; fi
```

## Remove old binaries except models, systemd config

* remove `"${OLLAMA_ROOT}/"{bin,lib}`

## Extract new archive 

* extract ollama archive with `0-download/ollama-extract.sh`

Leave `ollama.service` stopping.