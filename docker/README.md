# Docker

## Notes

### MySQL

Ref: https://github.com/tutumcloud/tutum-docker-mysql

The data only container:

```
docker/mysql_datastore$ docker build -t inertialbox/mysql_datastore .
docker/mysql/5.6$ docker build -t inertialbox/mysql .
```

docker run --name mysql_data inertialbox/mysql_datastore /bin/true

Interactively, this may be tested via the following, however, note that
the `run.sh` script needs to be invoked manually as well.

# --rm passed to remove container on exit; nice n' tidy.
docker run -ti --rm --volumes-from mysql_data --name mysql_run -p 3306:3306 -e MYSQL_PASS="0mDF30W43I" inertialbox/mysql /bin/bash

Run the `mysql_run` instance with `-d` in the background; this will
automatically launch the `run.sh` script as per its `Dockerfile`
command.

#### Persisted Images

```
docker/mysql_datastore$ docker save inertialbox/mysql_datastore > ~/docker_images/inertialbox_mysql_datastore.tar
docker/mysql/5.6$ docker save inertialbox/mysql > ~/docker_images/inertialbox_mysql.tar
```
