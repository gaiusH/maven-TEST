# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "gaiushendji@gmail.com" 
COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps
