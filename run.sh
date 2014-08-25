#!/bin/bash

cron

envfile=${CONF_DIR-:/etc/tomcat7}/env

setenv_file=${CONF_DIR-:/etc/tomcat7}/setenv.sh

[ -f $envfile ] &&
. $envfile &&
eval `cat $envfile|grep -v ^#|grep '='|cut -f1 -d'='|xargs echo export`

[ -f $setenv_file ] &&
. $setenv_file &&
eval `cat $setenv_file|grep -v ^#|grep '='|cut -f1 -d'='|xargs echo export`

source /etc/default/tomcat7 && 
exec /usr/share/tomcat7/bin/catalina.sh run
