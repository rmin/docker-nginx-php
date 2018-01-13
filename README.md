# docker-nginx-php

## Usage
Build and run the sample application on your workstation:
```
docker build -t docker-nginx-php .
docker run -p 80:80/tcp docker-nginx-php
```
If you open http://localhost on your browser, you can see the phpinfo page.

#### Development
You can mount the ```application``` directory from your workstation:
```
docker run -p 80:80/tcp -v /absolute/path/to/application/:/var/www/ docker-nginx-php
```

#### Docker Image
Docker Image is available on Docker Hub [rmin/docker-nginx-php](https://hub.docker.com/r/rmin/docker-nginx-php/).
```
docker run -p 80:80/tcp rmin/docker-nginx-php
```