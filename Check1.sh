#!/bin/bash
service mysql status > /home/check-server-service/mysql-status
if [ "$(cat /home/check-server-service/mysql-status)" == " ERROR! MariaDB is not running" ]; then
sh /home/check-server-service/mysql-stopped
else
exit
fi
&&
service nginx status > /home/check-server-service/nginx-status
if [ "$(cat /home/check-server-service/nginx-status)" == "nginx is stopped" ]; then
sh /home/check-server-service/nginx-stopped
else
exit
fi
&&
service php-fpm status > /home/check-server-service/php-status
if [ "$(cat /home/check-server-service/php-status)" == "php-fpm is stopped" ]; then
sh /home/check-server-service/php-stoped
else
exit
fi
&&
service redis status > /home/check-server-service/redis-status
if [ "$(cat /home/check-server-service/redis-status)" == "redis-server is stopped" ]; then
sh /home/check-server-service/redis-stopped
else
exit
fi
