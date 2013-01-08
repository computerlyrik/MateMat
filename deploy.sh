#!/bin/sh
mvn clean package
cp target/MateMat-*.war /var/lib/jetty/webapps/root.war
service jetty restart
