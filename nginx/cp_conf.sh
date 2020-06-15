mkdir -p /my/own/nginx/conf.d
mkdir -p /my/own/nginx/log
mkdir -p /my/own/nginx/www

docker run --name tmp-nginx-container -d nginx
docker cp tmp-nginx-container:/etc/nginx/nginx.conf /my/own/nginx/conf.d/nginx.conf
docker rm -f tmp-nginx-container