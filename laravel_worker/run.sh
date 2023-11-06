#!/bin/bash
php artisan queue:listen > storage/logs/queue.log