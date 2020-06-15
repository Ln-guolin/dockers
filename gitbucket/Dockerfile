FROM java:8-jre
MAINTAINER ln <root@soilove.cn>

ADD https://github.com/gitbucket/gitbucket/releases/download/4.31.2/gitbucket.war /opt/gitbucket.war

RUN ln -s /gitbucket /root/.gitbucket

VOLUME /gitbucket

# Port for web page
EXPOSE 8080
# Port for SSH access to git repository (Optional)
EXPOSE 29418
# 100M
ENV MAX_FILE_SIZE=104857600

CMD ["sh", "-c", "java -jar /opt/gitbucket.war --max_file_size=$MAX_FILE_SIZE"]