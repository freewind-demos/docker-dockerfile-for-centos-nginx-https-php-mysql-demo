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
docker run -p 20080:80 xxxxx
```

Then visit: http://localhost:20080

