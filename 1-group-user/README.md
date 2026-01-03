# User and group setup for Linux Operating System

## Determine the ollama service group and user on Linux

To run ollama as a systemd service, we should design ollama service group and user. It is discouraged that run ollama with systemd as root.
The varialbles are specified as follows. But be aware any IDs, NAMEs, HOME are check existence or duplication.

1. OLLAMA_GID (default: 50002)
2. OLLAMA_UID (default: 50002)
3. OLLAMA_GNAME (default: ollama)
4. OLLAMA_UNAME (default: ollama)
5. OLLAMA_USER_HOME (default: /opt/ollama/share)

## add-ollama-gu.sh

Simply create group and user with `groupadd` and `useradd` command.
The script detects if script user is not root, run them with `sudo`.

## del-ollama-gu.sh

Clean up group and user for ollama with `userdel` and `groupdel` for uninstallation.
