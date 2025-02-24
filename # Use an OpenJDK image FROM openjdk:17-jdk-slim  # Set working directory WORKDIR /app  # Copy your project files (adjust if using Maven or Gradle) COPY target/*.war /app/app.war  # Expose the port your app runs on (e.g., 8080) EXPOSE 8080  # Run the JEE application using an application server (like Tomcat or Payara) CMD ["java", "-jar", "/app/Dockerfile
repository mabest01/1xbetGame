# Use an OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy your project files (adjust if using Maven or Gradle)
COPY target/*.war /app/app.war

# Expose the port your app runs on (e.g., 8080)
EXPOSE 8080

# Run the JEE application using an application server (like Tomcat or Payara)
CMD ["java", "-jar", "/app/app.war"]
