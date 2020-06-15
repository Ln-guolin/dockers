该vm.max_map_count内核设置需要至少设置为262144用于生产。根据您的平台：

Linux的

该vm.max_map_count设置应在/etc/sysctl.conf中永久设置：

$ grep vm.max_map_count /etc/sysctl.conf
vm.max_map_count = 262144
要在实时系统类型上应用该设置： sysctl -w vm.max_map_count=262144

使用Docker for Mac的 macOS

vm.max_map_count必须在xhyve虚拟机中设置该设置：

$ screen~ / Library / Containers / com.docker.docker / Data / vms / 0 / tty
只需按Enter键并像配置sysctlLinux一样配置设置：

sysctl -w vm.max_map_count = 262144
Windows和macOS与Docker Toolbox

vm.max_map_count必须通过docker-machine设置该设置：

docker-machine ssh
sudo sysctl -w vm.max_map_count = 262144