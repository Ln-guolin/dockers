# 拷贝数据库连接
docker cp ./mysql-connector-java-5.1.46-bin.jar confluence-server:/opt/atlassian/confluence/confluence/WEB-INF/lib
rm atlassian-extras-2.4.bak
mv atlassian-extras-2.4.jar atlassian-extras-decoder-v2-3.4.1.jar
# 拷贝破解的文件
docker cp ./atlassian-extras-decoder-v2-3.4.1.jar confluence-server:/opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.4.1.jar
rm atlassian-extras-decoder-v2-3.4.1.jar
