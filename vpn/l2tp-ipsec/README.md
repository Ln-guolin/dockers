运行 IPsec VPN 服务器
重要： 首先，在 Docker 主机上加载 IPsec af_key 内核模块。该步骤在 Ubuntu 和 Debian 上为可选步骤。

sudo modprobe af_key
为保证这个内核模块在服务器启动时加载，请参见以下链接： Ubuntu/Debian, CentOS 6, CentOS 7, Fedora 和 CoreOS。

使用本镜像创建一个新的 Docker 容器 （将 ./vpn.env 替换为你自己的 env 文件）：

docker run \
    --name ipsec-vpn-server \
    --env-file ./vpn.env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
获取 VPN 登录信息
如果你在上述 docker run 命令中没有指定 env 文件，VPN_USER 会默认为 vpnuser，并且 VPN_IPSEC_PSK 和 VPN_PASSWORD 会被自动随机生成。要获取这些登录信息，可以查看容器的日志：

docker logs ipsec-vpn-server
在命令输出中查找这些行：

Connect to your new VPN with these details:

Server IP: 你的VPN服务器IP
IPsec PSK: 你的IPsec预共享密钥
Username: 你的VPN用户名
Password: 你的VPN密码
（可选步骤）备份自动生成的 VPN 登录信息（如果有）到当前目录：

docker cp ipsec-vpn-server:/opt/src/vpn-gen.env ./
查看服务器状态
如需查看你的 IPsec VPN 服务器状态，可以在容器中运行 ipsec status 命令：

docker exec -it ipsec-vpn-server ipsec status
或者查看当前已建立的 VPN 连接：

docker exec -it ipsec-vpn-server ipsec whack --trafficstatus
