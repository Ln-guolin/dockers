```
账户密码：admin/admin123

A，用nexus作为docker本地镜像仓库方法：


    1，首先登录nexus，地址：http://localhost:8081
    
    2，设置 >> Repository >> Repositories >> Create repository
    
    3，选择 docker(hosted)，做如下设置：
    
        name：自定义名称 ,如myDockerRepository
        Repository Connectors >> http：选中，并设置端口“5000”
        Allow anonymous docker pull：选中，允许匿名pull
        
        刚才选择的仓库类型解释：
            hosted : 本地存储，即同docker官方仓库一样提供本地私服功能
            proxy : 提供代理其他仓库的类型，如docker中央仓库
            group : 组类型，实质作用是组合多个仓库为一个地址
    4，确认创建，重新回到首页，此时Browse >> Search 下就会出现Docker仓库菜单
    
    5，配置Realms
  
        Security >> Realms 
        选择Docker Bearer Token Realm，移动到右边（Active）中
        
    6，由于不是https，所以需要配置/etc/docker/daemon.json
    {"insecure-registries":["http://localhost:5000"]}

B，验证docker仓库推送

    1，首先登录docker
     docker login http://localhost:5000
     admin/admin123
     
    2，测试push，执行脚本sh testtag.sh

    docker pull hello-world
    docker tag hello-world localhost:5000/hello-world:0.1
    docker push localhost:5000/hello-world:0.1


```