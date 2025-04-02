### Dockerfile

Dockerfile is declarative way of creating images. 

We can build the images and we can push to any docker repository.

#### How to build docker image
```
docker build -t image-name:version .
```

#### How to push docker image
```
docker login
```
```
docker push <URL>/<username>/<image-name>:version
```