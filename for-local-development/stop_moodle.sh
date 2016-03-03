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

export MOODLE_VERSION=${MOODLE_VERSION} && \
export MOODLE_URL=${MOODLE_URL} && \
export MOODLE_DATA=`pwd`/$moodledata && \
export MOODLE_WWW=`pwd`/$moodlewww && \
docker-compose stop
