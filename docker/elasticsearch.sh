#!/usr/bin/env bash

case $1 in
  create)  docker create -p 9200:9200 -p 9300:9300 --name elasticsearch -v elasticsearch:/usr/share/elasticsearch/data -e "discovery.type=single-node" elasticsearch:7.1.0;;
  start)   docker start elasticsearch;;
  stop)    docker stop elasticsearch;;
  logs)    docker logs -f elasticsearch;;
  rm)      docker rm elasticsearch;;
  *) echo "Unknown command $1";;
esac
