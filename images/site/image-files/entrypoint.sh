#!/bin/bash

workDir=$(cd "$(dirname "$0")" && pwd); cd "${workDir}" || exit 1

# PHP-FPM run in background
php-fpm &
echo "PHP-FPM Process：${!}"

# Nginx run in background
nginx -g 'daemon off;' &
echo "Nginx Process：${!}"

# Keep waiting
wait
