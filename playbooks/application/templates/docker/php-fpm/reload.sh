#!/bin/bash

docker exec -t {{docker_phpfpm_container}} kill -USR2 1

#from inside container: kill -USR2 1
#docker exec -it {{docker_phpfpm_container}} ps aux
#docker exec -it {{docker_phpfpm_container}} kill -USR2 1
#docker exec -it {{docker_phpfpm_container}} ps aux