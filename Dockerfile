# Use a base image with Java 17 and Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# Copy project files and build
COPY . .
RUN mvn clean package

# Use Tomcat 11 for deployment
FROM tomcat:11.0.3-jdk17
COPY --from=build /app/target/demo1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/demo1.war

# Expose the default Tomcat port
EXPOSE 8080
CMD ["catalina.sh", "run"]
