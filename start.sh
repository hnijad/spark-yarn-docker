#!/usr/bin/env bash

docker build -t hadoop-base-image:1.0 docker-images/base/  

docker build -t spark-base:1.0 docker-images/master/

docker compose up -d

bash scripts/ssh-setup.sh