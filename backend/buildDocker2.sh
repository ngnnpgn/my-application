FROM alpine/git
WORKDIR /app
RUN git clone https://github.com/spring-projects/spring-petclinic.git

FROM okteto/maven
WORKDIR /app
COPY --from=0 /app/spring-petclinic /app
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=1 /app/target/spring-petclinic-1.5.1.jar /app
CMD ["java -jar spring-petclinic-1.5.1.jar"] 