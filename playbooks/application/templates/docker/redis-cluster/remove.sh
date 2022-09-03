#!/bin/bash

docker stop redis-1
docker rm redis-1
sudo rm -rf ./redis-1/data/*

docker stop redis-2
docker rm redis-2
sudo  rm -rf ./redis-2/data/*

docker stop redis-3
docker rm redis-3
sudo  rm -rf ./redis-3/data/*

docker stop redis-4
docker rm redis-4
sudo  rm -rf ./redis-4/data/*

docker stop redis-5
docker rm redis-5
sudo rm -rf ./redis-5/data/*

docker stop redis-6
docker rm redis-6
sudo rm -rf ./redis-6/data/*