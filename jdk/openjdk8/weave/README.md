```
weave管理docker容器网络

环境：

 宿主机器：10.1.16.17 ，dokcer容器：server-001，server-002
 

1，安装weave：
sudo curl -L git.io/weave -o /usr/local/bin/weave
sudo chmod a+x /usr/local/bin/weave

方法2：
yum -y install ethtool libnetfilter_conntrack
cd /opt; git clone https://github.com/zettio/weave.git
cd weave; chmod +x weave


2，启动weave路由：
weave launch

3，如果是centos，继续安装bridge-utils：
yum install -y bridge-utils 
brctl show


4，正常docker命令启动容器，server-001，server-002，禁用docker自己的网络
docker run -d -p 22001:22 --net=none --name server-001 guolin123/openjdk:v1.8.0
docker run -d -p 22002:22 --net=none --name server-002 guolin123/openjdk:v1.8.0

5，使用weave给容器绑定ip
weave attach 172.28.0.1/24 server-001
weave attach 172.28.0.2/24 server-002


6，与宿主机网络通信，设置一个网络作为桥接

weave expose 172.28.0.111/24

然后，就可以在宿主机器上ping 通里面的ip了


7，物理机之间容器互通:
如果你另一台机器上也安装了docker，那么可以使用此命令进行连接，比如：
weave connect 10.1.16.18/24




```