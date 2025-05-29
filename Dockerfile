#FROM ubuntu:latest
#LABEL authors="User"
#
#ENTRYPOINT ["top", "-b"]

FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN ./mvnw dependency:go-offline

COPY src ./src

RUN ./mvnw package -DskipTests

ENTRYPOINT ["java", "-jar", "target/springtaskmanager-0.0.1-SNAPSHOT.jar"]

EXPOSE 8080