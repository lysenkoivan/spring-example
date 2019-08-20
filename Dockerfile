FROM openjdk:8-jdk-alpine as build
WORKDIR /workspace/app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN chmod +x ./mvnw &&./mvnw install

FROM openjdk:8-jdk-alpine
VOLUME /tmp
WORKDIR /app
COPY --from=build /workspace/app/target/spring-example.jar /app/spring-example.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "spring-example.jar"]