# Stage 1: Build the WAR file
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Deploy WAR file in Tomcat 11
FROM tomcat:11.0.3-jdk17-temurin
COPY --from=builder /app/target/demo1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
