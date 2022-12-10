#!/bin/bash

image="wpsite"
container="wpsite"
workDir=$(cd "$(dirname "$0")" && pwd); cd "${workDir}" || exit 1

cmd="docker stop $container"; echo "$cmd"; $cmd
cmd="docker rm $container"; echo "$cmd"; $cmd
cmd="docker run --name $container
-v ${workDir}/test-files/html:/var/www/html
-p 20080:80
-it --entrypoint /bin/bash $image
"
echo "$cmd"; $cmd
