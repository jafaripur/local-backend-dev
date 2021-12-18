#!/bin/bash

docker exec -t {{docker_php7fpm_container}} kill -USR2 1

#from inside container: kill -USR2 1
#docker exec -it {{docker_php7fpm_container}} ps aux
#docker exec -it {{docker_php7fpm_container}} kill -USR2 1
#docker exec -it {{docker_php7fpm_container}} ps aux