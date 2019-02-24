### OpenSIS Docker Image based on Debian LAMP 

This is a working docker image for [OpenSIS Responsive Design](https://github.com/OS4ED/openSIS-Responsive-Design) based on Debian and using Apache2 and mariadb.

Initial credentials for the DB are user  `sisadmin` password `sisadmin`

## Build Instructions

* Clone the git repo 

* Execute `docker build . -t opensis`

* Start with `docker run -d --name opensis -p8080:80 opensis`

* Point a browser to localhost:8080/opensis


