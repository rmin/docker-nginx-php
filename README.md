# docker-nginx-php

## Usage
Run PHPUnit tests and build the sample application image on your workstation:
```
docker build -t docker-nginx-php .
...
PHPUnit 6.5.6 by Sebastian Bergmann and contributors.
.                                                                   1 / 1 (100%)
Time: 44 ms, Memory: 4.00MB
OK (1 test, 1 assertion)
...
Successfully built 3e489eb1541e
```
Now you can start a container using the image:
```
docker run -p 80:80/tcp docker-nginx-php
```
If you open http://localhost on your browser, you should be able to see the phpinfo page.

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

## License
MIT License

Copyright (c) 2018 @rmin
