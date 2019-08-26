FROM openjdk:8-jdk-alpine
WORKDIR /workspace

RUN adduser -D appuser
USER appuser
COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src
USER root
RUN chmod +x ./mvnw 
USER appuser
RUN ./mvnw install

VOLUME /tmp
WORKDIR /app
RUN cp /workspace/target/spring-example.jar /app/spring-example.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar", "spring-example.jar"]