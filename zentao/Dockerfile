FROM ubuntu:trusty

ADD   http://dl.cnezsoft.com/zentao/11.5/ZenTaoPMS.11.5.stable.zbox_64.tar.gz  /tmp
COPY  ./boot.sh   /usr/local/boot.sh
RUN   chmod +x    /usr/local/boot.sh

ENTRYPOINT  ["/usr/local/boot.sh"]