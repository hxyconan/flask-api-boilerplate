# Flask Restful API boilerplate application in docker flavour

## Intro
- Nginx installed for recevicing request from port 80
- uwsgi installed as gateway between Nginx and Python web application
- `app` folder including Flask codes for API requests
- Two running modes available as `production` and `development`
- `Production` mode serves requests via Nginx and uwsgi
- `Development` mode start the application via `python app.py` and you can debug code change without restart
- Extra docker containers could add into docker-compose.yml file if required, for example, mysql, redis etc.

## Specification
- Docker image based on `alpine:3.10`
- Python 2.7 will be installed
- Proxy url configured in Dockerfile Environment variable if you behind coperate firewall

## How to run
- Run as `development` mode:
```
docker-compose -f docker-compose.yml -f docker-compose.development.yml up --build
```
- Run as `production` mode:
```
docker-compose -f docker-compose.yml -f docker-compose.production.yml up --build
```
- Check docker compose configuration
```
docker-compose -f docker-compose.yml -f docker-compose.development.yml config
docker-compose -f docker-compose.yml -f docker-compose.production.yml config
```
- Stop and remove all containers
```
./cleanup.sh
```
- When you want to debug multiple containers, run as:
```
./build-dev-service.sh [CONTAINER_NAME]
```

## How to visit
- `http://127.0.0.1:8016/` if running as `development` mode
- `http://127.0.0.1:8006/` if running as `production` mode
 
## Reference
- https://github.com/jazzdd86/alpine-flask
- https://medium.com/@daniel.carlier/how-to-build-a-simple-flask-restful-api-with-docker-compose-2d849d738137

