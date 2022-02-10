# rotating-proxy

## Usage

```bash
$ git clone https://github.com/wavvs/rotating-proxy

# build docker container
$ docker build -t wavvs/rotating-proxy:latest .

# start docker container
$ docker run -d -p 5566:5566 -p 4444:4444 --env tors=25 wavvs/rotating-proxy

# specify country
$ docker run -d -p 5566:5566 -p 4444:4444 --env tors=25 --env exitnodes='us,nl,ru' wavvs/rotating-proxy

# test with ...
$ curl --proxy 127.0.0.1:5566 https://api.my-ip.io/ip

# monitor
http://127.0.0.1:4444/haproxy?stats
```
