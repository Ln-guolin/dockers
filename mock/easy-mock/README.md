https://github.com/Ln-guolin/easy-mock-docker

一个可视化, 并且能快速生成模拟数据的持久化服务。官网：https://easy-mock.com 



常见错误处理：


server started at http://0.0.0.0:7300
events.js:182
      throw er; // Unhandled 'error' event
Error: EACCES: permission denied, open 'logs/2019-04-21-info.log'
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! easy-mock@1.6.0 start: `cross-env NODE_ENV=production node app`
npm ERR! Exit status 1


解决办法
chmod 777 /home/*/logs






