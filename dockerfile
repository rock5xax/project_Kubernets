FROM centos:latest
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page293/vertex.zip /var/www/html/
WORKDIR /var/ww/html/
RUN unzip vertex.zip
RUN cp -rvf vertex.zip
RUN rm -rf vertex vertex.zip
CMD [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
EXPOSE 80
