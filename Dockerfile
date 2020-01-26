FROM centos:centos6

ENV nginxversion="1.16.1-1" \
    os="centos" \
    osversion="6" \
    mysqlPackage=mysql-community-server-minimal-5.6.47

RUN yum clean all &&\
    yum install -y wget openssl sed initscripts telnet php php-fpm &&\
    wget http://nginx.org/packages/$os/$osversion/x86_64/RPMS/nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    rpm -iv nginx-$nginxversion.el$osversion.ngx.x86_64.rpm &&\
    yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm https://repo.mysql.com/mysql-community-release-el7.rpm &&\
    yum-config-manager --enable mysql56-server-minimal &&\
    yum install -y $mysqlPackage libpwquality &&\
    yum clean all &&\
    mkdir /docker-entrypoint-initdb.d &&\
    service php-fpm start

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
VOLUME [ "/data/www" ]
EXPOSE 80

CMD ["/docker-entrypoint.sh"]
