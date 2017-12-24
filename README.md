## Build image

```
docker build -t ihomeautomate/irserver .
```

## Run container

```
docker run -p 8081:8081 -p 21000:21000 -p 21000:21000/udp -it --rm ihomeautomate/irserver -timestamp -http_port 8081 -loglevel 4 <irtrans lan device ip>
```

## Want to get into the shell ...
```
docker run -p 21000:21000 -p 21000:21000/udp -it --rm --entrypoint=/bin/bash ihomeautomate/irserver
```

### So you can play around with ...

```
/usr/local/irtrans/irserver64 -timestamp -loglevel 4 -debug_code -http_port 8081 <irtrans lan device ip>
```

or 

```
/usr/local/irtrans/irclient64 localhost <remote> <command>
```