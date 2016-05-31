<a href="https://zenhub.io"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>
<a href="https://www.docker.com"><img src="https://www.docker.com/sites/all/themes/docker/assets/images/logo.png"></a>

# docker-for-moodle

Easy to use, plug &amp; play, docker and docker compose to run Moodle at once in any available version.


# Prerequisites

1. Having [Docker installed](https://docs.docker.com/engine/installation/)
1. Having [docker-compose installed](https://docs.docker.com/compose/install/)

# Running for local development

The idea is to have out of the docker image, mounted as volumes, both MOODLEHOME as well as MOODLEDATA, inside the
`for-local-development/` directory. The goal is to have it locally to help in development and integration with
new plugins.

To start it at once, simply run:

```
cd for-local-development
./start_moodle.sh
```

If it is the first time `start_moodle.sh` is executed, this will download docker image and Moodle source code.
Then, it will start the a Moodle web server at http://localhost and a PhpMyAdmin manager at http://localhost:8080.

To stop it, just run:

```
cd for-local-development
./stop_moodle.sh
```

Whenever you need to make a **hard** clean (removing images and code) just run:

```
cd for-local-development
./purge.sh
```

If you purge it all, then you will download docker images and Moodle code right again (implicitly with the `start_moodle.sh` script).

# Running it at once

TODO: Section to revisit.

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
