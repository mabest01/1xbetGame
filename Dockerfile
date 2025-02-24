# Use Tomcat 11 as the base image
FROM tomcat:11.0.3-jdk17-temurin

# Set working directory
WORKDIR /usr/local/tomcat/webapps

# Copy the WAR file to the Tomcat webapps directory
COPY target/demo1-1.0-SNAPSHOT.war ./ROOT.war

# Expose port 8080 (Tomcat default)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
