#!/bin/bash

APP_NAME=app

docker run --name mysql-data -v /var/lib/mysql inertialbox/trusty-base /bin/true
#docker run -d --volumes-from mysql-data -v /etc/mysql:/etc/mysql --name mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=0mDF30W43I" -e "MYSQL_USER=appuser" -e "MYSQL_PASSWORD=A307W7oP52j6Fxv" -e "MYSQL_DATABASE=${APP_NAME}_production" mysql:5.7
docker run -d --volumes-from mysql-data -v /etc/mysql:/etc/mysql --name mysql -p 3306:3306 -e "MYSQL_PASS=0mDF30W43I" inertialbox/mysql
docker run -ti --rm --name web --link mysql:webdb inertialbox/trusty-base /bin/bash
