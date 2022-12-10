#!/bin/bash

image="wpsite"
workDir=$(cd "$(dirname "$0")" && pwd); cd "${workDir}" || exit 1
cmd="docker build -t $image ."; echo "$cmd"; $cmd
