**错误**

1，连接数问题

MySql Host is blocked because of many connection errors; unblock with 'mysqladmin flush'

解决：
错误提示让我们使用mysqladmin flush来解决，不过登录mysql执行更方便，我们可以：
登录mysq >> flush hosts;

2，远程连接失败

Access denied for user 'root'@'101.69.254.214' (using password: YES)

解决：

grant all privileges on *.* to root@'%' with grant option;

flush privileges;
