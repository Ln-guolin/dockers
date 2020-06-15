# 替换破解文件
docker cp atlassian-extras-3.2.jar jira-server:/opt/atlassian/jira/atlassian-jira/WEB-INF/lib/
# 重启容器
docker restart jira-server