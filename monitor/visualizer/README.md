
```

 ┌Help───────────────────────────────────────────────────────────────┐          
 │                                                                   │
 │  集群监控                                                          │   
 │                                                                   │ 
 │                                                                   │ 
 └───────────────────────────────────────────────────────────────────┘ 
          
  登录h1初始化集群：
  docker swarm init --advertise-addr ip地址
  
  分别登录h2和h3，执行上面输出的join命令的添加到swarm集群
  
  docker swarm join --token SWMTKN-1-2lk16l2cjvporghr3g1kg6orjrotq682axu2yc0kjm5aepvois-br6bpyng0bvqg2jqcn4ud3cvs 192.168.64.5:2377
  
  输出：
  This node joined a swarm as a worker.
  
  后续，如果需要查看添加节点的token和命令，可以使用如下命令：
  
  docker swarm join-token worker
  
  
  
  移除集群节点
  
  a，在需要退出的节点上操作下面命令down掉节点，如需强制退出，可添加参数“-f”，如：
  docker swarm leave -f
  
  b，到主节点上“docker node ls”列出所有节点，根据id使用命令“docker node rm <id>”删除节点即可，如：
  docker node rm <ID>
  
  
  
  
  查看服务部署情况，可以使用下面两个命令
  
  docker service ls
  
  
  
  服务扩容，我们通过scale命令可以针对集群的服务进行扩容和缩减，控制的数量为当前集群的指定服务数量，一切都变的那么自然，可控。
  如：
  docker service scale nginx=3
  
  
  
  
  
  常用命令
  docker swarm
  
  docker swarm init #初始化集群
  docker swarm join-token worker #查看工作节点的 token
  docker swarm join-token manager #查看管理节点的 token
  docker swarm join #加入集群中
  
  docker node
  
  docker node ls #查看所有集群节点
  docker node rm #删除某个节点（-f强制删除）
  docker node inspect #查看节点详情
  docker node demote #节点降级，由管理节点降级为工作节点
  docker node promote #节点升级，由工作节点升级为管理节点
  docker node update #更新节点
  docker node ps #查看节点中的 Task 任务
  
  docker service
  
  docker service create #部署服务
  docker service inspect #查看服务详情
  docker service logs #产看某个服务日志
  docker service ls #查看所有服务详情
  docker service rm #删除某个服务（-f强制删除）
  docker service scale #设置某个服务个数
  docker service update #更新某个服务

                                                                       
   ```                                  