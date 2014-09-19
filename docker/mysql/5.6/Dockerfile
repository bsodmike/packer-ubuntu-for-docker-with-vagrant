FROM inertialbox/trusty-base
MAINTAINER Michael de Silva <michael@inertialbox.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -yq install mysql-server-5.6 pwgen supervisor && \
  rm -rf /var/lib/apt/lists/*

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# Add MySQL configuration
ADD my.cnf /etc/mysql/conf.d/my.cnf
ADD mysqld_charset.cnf /etc/mysql/conf.d/mysqld_charset.cnf

# Add MySQL scripts
ADD create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Exposed ENV
ENV MYSQL_USER admin
ENV MYSQL_PASS **Random**

# Add VOLUMEs to allow backup of config and databases
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

# Setup Supervisord
RUN mkdir -p /var/log/supervisor /var/run/mysql
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 3306
CMD /run.sh && /usr/bin/supervisord
