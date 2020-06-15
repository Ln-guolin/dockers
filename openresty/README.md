基本信息
```
容器基于：centos7-openresty
容器安装内容：
    nettool
    ssh
    wget
    
ssh用户密码：root/root

宿主机器连接：ssh -p 22001 root@127.0.0.1
```
目录结构：
```
docker-compose.yml
config/nginx.conf
```

nginx.conf：
```
worker_processes  1;
error_log logs/error.log;
events {
    worker_connections 1024;
}
http {
    server {
        listen 80;
        location / {
            default_type text/html;
            content_by_lua '
                ngx.say("<p>hello, world! openresty.yes</p>")
            ';
        }
    }
}
```

docker-compose
```
version: "3"
services:
  centos-openresty:
      image: guolin123/openresty:1.15.8.1-2-centos
      restart: unless-stopped
      container_name: centos-openresty
      privileged: true
      ports:
        - '22001:22'
        - '8080:80'
      volumes:
        - './logs:/usr/local/openresty/nginx/logs'
        - './config/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro'
```

启动容器

```
docker-compose up -d
```