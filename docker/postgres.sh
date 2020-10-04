#!/usr/bin/env bash

case $1 in
  create)  docker create -p 5432:5432 --name postgres -v $PWD/data/postgres:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password postgres:9.6;;
  start)   docker start postgres;;
  stop)    docker stop postgres;;
  logs)    docker logs -f postgres;;
  rm)      docker rm postgres;;
  psql)    PGPASSWORD=password psql -h localhost -U postgres;;
  *) echo "Unknown command $1";;
esac
