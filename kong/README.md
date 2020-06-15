api 网关服务
基于：openresty + lua

https://docs.konghq.com/install/docker/

启动顺序：

network.sh

database.sh

migrations.sh

kong.sh

dashboard.sh

<pre>
Compatibility matrix
Kong-Dashboard versions	Kong versions	Node versions
1.x.x	        >= 0.6, < 0.10	           wu
2.x.x	        0.10	                   wu
3.0.x	        >= 0.9, <0.12	           >= 6.0.0
3.1.x, 3.2.x	>= 0.9, <0.13	           >= 6.0.0
3.3.x, 3.4.x	>= 0.9, <0.14	           >= 6.0.0
3.5.x	        >= 0.9, <0.15	           >= 6.0.0
3.6.x	        >= 0.9, <2.0.0	           >= 6.0.0
</pre>


ui管理：
https://github.com/pantsel/konga
https://hub.docker.com/r/pantsel/konga
