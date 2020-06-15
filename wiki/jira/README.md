
**脚本指导步骤**
```

第一步，运行命令，启动容器和copy需要破解的jar
    docker-compose up -d
    sh do.sh

   
第二步，设置mysql编码方式，这里需要登录到容器内部

    a，运行命令，进入容器内部
    sh exec.sh
    
    b，下面的命令在容器内部执行
    mysql -uroot -p
    
    use mysql;   
    CREATE DATABASE jira CHARACTER SET utf8 COLLATE utf8_bin;   
    SET GLOBAL max_allowed_packet=256M;
    FLUSH PRIVILEGES;
    exit;
    
    
    可参考：
    修改/etc/my.cnf配置
    [mysqld]
    innodb_log_file_size=256M
    max_allowed_packet=256M
    default-storage-engine=INNODB

    
    验证是否修改成功
    SELECT @@max_allowed_packet;
    SELECT @@innodb_log_file_size;

第三步，继续到浏览器操作，配置数据库，继续下一步，进入到许可证填写界面

    数据库：
        选择mysql版本，其他的安装实际情况填写即可
    
    许可证：

        a，选择输入框下面的"生成jira使用许可证"
        b，登录站点，也可以使用google账号登录，不过需要翻墙
        c，进入页面后，注意下面的信息填写
        
            product: JIRA Software
            License type: Jira Software(server)
            Organization: 随便填写
            Your instance is: up and running
            Server ID: 前面的id，通常会自动copy过来
        
        然后点击确认后，页面会跳转，并且许可证会自动填写到输入框中。

    然后继续下面的引导完成安装即可，验证是否破解成功？
 
     设置 >> 应用程序 >> 版本和许可：
        用户：无限
        使用期间：2033年
     表示破解成功！

```