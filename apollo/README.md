部署文档
```
1，数据库配置
>> /db/sql/
    a，注册中心修改，apolloconfigdb.sql中的下面配置：
    
    # ----------------------参数配置 start-------------------------------------
    -- 注册中心地址
    set @confAddr='http://10.1.16.22:18080/eureka/';
    # -----------------------参数配置 end------------------------------------
    
    b，配置中心环境修改，apolloportaldb.sql中的下面配置：
    
    # ----------------------参数配置 start-------------------------------------
    -- 配置中心环境
    set @envs='dev';
    # -----------------------参数配置 end------------------------------------

2，数据库，端口/密码配置
>> /db/
    打开docker-compose.yml，修改MYSQL_ROOT_PASSWORD和ports即可

    
3，服务配置
>> /
    docker-compose.yml里面配置的地方都需要进行修改


服务启动后的默认登录账户：apollo/admin
```

数据库docker-compose.yml

```
目录结构如下：
        db/
            docker-compose.yml
            sql/
                apolloconfigdb.sql
                apolloportaldb.sql
```    
数据库yml文件具体内容
```
version: '3'

services:

  apollo-db:
    image: mysql:5.7
    container_name: apollo-db
    command: --default-authentication-plugin=mysql_native_password
    environment:
      TZ: Asia/Shanghai
      #MYSQL_ALLOW_EMPTY_PASSWORD: 'yes'
      MYSQL_ROOT_PASSWORD: apollo123Pwd
    ports:
      - "3306:3306"
    volumes:
      - apollomysqldata:/var/lib/mysql
      - ./sql:/docker-entrypoint-initdb.d
volumes:
  apollomysqldata:
```


服务docker-compose.yml

```
version: '3'

services:
  apollo-portal:
    image: guolin123/apollo-portal:v1.4.0
    restart: unless-stopped
    container_name: apollo-portal
    volumes:
     - '/tmp/logs:/opt/logs'
    ports:
     - "8070:8070"
    environment:
     # 注意修改数据库连接IP/用户名/密码配置
     - spring_datasource_url=jdbc:mysql://10.1.16.22:3306/ApolloPortalDB?characterEncoding=utf8
     - spring_datasource_username=root
     - spring_datasource_password=apollo123Pwd
     # meta server配置，配置参考，如切换到pro，则为-Dpro_meta，后面的地址为configservice的地址
     - JAVA_OPTS="-Ddev_meta=http://10.1.16.22:18080"
    depends_on:
     - apollo-configservice
     - apollo-adminservice


  apollo-configservice:
    image: guolin123/apollo-configservice:v1.4.0
    restart: unless-stopped
    container_name: apollo-configservice
    volumes:
     - '/tmp/logs:/opt/logs'
    ports:
     - "18080:8080"
    environment:
     # 注意修改数据库连接IP/用户名/密码配置
     - spring_datasource_url=jdbc:mysql://10.1.16.22:3306/ApolloConfigDB?characterEncoding=utf8
     - spring_datasource_username=root
     - spring_datasource_password=apollo123Pwd
     # docker默认会注册内部的ip到eureka中，所以部署到外网后会导致client无法访问，需要指定ip或ip+端口，下面2种方式
     #- JAVA_OPTS="-Deureka.instance.ip-address=10.1.16.22"
     - JAVA_OPTS="-Deureka.instance.homePageUrl=http://10.1.16.22:18080"



  apollo-adminservice:
    image: guolin123/apollo-adminservice:v1.4.0
    restart: unless-stopped
    container_name: apollo-adminservice
    volumes:
     - '/tmp/logs:/opt/logs'
    ports:
     - "18090:8090"
    environment:
     # 注意修改数据库连接IP/用户名/密码配置
     - spring_datasource_url=jdbc:mysql://10.1.16.22:3306/ApolloConfigDB?characterEncoding=utf8
     - spring_datasource_username=root
     - spring_datasource_password=apollo123Pwd
     # docker默认会注册内部的ip到eureka中，所以部署到外网后会导致client无法访问，需要指定ip或ip+端口，下面2种方式
     #- JAVA_OPTS="-Deureka.instance.ip-address=10.1.16.22"
     - JAVA_OPTS="-Deureka.instance.homePageUrl=http://10.1.16.22:18090"
    depends_on:
     - apollo-configservice




```