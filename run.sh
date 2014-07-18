#!/bin/bash

cron

envfile=${CONF_DIR-:/etc/tomcat6}/env

[ -f $envfile ] &&
. $envfile &&
eval `cat $envfile|grep -v ^#|grep '='|cut -f1 -d'='|xargs echo export`

source /etc/default/tomcat6 && 
exec /usr/share/tomcat6/bin/catalina.sh run
