ARG version=11
FROM openjdk:${version}
EXPOSE 9090
WORKDIR /app
RUN apt-get update && apt-get -y install maven
COPY . .
# RUN maven package
ENTRYPOINT [ "java","-jar","/spring-boot-docker.jar" ]
