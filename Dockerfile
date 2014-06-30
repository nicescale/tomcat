FROM  ubuntu
RUN   groupdel www-data || true
RUN   userdel www-data || true
RUN   groupadd tomcat6 -g 8080
RUN   useradd tomcat6 -u 8080 -g 8080 -M -d /usr/share/tomcat6 -s /bin/false
RUN   apt-get update
RUN   DEBIAN_FRONTEND=noninteractive apt-get -y install tomcat6 supervisor
RUN   mkdir -p /var/log/supervisor
RUN   echo CATALINA_BASE=/var/lib/tomcat6 >> /etc/default/tomcat6
RUN   echo CATALINA_HOME=/usr/share/tomcat6 >> /etc/default/tomcat6
RUN   echo CATALINA_TMPDIR=/tmp/tomcat6-tomcat6-tmp >> /etc/default/tomcat6
ADD   . /opt/nicedocker
ADD   supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE  8080
CMD   ["/usr/bin/supervisord"]

