#!/bin/bash

echo "Ìºê Starting deployment..."
docker-compose down
docker-compose build
docker-compose up -d
