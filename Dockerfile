# Use Maven to build the project
FROM maven:3.8.8-eclipse-temurin-17 AS build
WORKDIR /app

# Copy source code
COPY . .

# Build the WAR file
RUN mvn clean package

# Use Tomcat 11 with Java 17
FROM tomcat:11-jdk17

# Copy the generated WAR file to Tomcat
COPY --from=build /app/target/demo1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/demo1.war

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
