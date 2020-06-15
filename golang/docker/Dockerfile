FROM golang:1.12.6-alpine
#FROM golang:1.12.6

MAINTAINER ln <root@soilove.cn>

# 设置工作路径
WORKDIR /

# 添加文件
ADD ./main.go /

# build
RUN go build /main.go

# 暴露容器内部端口
EXPOSE 3000

# 启动
ENTRYPOINT ["/main"]