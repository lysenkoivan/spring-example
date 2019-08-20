FROM openjdk:8-jdk-alpine
WORKDIR /workspace

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN chmod +x ./mvnw &&./mvnw install

VOLUME /tmp
WORKDIR /app
COPY /workspace/target/spring-example.jar /app/spring-example.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "spring-example.jar"]