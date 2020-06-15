FROM openresty/openresty:1.15.8.1-2-centos

MAINTAINER ln <root@soilove.cn>

# 创建临时目录
RUN mkdir -p /usr/local/openresty/nginx/client_body_temp


### update glibc-common for locale files
RUN yum update -y glibc-common

# 安装wget，用于下载，安装网络包，支持netstat命令
RUN yum install -y wget && yum install -y net-tools

# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no
RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
#安装openssh-clients
RUN yum  install -y openssh-clients

# 清理软件包
RUN yum clean all

# 添加测试用户root，密码root，并且将此用户添加到sudoers里
RUN echo "root:root" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers

# 下面这两句比较特殊，在centos6上必须要有，否则创建出来的容器sshd不能登录
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key

# 启动sshd服务并且暴露22端口
RUN mkdir /var/run/sshd
EXPOSE 22

CMD nohup sh -c '/usr/local/openresty/bin/openresty && /usr/sbin/sshd -D'



