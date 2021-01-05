# OpenSIS Docker Image based on Debian LAMP 

This is a working docker image for [OpenSIS Responsive Design](https://github.com/OS4ED/openSIS-Responsive-Design) based on Debian and using Apache2 and mariadb.

## Build

* Build with `docker build . -t opensis`

## Run

* Start with `docker run -d -p8080:80 zoobab/opensis`
* Point a browser to localhost:8080/opensis
* Initial credentials for the DB are user `sisadmin` password `sisadmin`
