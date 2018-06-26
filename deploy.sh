#!/bin/sh
set -ev

# Push to DockerHub
docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
docker tag app tommilligan/stanford-ner-docker
docker push tommilligan/stanford-ner-docker

# Deploy to Heroku
heroku update
heroku container:login
docker tag app registry.heroku.com/nervous-efficient-rebel/web
docker push registry.heroku.com/nervous-efficient-rebel/web
heroku container:release -a nervous-efficient-rebel web
