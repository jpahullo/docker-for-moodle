#!/bin/bash

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

export MOODLE_VERSION=${MOODLE_VERSION} && \
export MOODLE_URL=${MOODLE_URL} && \
export MOODLE_DATA=`pwd`/$moodledata && \
export MOODLE_WWW=`pwd`/$moodlewww && \
docker-compose down
docker rm apache-moodle-${MOODLE_VERSION}
docker rmi forlocaldevelopment_moodle
docker rmi ubuntu:14.04
docker rmi mysql/mysql-server
docker rmi busybox

sudo rm -rf $moodledata $moodlewww
