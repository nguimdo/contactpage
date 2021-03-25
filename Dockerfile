# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "nguimdofrancine15@gmail.com" 
COPY webapp/target/contact.war /usr/local/tomcat/webapps
