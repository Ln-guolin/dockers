```
启动流程：

    1，执行 env_linux.sh / env_mac.sh 获取密钥
    
    2，执行docker-compose up -d启动jumpserver
    
    3，浏览器输入 http://localhost:2280访问后台
    
    管理员用户名/密码： admin/admin
    
    注意：环境迁移和更新升级请检查 SECRET_KEY 是否与之前设置一致, 不能随机生成, 否则数据库所有加密的字段均无法解密


使用流程：

a，用户相关；

    1，用户管理 --> 创建组
        新建用户分组：prod-group / test-group
       
    2，用户管理 --> 用户列表
        创建用户：填写名称，用户名，邮箱，然后选择上面我们创建的分组，可以单选/多选
        密码策略选择"设置密码"，填写用户的登陆密码，新用户后面根据这个密码进行jumpserver的登陆

b，资产相关：

    1，资产管理 --> 管理用户
        注：用来管理jumpserver等机器，获取硬件等信息的用户
        创建管理用户：输入名称，用户名，密码信息 然后保存即可
         
    2，资产管理 --> 系统用户
        注：用来ssh登陆服务器的用户
        创建系统用户：填写名称，用户名
        登陆模式选择：自动登陆
        协议：ssh
        认证：去掉自动生产密钥的选项，填写用户的密码
        然后，保存即可
        
    
    3，资产管理 --> 资产列表
        注：管理我们的服务器资源
        创建资产：
            基本信息：输入主机名(自定义),ip,系统平台
            认证：选择我们创建的管理用户
            节点：选择这个资产应该所属的节点
        然后，保存即可
        
    4，权限管理 --> 资产授权
        注：主要资产对用户和用户组的授权，只有授权过后的用户和用户组才能真正的看到和连接服务器
        创建授权规则：
            基本：填写名称
            用户：选择用户组(这里有用户和用户组两个输入框，一个是单用户授权，一个是用户组的所有用户授权)
            资产：选择节点(这里有资产和节点两个输入框，一个是单资产授权，一个是节点的所有资产授权)，选择对应的系统用户
        然后，保存即可
  
c，命令过滤：

    注：为了保护服务器安全，可以对一些危险操作进行过滤，如:"rm -rf /"
    1，创建命令过滤器：填写名称，保存即可
    2，规则：点击创建规则，输入需要禁用命令，选择禁用，保存规则
    3，用户：选择规则需要应用的系统用户

d，使用相关：

    1，登陆我们新建的用户
    
    2，根据步骤进行认证，第二步 ssh公钥 选择自动配置并下载，其他的都直接点击下一步即可
    
    3，选择机器进行连接即可
    
```