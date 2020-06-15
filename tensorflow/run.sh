mkdir -p ~/docker-data/notebooks
docker run -it --rm -v $(realpath ~/docker-data/notebooks):/tf/notebooks --name tensorflow -p 8888:8888 tensorflow/tensorflow:1.13.2-py3-jupyter