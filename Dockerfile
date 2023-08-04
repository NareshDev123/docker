FROM ubuntu:latest
RUN apt-get update
RUN apt install openjdk-8-jdk -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar -zxvf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78/* /opt/tomcat
EXPOSE 8080
COPY ./*.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

