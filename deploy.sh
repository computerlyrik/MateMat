#!/bin/sh
mvn clean package -DskipTests=true
sudo cp target/MateMat-*.war /var/lib/jetty8/webapps/root.war
sudo service jetty restart
