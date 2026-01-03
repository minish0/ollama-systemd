# ollama service unit file and enviroment

This directory contains a little additional ollama service configuration  to [ollama official document for systemd](https://docs.ollama.com/linux#adding-ollama-as-a-startup-service-recommended)

## ollama-service-install.sh

A simple script for put `ollama.service` unit file into `/etc/systemd/system`, `systemctl daemon-reload` and show unit status with `systemctl --no-pager status ollama.service`.

## ollama.service

A modified `ollama.service` unit file from ollama official document.

* Added some `Environment` lines for detailed setup.
* Explicitly defined `StandardOutput` and `StandardError` lines. Detailed configurations for [systemd.exec document](https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html).
* Full ollama environment variable configuration with the `EnvironmentFile` line which load `systemd-ollama.env` in the directory `/opt/ollama/etc`.

## systemd-ollama.env

Almost full environment variables for linux systemd unit file.
Refer [ollama / envconfig / config.go](https://github.com/ollama/ollama/blob/main/envconfig/config.go).