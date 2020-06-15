# 登录管理节点，添加监控
docker service create \
--name=viz \
--publish=8383:8080/tcp \
--constraint=node.role==manager \
--mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
dockersamples/visualizer