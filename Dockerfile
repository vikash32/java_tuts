# FROM maven:3.8-openjdk-18-slim AS MAVEN_BUILD
# COPY ./ ./
# RUN mvn clean package
FROM openjdk:18-jdk-alpine3.15 

COPY target/helloworld-0.1.0.jar /demo.jar
CMD ["java", "-jar", "/demo.jar"]