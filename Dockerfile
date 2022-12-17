#update os
FROM centos:7

#install packesges
RUN yum install telnet -y && \
    yum install httpd httpd-tools -y && \
    yum install wget -y && \
    yum install unzip -y

#open port 80
EXPOSE 80

#copy file into webserver
COPY index.html /var/www/html/index.html
RUN chmod 755 /var/www/html/index.html

#keep application alive
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]