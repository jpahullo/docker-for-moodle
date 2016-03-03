#!/bin/bash

# Usage example:
#
# $ export MOODLE_VERSION=30 && export MOODLE_URL=http://192.168.1.2:8080 && export MOODLE_PORT=8080 &&  export MYSQL_PORT=3306 && time ./start_moodle.sh
#

if [ `which docker` == "" ]
then
  echo "ERROR: docker not available."
  exit 1
fi
if [ `which docker-compose` == "" ]
then
  echo "ERROR: docker-compose not available."
  exit 1
fi

if [ -z ${MOODLE_VERSION} ]
then
  echo "Using Moodle version: 30"
  MOODLE_VERSION=30
fi

moodlewww=moodle-${MOODLE_VERSION}
moodledata=moodle-${MOODLE_VERSION}-data
if [ ! -d $moodlewww ]
then
  git clone -b MOODLE_${MOODLE_VERSION}_STABLE https://github.com/moodle/moodle.git $moodlewww
fi
if [ ! -d $moodledata ]
then
  mkdir $moodledata
fi
sudo chmod -R g+w $moodlewww $moodledata
sudo chgrp -R www-data $moodlewww $moodledata

export MOODLE_VERSION=${MOODLE_VERSION} && \
export MOODLE_URL=${MOODLE_URL} && \
export MOODLE_DATA=`pwd`/$moodledata && \
export MOODLE_WWW=`pwd`/$moodlewww && \
docker-compose up -d

echo ""
echo ""
echo "Reminder for Moodle settings:"
echo "  URL: ${MOODLE_URL}"
echo "  Moodle WWW: /var/www/html"
echo "  Moodle Data: /var/www/moodledata"
echo ""
echo "  Database:"
echo "   Type: mysqli"
echo "   Server: The host from your ${MOODLE_URL}"
echo "   Name: moodle"
echo "   Username: moodle"
echo "   Password: moodle"
echo "   Port: 3306"
echo ""
echo " Enjoy!"
