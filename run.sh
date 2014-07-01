#!/bin/bash

cron

source /etc/default/tomcat7 && 
exec /usr/share/tomcat7/bin/catalina.sh run
