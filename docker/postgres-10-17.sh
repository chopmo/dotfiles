#!/usr/bin/env bash

case $1 in
  create)  docker create -p 5432:5432 --name postgres-10-17 -v $PWD/data/postgres-10-17:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password postgres:10.17;;
  start)   docker start postgres-10-17;;
  stop)    docker stop postgres-10-17;;
  logs)    docker logs -f postgres-10-17;;
  rm)      docker rm postgres-10-17;;
  psql)    PGPASSWORD=password psql -h localhost -U postgres;;
  *) echo "Unknown command $1";;
esac
