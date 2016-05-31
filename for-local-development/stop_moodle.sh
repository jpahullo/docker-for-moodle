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
  MOODLE_VERSION=30
fi
echo "Using Moodle version: ${MOODLE_VERSION}"

if [ -z ${MOODLE_PORT} ]
then
  MOODLE_PORT=80
fi
echo "Using HTTP port: ${MOODLE_PORT}"

if [ -z ${MYSQL_PORT} ]
then
  MYSQL_PORT=3306
fi
echo "Using MySQL port: ${MYSQL_PORT}"


export MOODLE_VERSION=${MOODLE_VERSION} && \
export MOODLE_URL=${MOODLE_URL} && \
export MOODLE_DATA=`pwd`/$moodledata && \
export MOODLE_WWW=`pwd`/$moodlewww && \
export MOODLE_PORT=${MOODLE_PORT} && \
export MYSQL_PORT=${MYSQL_PORT} && \
docker-compose stop
