#!/bin/sh
#./mvnw clean install -Ddocker=true -Dnpm.test.script=test-chromium
docker build -t my-application/front:latest --no-cache .
docker run --name myapp-front -d -p 8080:80 --network="host" my-application/front:latest