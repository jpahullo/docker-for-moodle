<a href="https://zenhub.io"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>
<a href="https://www.docker.com"><img src="https://www.docker.com/sites/all/themes/docker/assets/images/logo.png"></a>

# docker-for-moodle

Easy to use, plug &amp; play, docker and docker compose to run Moodle at once in any available version.


# Prerequisites

1. Having [Docker installed](https://docs.docker.com/engine/installation/)
1. Having [docker-compose installed](https://docs.docker.com/compose/install/)


# Running it at once

Run these commands in a terminal to have a Moodle 3.0+ release up and running:

```
$ cd
$ git clone git@github.com:jpahullo/docker-for-moodle.git
$ cd docker-for-moodle
$ export MOODLE_VERSION=30 && export MOODLE_URL=http://localhost:8080 && docker-compose up -d
```

The result should be something like this:

```
$ docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                           NAMES
227acc161e14        dockerformoodle_moodle   "/usr/sbin/apache2ctl"   10 seconds ago      Up 9 seconds        443/tcp, 0.0.0.0:8080->80/tcp   apache-moodle-30
a2b657e51965        mysql/mysql-server       "/entrypoint.sh mysql"   44 minutes ago      Up 44 minutes       0.0.0.0:3306->3306/tcp          dockerformoodle_mysql_1
```

Open the browser and let's go!


# (Re)Building the Moodle image


Follow this steps to build a dockerized Moodle 3.0 weekly release. Update the Moodle version to build any other image.

```
$ cd
$ git clone git@github.com:jpahullo/docker-for-moodle.git
$ cd docker-for-moodle
$ export MOODLE_VERSION=30 && export MOODLE_URL=http://localhost:8080 && docker-compose build
```


# Author

Jordi Pujol-Ahulló <jpahullo@gmail.com>


# License

[MIT](LICENSE)
