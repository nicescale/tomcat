FROM  ubuntu
RUN   groupdel www-data || true
RUN   userdel www-data || true
RUN   groupadd tomcat7 -g 8080
RUN   useradd tomcat7 -u 8080 -g 8080 -M -d /usr/share/tomcat7 -s /bin/false
RUN   apt-get update
RUN   DEBIAN_FRONTEND=noninteractive apt-get -y install tomcat7
RUN   echo CATALINA_BASE=/var/lib/tomcat7 >> /etc/default/tomcat7
RUN   echo CATALINA_HOME=/usr/share/tomcat7 >> /etc/default/tomcat7
RUN   echo CATALINA_TMPDIR=/tmp/tomcat7-tomcat7-tmp >> /etc/default/tomcat7
ADD   . /opt/nicedocker
EXPOSE  8080
CMD  . /etc/default/tomcat7 && /usr/share/tomcat7/bin/catalina.sh run

