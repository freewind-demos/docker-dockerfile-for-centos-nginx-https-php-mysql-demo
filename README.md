Docker DockerFile for CentOs Nginx Demo
=======================================

Dockerfile中的第一个`yum clean all`是必要的，否则安装时会出错如下错误：

```
Errno 14 PYCURL ERROR 22 The requested URL returned error 403 Forbidden
```

```
docker build .
```

Notice the last output line:

```
Successfully built xxxxxx
```

Then run:

```
docker run -p 20080:80 \
  -v (pwd)/etc/nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf \
  -v (pwd)/etc/php-fpm.d/www.conf:/etc/php-fpm.d/www.conf \
  -v (pwd)/data/www:/data/www \
  xxxxx
```

Then visit: http://localhost:20080

---

Nginx error log: `/var/log/nginx/error.log`
