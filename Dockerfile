# Pull base image 
FROM tomcat:8-jre8 

# Maintainer 
MAINTAINER "gaiuooshenni@gmail.com" 
COPY ./target/webapp.war /usr/local/tomcat/webapps
