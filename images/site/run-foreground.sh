#!/bin/bash

image="docker-wp/site"
container="docker-wp_site"
workDir=$(cd "$(dirname "$0")" && pwd); cd "${workDir}" || exit 1
cmd="docker stop $container"; echo "$cmd"; $cmd
cmd="docker rm $container"; echo "$cmd"; $cmd
cmd="docker run --name $container
-v ${workDir}/run-env/www:/var/www/html
-p 20080:80
$image
"
echo "$cmd"; $cmd
