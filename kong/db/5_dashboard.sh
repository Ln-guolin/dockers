docker run -d --rm -p 1180:8080  --network kong-net --name kong-dashboard pgbi/kong-dashboard:latest start \
  --kong-url http://kong:8001 \
  --basic-auth user1=password1 user2=password2