#!/bin/bash

APP_NAME=app

docker ps -a | grep mysql-data > /dev/null 2>&1
if [ $? -ne 0 ]; then
  docker run --name mysql-data -v /var/lib/mysql inertialbox/trusty-base /bin/true
fi

docker ps -a | grep "mysql[^\-]" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  docker run -d --volumes-from mysql-data -v /etc/mysql:/etc/mysql --name mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=0mDF30W43I" -e "MYSQL_USER=appuser" -e "MYSQL_PASSWORD=A307W7oP52j6Fxv" -e "MYSQL_DATABASE=${APP_NAME}_production" mysql:5.7
fi

docker run -ti --rm --volumes-from mysql-data --name web --link mysql:webdb inertialbox/trusty-base /bin/bash