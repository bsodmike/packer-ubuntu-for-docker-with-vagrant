#!/bin/bash

APP_NAME=inertialbox

#docker ps -a | grep mysql-data > /dev/null 2>&1
#if [ $? -ne 0 ]; then
  #docker run --name mysql-data -v /var/lib/mysql inertialbox/trusty-base /bin/true
#fi

docker ps -a | grep "mysql[^\-]" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  docker run -d -v /tmp:/tmp -v /etc/mysql:/etc/mysql -v /var/lib/mysql:/var/lib/mysql --name mysql -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=0mDF30W43I" -e "MYSQL_USER=${APP_NAME}" -e "MYSQL_PASSWORD=A307W7oP52j6Fxv" -e "MYSQL_DATABASE=${APP_NAME}_production" mysql:5.7
fi

docker build -t inertialbox/inertialbox-app ~/hack/inertialbox.com
docker run -d --name app -v /var/lib/mysql:/var/lib/mysql -v /tmp:/tmp -p 80:80 -e "SECRET_KEY_BASE=secretkey" --link mysql:webdb inertialbox/inertialbox-app
