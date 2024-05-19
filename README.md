# docker_lab7
* docker buildx build --platform linux/amd64,linux/arm64 --push --tag romanpozii/labtest:v7 --cache-to=type=registry,ref=romanpozii/labtest:cache,max_size=10GB --cache-from=type=registry,ref=romanpozii/labtest:cache -f Dockerfile .
