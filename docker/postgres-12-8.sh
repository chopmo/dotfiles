#!/usr/bin/env bash

case $1 in
  create)  docker create -p 5432:5432 --name postgres-12-8 -v $PWD/data/postgres-12-8:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password postgres:12.8;;
  start)   docker start postgres-12-8;;
  stop)    docker stop postgres-12-8;;
  logs)    docker logs -f postgres-12-8;;
  rm)      docker rm postgres-12-8;;
  psql)    PGPASSWORD=password psql -h localhost -U postgres;;
  *) echo "Unknown command $1";;
esac
