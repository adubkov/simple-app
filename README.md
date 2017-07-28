# Simple app

There are two solutions in this repo. First in a more common way - `vagrant`+`salt`.
But because vagrant is mostly used as a local playgroud, I assume that real purpose of that internal service, is just for local code testing. And therefore I would use different solution for that.

## Vagrant solution

### Requiremets
You have to have `virtualbox` and `vagrant` installed on your system.

### How to use




## Docker solution

### Requirements
You have to have `docker-ce` and `docker-compose` installed on your system.

### How to use
First we have to build our simple app container. I did wrapp it up with small bash script.

#### build
This will build `app` container which contains just nodejs engine. Later when it will be used 
it will have `docker/assets/app/` mounted to `/opt/app` and will execute `node /opt/app/app.js` to start the app.

You can replace nodejs engine in this container with any other interpreter.

```
cd ./docker && ./control build 
```

#### start\stop

Same `control` script used for start and stop all services in specific order, which is defined in `compose.yaml` file.

Start:
```
$ ./control start
```

Stop:
```
$ ./control stop
```
