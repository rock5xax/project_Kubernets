FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
RUN yum -y install appstream-data
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/vertex.zip /var/www/html/
WORKDIR /var/www/html/
RUN cd /var/www/html/
RUN unzip vertex.zip
RUN cp -rvf vertex.zip
RUN rm -rf vertex vertex.zip
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
EXPOSE 80 22
