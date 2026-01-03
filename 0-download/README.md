There are 2 simple shell scripts are in the 0-download directory.

##  ollama-download.sh

Simply download ollama archive from [ollama.com](https://ollama.com/download/) detecting `uname -m` command.

## ollama-extract.sh

Extract ollama archive in the directory `$OLLAMA_PREFIX`.
For example:

```
OLLAMA_PREFIX=/usr sh ollama-extract.sh
```