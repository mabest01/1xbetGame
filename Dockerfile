# Use Tomcat 11 with Java 17
FROM tomcat:11-jdk17

# Copy your WAR file to Tomcat webapps folder
COPY target/demo1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/demo1.war

# Expose Tomcat's default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
