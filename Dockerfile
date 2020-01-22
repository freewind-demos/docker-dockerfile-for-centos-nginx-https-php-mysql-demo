FROM centos:centos6

ENV nginxversion="1.16.1-1" \
    os="centos" \
    osversion="6"

RUN yum clean all &&\
    yum install -y wget openssl sed initscripts php php-fpm &&\
    wget http://nginx.org/packages/$os/$osversion/x86_64/RPMS/nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    rpm -iv nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    yum clean all

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.php /data/www/index.php
VOLUME [ "/data/www" ]
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
