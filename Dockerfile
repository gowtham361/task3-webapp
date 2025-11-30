FROM tomcat:9.0-jdk17-temurin

COPY target/task3-webapp.war /usr/local/tomcat/webapps/task3.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

