FROM openjdk:17-slim
COPY target/hello-world-1.0-SNAPSHOT.jar /app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]

