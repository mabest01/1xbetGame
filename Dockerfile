# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the WAR file from the target directory (make sure the WAR file exists at this location)
COPY target/*.war /app/app.war

# Expose the port that your application will run on (e.g., Tomcat default port)
EXPOSE 8080

# Run the JEE application using a servlet container like Tomcat (in this case, we are just running the WAR directly)
CMD ["java", "-jar", "/app/app.war"]
