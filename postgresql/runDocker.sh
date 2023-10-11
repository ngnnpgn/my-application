#!/bin/sh
docker pull postgres:13
docker run --name myapp-postgres -e POSTGRES_PASSWORD=M3P@ssw0rd\! -e POSTGRES_USER=myapplication -e POSTGRES_DB=myapp -p 5432:5432 -d postgres
# docker start myapp-postgres
# docker stop myapp-postgres
# docker exec -it myapp-postgres bash