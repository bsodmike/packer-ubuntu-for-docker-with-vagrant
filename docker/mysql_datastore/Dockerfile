# NOTE An image is not needed for this data container, instead simply perform
#
#   docker run --name mysql-data -v /var/lib/mysql inertialbox/trusty-base true
#
# and use `--volumes-from mysql-data`.

FROM inertialbox/trusty-base
MAINTAINER Michael de Silva <michael@inertialbox.com>

VOLUME /var/lib/mysql

CMD ["/bin/true"]
