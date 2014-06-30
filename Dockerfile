FROM  ubuntu
RUN   groupdel www-data || true
RUN   userdel www-data || true
RUN   groupadd tomcat7 -g 8080
RUN   useradd tomcat7 -u 8080 -g 8080 -M -d /usr/share/tomcat7 -s /bin/false
RUN   apt-get update
RUN   DEBIAN_FRONTEND=noninteractive apt-get -y install tomcat7 supervisor
RUN   mkdir -p /var/log/supervisor
RUN   echo CATALINA_BASE=/var/lib/tomcat7 >> /etc/default/tomcat7
RUN   echo CATALINA_HOME=/usr/share/tomcat7 >> /etc/default/tomcat7
RUN   echo CATALINA_TMPDIR=/tmp/tomcat7-tomcat7-tmp >> /etc/default/tomcat7
ADD   . /opt/nicedocker
ADD   supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE  8080
CMD  ["/usr/bin/supervisord"]
