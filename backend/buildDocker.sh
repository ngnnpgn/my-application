#!/bin/sh
#./mvnw clean install -Ddocker=true -Dnpm.test.script=test-chromium
./mvnw clean package -DskipTests
docker build -t my-application/backend:latest --build-arg JAR_FILE=spring-boot-jpa-postgresql-0.0.1-SNAPSHOT.jar --no-cache .
docker run --name myapp-backend -p 8080:8080 --memory="1g" --network="host" my-application/backend:latest