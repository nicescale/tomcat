#!/bin/bash

cron

source /etc/default/tomcat6 && 
exec /usr/share/tomcat6/bin/catalina.sh run
