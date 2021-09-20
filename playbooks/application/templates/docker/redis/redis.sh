#!/bin/bash

#After connect use password to login:
#
# AUTH 123456
#

docker exec -it {{docker_redis_container}} redis-cli "$@"