FROM maven:3.9.4-eclipse-temurin-20-alpine AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build target/*.jar /app.jar
EXPOSE 8080

# java - jar /app.jar
ENTRYPOINT [ "java","-jar","/app.jar"]