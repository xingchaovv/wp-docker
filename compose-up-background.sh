#!/bin/bash

workDir=$(cd "$(dirname "$0")" && pwd); cd "${workDir}" || exit 1
cmd="docker compose stop"; echo "$cmd"; $cmd
cmd="docker compose rm -f"; echo "$cmd"; $cmd
cmd="docker compose up -d"; echo "$cmd"; $cmd
