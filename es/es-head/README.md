连不上es的情况，需要在es中进行如下配置
路径：
登录容器 >> config/elasticsearch.yml

内容：
http.cors.enabled: true
http.cors.allow-origin: "*"