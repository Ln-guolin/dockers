cp ../main.go ./main.go
docker build -t go-webapp01:v0.0.1 .
rm -rf ./main.go