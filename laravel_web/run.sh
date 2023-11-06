#!/bin/bash

composer install --no-dev
php artisan config:clear
php artisan route:cache
php artisan key:generate
php artisan storage:link
php-fpm