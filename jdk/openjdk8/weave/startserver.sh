echo "启动容器..."
docker run -d -p 22001:22 --net=none --name server-001 guolin123/openjdk:v1.8.0
docker run -d -p 22002:22 --net=none --name server-002 guolin123/openjdk:v1.8.0
docker run -d -p 22003:22 --net=none --name server-003 guolin123/openjdk:v1.8.0
echo "清理ip..."
weave hide 172.28.0.1/24
weave hide 172.28.0.2/24
weave hide 172.28.0.3/24
weave hide 172.28.0.111/24
echo "绑定固定ip..."
weave attach 172.28.0.1/24 server-001
weave attach 172.28.0.2/24 server-002
weave attach 172.28.0.3/24 server-003
echo "设置桥接网络！"
weave expose 172.28.0.111/24
echo "执行成功！"
