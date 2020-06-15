
**脚本指导步骤**
```
第一步，运行命令，启动容器和copy需要破解的jar
    docker-compose up -d
    sh copy_down.sh

    然后，浏览器打开地址：" http://localhost:18090 "
    a，选择"Production Installation" 下一步
    b，不要选择 下一步


第二步，运行命令，打开破解工具UI
    sh open_kengen.sh


第三步，根据下面的步骤进行密钥生成
    a，在打开的界面中，填入 自定义的"name"和Confluence License key界面的"Server ID"，
 
    b，点击".gen"按钮，然后把生成的key， copy到Confluence界面中，先不要点击下一步，破解过程还没有结束
 
    c，然后点击 ".patch"按钮，选择刚刚修改名称的jar包，此时如果提示成功，会生成备份文件atlassian-extras-2.4.bak
       和破解好的atlassian-extras-2.4.jar两个文件

第四步，运行命令，将破解文件copy到容器中，同时拷贝mysql驱动到容器中，并重新运行运行容器
    sh copy_up.sh
    
    注意：需要先到容器目录/opt/atlassian/confluence/confluence/WEB-INF/lib，查询看看是否已经存在mysql驱动了
    
    docker-compose restart

    然后，到浏览器上点击下一步
    
第五步，设置mysql编码方式，这里需要登录到容器内部

    a，运行命令，进入容器内部
    sh exec.sh
    
    b，下面的命令在容器内部执行
    mysql -uroot -p
    
    use mysql;
    CREATE DATABASE confluence DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
    exit;
    
    可参考：
    修改./conf/my.cnf配置
    [mysqld]
    max_allowed_packet = 256M
    character-set-server=utf8
    collation-server=utf8_bin
    default-storage-engine=INNODB
    innodb_log_file_size=1GB
    transaction-isolation=READ-COMMITTED
    binlog_format=row

    
    验证是否修改成功
    SELECT @@tx_isolation;
    SELECT @@max_allowed_packet;
    SELECT @@innodb_log_file_size;
    show VARIABLES like '%char%';

第六步，继续到浏览器操作，配置数据库
    a，选择"My own database"
    b，选择mysql数据源进行配置启用，请注意：使用宿主机ip+暴露的端口，localhost和127.0.0.1都在容器内部
    
    建议：mysql连接的时候最好选择字符串的方式，可以指定时间和编码方式
    jdbc:mysql://10.1.16.22:13306/confluence?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai
  
  
  然后继续下面的引导完成安装即可，验证是否破解成功？
    设置 >> 一般配置  >> 授权细节：
        用户：无限
        使用期间：2337到期
     表示破解成功！

```

